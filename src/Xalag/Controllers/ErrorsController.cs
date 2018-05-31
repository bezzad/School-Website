using System;
using System.Web.Mvc;
using System.Web.UI;
using Xalag.Properties;

namespace Xalag.Controllers
{
    [AllowAnonymous]
    public class ErrorsController : Controller
    {
        // GET: Errors
        public ActionResult Index()
        {
            ViewBag.Title = $"{Resources.AppName} - {Resources.Error}";
            return View("Index");
        }

        [OutputCache(Duration = 1728000, Location = OutputCacheLocation.Any,
            VaryByContentEncoding = "gzip;deflate", VaryByHeader = "X-Requested-With;Accept-Language")]
        public ActionResult NotFound()
        {
            ViewBag.Title = $"{Resources.AppName} - {Resources.PageNotFound}";
            return View("NotFound");
        }
    }
}