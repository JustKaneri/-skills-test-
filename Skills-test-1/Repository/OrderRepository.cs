using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Skills_test_1.Data;
using Skills_test_1.Dto;
using Skills_test_1.Interface;
using Skills_test_1.Models;

namespace Skills_test_1.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public OrderRepository(DataContext context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        /// <summary>
        /// Create new Order in Db
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public async Task<Order> CreateOrder(CreatorOrderDto order)
        {
            var newOrder = _mapper.Map<Order>(order);

            var user = await _context.User.FindAsync(newOrder.UserId);
            if (user == null)
                return null;

            var product = await _context.Product.FindAsync(newOrder.ProductId);
            if (product == null)
                return null;

            if (product.Count < newOrder.Count)
                return null;

            if (newOrder.Date_Order == null)
                newOrder.Date_Order = DateTime.Now;

            product.Count -= newOrder.Count;

            _context.Product.Update(product);
            await _context.SaveChangesAsync();

            _context.Order.Add(newOrder);
            await _context.SaveChangesAsync();

            return newOrder;
        }

        /// <summary>
        /// Delete order from db
        /// </summary>
        /// <param name="idOrder"></param>
        /// <returns></returns>
        public async Task<Order> DeleteOrder(int idOrder)
        {
            var order = await _context.Order.Include(p => p.Product)
                                            .Include(u => u.User)
                                            .Where(o => o.Id == idOrder)
                                            .FirstOrDefaultAsync();

            if (order == null)
                return null;

            _context.Order.Remove(order);
            await _context.SaveChangesAsync();

            return order;
        }

        /// <summary>
        /// Get all order from db
        /// </summary>
        /// <returns></returns>
        public async Task<List<Order>> GetOrders()
        {
            var orders = await _context.Order.Include(p=>p.Product)
                                             .Include(u => u.User)
                                             .ToListAsync();

            return orders;
        }
    }
}
