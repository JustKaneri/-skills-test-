using System.ComponentModel.DataAnnotations;

namespace Skills_test_1.Dto
{
    public class CreatorOrderDto
    {
        [Required]
        public int UserId { get; set; }
        [Required]
        public int ProductId { get; set; }
        [Required]
        public int Count { get; set; }
        public DateTime? Date_Order { get; set; }
    }
}
