using Mapster;
using net8Test.DTO;
using net8Test.Models;
namespace net8Test.Config
{
    public class MapsterConfig
    {
        public static void RegisterMappings()
        {
            TypeAdapterConfig<Product, ProductDTO>.NewConfig()
                .Map(dest => dest.CategoryIds, src => src.ProductCategories.Select(pc => pc.CategoryId).ToList());
        }
    }
}
