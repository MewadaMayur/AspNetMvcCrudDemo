using System.Web;
using System.Web.Mvc;

namespace crud_framework_four_eight
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
