using BusinessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcProjeKampi.Controllers
{
    public class AdminContentController : Controller
    {
        ContentManager cm = new ContentManager(new EfContentDal());

        // GET: AdminContent
        public ActionResult Index(int id)
        {
            var values = cm.GetListById(id);
            return View(values);
        }
    }
}