
namespace Skills_test_1.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public int Count { get; set; }
        public DateTime? Date_Order { get; set; }
        public User User { get; set; }
        public Product Product { get; set; }
    }
}
