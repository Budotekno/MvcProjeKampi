using BusinessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcProjeKampi.Controllers
{
    public class AdminAboutController : Controller
    {
        AboutManager abm = new AboutManager(new EfAboutDal());
        // GET: AdminAbout
        public ActionResult Index()
        {
            var values = abm.GetList();
            return View(values);
        }

        [HttpGet]
        public ActionResult AddAbout()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddAbout(About p)
        {
            abm.AddAbout(p); 
            return RedirectToAction("Index");

        }

        public PartialViewResult AboutPartial()
        {
            return PartialView();
        }
    }
}