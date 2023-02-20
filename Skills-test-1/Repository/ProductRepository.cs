using Microsoft.EntityFrameworkCore;
using Skills_test_1.Data;
using Skills_test_1.Interface;
using Skills_test_1.Models;

namespace Skills_test_1.Repository
{
    public class ProductRepository : IProductRepository
    {
        private readonly DataContext _context;

        public ProductRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<Product> DeleteProduct(int idProduct)
        {
            Product deletingProduct = await _context.Product.Where(pr => pr.Id == idProduct).FirstOrDefaultAsync();

            if (deletingProduct == null)
                return null;

            var orders = await _context.Order.Where(p => p.ProductId == deletingProduct.Id).ToListAsync();

            if (orders.Count > 0)
                return null;

            _context.Product.Remove(deletingProduct);
            await _context.SaveChangesAsync();

            return deletingProduct;
        }

        public async Task<List<Product>> GetProducts()
        {
            var products = await _context.Product.ToListAsync();

            return products;
        }
    }
}
