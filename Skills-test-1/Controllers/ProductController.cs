using Microsoft.AspNetCore.Mvc;
using Skills_test_1.Interface;
using Skills_test_1.Models;

namespace Skills_test_1.Controllers
{
    [ApiController]
    [Route("api")]
    public class ProductController : Controller
    {
        private readonly IProductRepository _repository;

        public ProductController(IProductRepository repository)
        {
            _repository = repository;
        }

        [HttpGet("products")]
        [ProducesResponseType(200,Type =typeof(IEnumerable<Product>))]
        public async Task<IActionResult> GetAllProduct() 
        {
            var products = await _repository.GetProducts();

            if(products.Count == 0)
                return NotFound();

            return Ok(products);
        }

        [HttpDelete("product/{id}")]
        [ProducesResponseType(200,Type =typeof(Product))]
        public async Task<IActionResult> DeletProduct(int id)
        {
            var product = await _repository.DeleteProduct(id);

            if (product == null)
                return BadRequest();

            return Ok(product);
        }
    }
}
