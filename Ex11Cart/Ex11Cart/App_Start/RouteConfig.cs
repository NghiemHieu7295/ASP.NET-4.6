using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace Ex11Cart
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.Ignore("{resource}.axd/{*pathInfo}");

            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings, new MyUrlResolver());

            routes.MapPageRoute("ShopProducts", "Shop/Products", "~/Products.aspx");
            routes.MapPageRoute("ShopCart", "Shop/Cart", "~/Cart.aspx");
            routes.MapPageRoute("ShopOrder", "Shop/Order/{productID}", "~/Order.aspx", false, new RouteValueDictionary { { "productID", "" } });
        }
    }

    public class MyUrlResolver : WebFormsFriendlyUrlResolver
    {

        public override string ConvertToFriendlyUrl(string path)
        {
            if (path.Contains("Order") || path.Contains("Products") || path.Contains("Cart"))
            {
                return "~/Shop" + path.Replace(".aspx", "");
            }
            return base.ConvertToFriendlyUrl(path);
        }
    }
}
