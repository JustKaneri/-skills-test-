using System.Text.Json.Serialization;

namespace Skills_test_1.Models
{
    public class Product
    {
        public int Id{ get; set; }
        public string Name { get; set; }
        public int Count { get; set; }
        public double Price { get; set; }

        [JsonIgnore]
        public ICollection<Order> Orders { get; set; }
    }
}
