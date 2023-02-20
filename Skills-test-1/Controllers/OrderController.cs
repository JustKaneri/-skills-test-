using Microsoft.AspNetCore.Mvc;
using Skills_test_1.Dto;
using Skills_test_1.Interface;
using Skills_test_1.Models;

namespace Skills_test_1.Controllers
{
    [ApiController]
    [Route("api")]
    public class OrderController : Controller
    {
        private readonly IOrderRepository _repository;

        public OrderController(IOrderRepository repository)
        {
            _repository = repository;
        }

        [HttpGet("orders")]
        [ProducesResponseType(200, Type = typeof(IEnumerable<Order>))]
        public async Task<IActionResult> GetAllOrder()
        {
            var orders = await _repository.GetOrders();

            if (orders.Count == 0)
                return NotFound();

            return Ok(orders);
        }

        [HttpPost("order")]
        [ProducesResponseType(200, Type = typeof(Order))]
        public async Task<IActionResult> CreateOrder(CreatorOrderDto order)
        {
            var result = await _repository.CreateOrder(order);

            if (result == null)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpDelete("order/{id}")]
        [ProducesResponseType(200, Type = typeof(Order))]
        public async Task<IActionResult> CreateOrder(int id)
        {
            var result = await _repository.DeleteOrder(id);

            if (result == null)
                return BadRequest(result);

            return Ok(result);
        }
    }
}
