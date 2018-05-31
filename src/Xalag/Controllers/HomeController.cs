using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;

namespace Xalag.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "خانه";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Title = "ارتباط با ما";
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}