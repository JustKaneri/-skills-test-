using Skills_test_1.Models;
using Skills_test_1.Dto;

namespace Skills_test_1.Interface
{
    public interface IOrderRepository
    {
        public Task<List<Order>> GetOrders();

        public Task<Order> CreateOrder(CreatorOrderDto order);

        public Task<Order> DeleteOrder(int idOrder);
    }
}
