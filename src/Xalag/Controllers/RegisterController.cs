using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Dapper;
using Xalag.Core;
using Xalag.Models;

namespace Xalag.Controllers
{
    public class RegisterController : Controller
    {
        [AllowAnonymous]
        public ActionResult Index(int placeId)
        {
            ViewBag.Title = "خرید بلیت";
            ViewBag.Session = DynamicModels.GetSessionsMenus().FirstOrDefault(x => x.PlaceId == placeId);

            ViewBag.MultipleStepOpt = new MultipleStepProgressTabOption()
            {
                Steps = new List<string>()
                {
                    "ثبت نام کاربر",
                    "انتخاب صندلی",
                    "تاییدیه نهایی جهت پرداخت",
                    "عملیات پرداخت",
                    "دریافت بلیت"
                },
                CurrentStepIndex = 1
            };

            return View();
        }



        //
        // POST: /Home/RegisterUser
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RegisterUser([Bind(Exclude = "UserId")]RegisterUserModel model)
        {
            ViewBag.Session = DynamicModels.GetSessionsMenus().FirstOrDefault(x => x.PlaceId == model.PlaceId);

            ViewBag.MultipleStepOpt = new MultipleStepProgressTabOption()
            {
                Steps = new List<string>()
                {
                    "ثبت نام کاربر",
                    "انتخاب صندلی",
                    "تاییدیه نهایی جهت پرداخت",
                    "عملیات پرداخت",
                    "دریافت بلیت"
                },
                CurrentStepIndex = 2
            };

            var errors = ModelState.Values.SelectMany(v => v.Errors);

            if (ModelState.IsValid)
            {
                model.UserId =
                    (await
                        Connections.Xalag.SqlConn.QueryAsync<int>("sp_User_Insert", new { model.FirstName, model.LastName, model.Birthday, model.MobileNo, model.NatrualCode, model.Email },
                            commandType: CommandType.StoredProcedure)).First();
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

    }
}