using System.Text.Json.Serialization;

namespace Skills_test_1.Models
{
    public class User
    {
        public int Id { get; set; } 
        public string Name { get; set; }

        [JsonIgnore]
        public ICollection<Order> Orders { get; set; }
    }
}
