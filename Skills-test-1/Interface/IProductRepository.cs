using Skills_test_1.Models;

namespace Skills_test_1.Interface
{
    public interface IProductRepository
    {
        public Task<List<Product>> GetProducts();

        public Task<Product> DeleteProduct(int idProduct);
    }
}
