using Skills_test_1.Models;
using Skills_test_1.Dto;
using Profile = AutoMapper.Profile;

namespace Skills_test_1.Helper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<CreatorOrderDto, Order>().ReverseMap();
        }
    }
}
