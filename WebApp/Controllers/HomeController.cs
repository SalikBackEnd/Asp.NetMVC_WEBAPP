using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;
using System.Web.Security;
using WebApp.CustomClass;
using System.Data.Entity;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        mvcdbEntities2 db = new mvcdbEntities2();

        [Authorize]
        public ActionResult Index(string result=null)
        {
            if (result != null)
                ViewBag.result = result;
           

            return View(db.Users.ToList());
        }
     
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User user,UserRole userRole,string ReturnUrl)
        {
            
            var obj = db.Users.Where(u => u.Email == user.Email && u.Password == user.Password).FirstOrDefault();
                if (obj != null)
                {
                //var roleobj = obj.UserRoles;
                //string rolename=roleobj.FirstOrDefault().Role.Name;
                    FormsAuthentication.SetAuthCookie(obj.Email, false);
                    if (Url.IsLocalUrl(ReturnUrl) && ReturnUrl.Length>1 && ReturnUrl.StartsWith("/") && !ReturnUrl.StartsWith("//") && !ReturnUrl.StartsWith("/\\") )
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Invalid Email or Password");
                    return View();
                }

        }
        [Authorize]
        [AllowAnonymous]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }

        [Authorize]
        public ActionResult AddUser(UserRoleViewModel Model,string result=null)
        {
            if (result != null)
                ViewBag.result = result;
           
            List<Role> list = db.Roles.ToList();
           Model.Role = new SelectList(list, "Id", "Name");
            return View(Model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult AddUser(UserRoleViewModel model,FormCollection form)
        {
            if (!ModelState.IsValid)
            {
                model.Role = new SelectList(db.Roles, "ID", "Name"); // add this
                return View(model);
            }
            try
            {
                if (ModelState.IsValid)
                {
                    List<Role> list = db.Roles.ToList();
                    ViewBag.Role = new SelectList(list, "Id", "Name");

                    User user = new User();
                    user.Username = model.Username;
                    user.Email = model.Email;
                    user.Password = model.Password;
                    user.Status = model.Status;
                    db.Users.Add(user);
                    db.SaveChanges();
                    int userid = user.Id;
                    UserRole userRole = new UserRole();
                    userRole.RoleId = Convert.ToInt32(model.Roleid);
                    userRole.UserId = userid;
                    db.UserRoles.Add(userRole);
                    db.SaveChanges();

                    return RedirectToAction("AddUser", new { result = "usercreated" });
                }
                else
                {
                    return View(model);
                }
            }
            catch (Exception)
            {
                return RedirectToAction("AddUser", new { result = "error" });
            }
            
        }

        [MyAuthAttribute(Roles ="SuperAdmin,System User")]
        public ActionResult AddRoles(string result = null)
        {
            if (result != null)
                ViewBag.result = result;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MyAuthAttribute(Roles = "SuperAdmin,System User")]
        public ActionResult AddRoles(Role role)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var obj = db.Roles.Add(role);
                    obj.Name = role.Name;
                    db.SaveChanges();
            return RedirectToAction("AddRoles", new { result = "rolecreated" });
                }
                else
                {
                    return View(role);
                }
            }
            catch (Exception)
            {
                return RedirectToAction("AddRoles", new { result = "error" });
            }
        }

        [Authorize]
        public ActionResult Roles()
        {
            return View(db.Roles.ToList());
        }

        [HttpGet]
        [Authorize]
        public ActionResult ShowUser(Nullable<int> id,string result=null)
        {
            var obj = db.Users;
            try
            {
                if (result != null)
                    ViewBag.result = result;
                if (id != null)
                {
                    return View(obj.Find(id));
                }

                return RedirectToAction("Index", new { result = "usernotfound" });
            }
            catch (Exception)
            {
                return RedirectToAction("Index", new { result = "usernotfound" });
            }
           
        }
     

        [HttpGet]
        [MyAuthAttribute(Roles = "SuperAdmin")]
        public ActionResult EditPassword(Nullable<int> id,string result=null)
        {
            var obj=db.Users;
            try {
                if (result!=null)
                ViewBag.result = result;
                if (id != null) {
                    return View(obj.Find(id));
                }
                 
                return RedirectToAction("Index", new { result = "usernotfound" });
            }
            catch (Exception)
            {
                return RedirectToAction("ShowUser",new {id=id,result="usernotfound" });
            }
        }

        [HttpPost]
        [MyAuthAttribute(Roles = "SuperAdmin")]
        public ActionResult EditPassword(Nullable<int> id,User user)
        {
            try {
                if (ModelState.IsValid)
                {
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("ShowUser", new { id = id, result = "passupdated" });
                }
                else
                {
                    return View(user);
                }
            }
            catch (Exception)
            {
                return RedirectToAction("EditPassword", new { id = id, result = "failed" });
            }
            
        }
        //public PartialViewResult MarkState(int id)
        //{
        //    UserStateModel urm = new UserStateModel();
            
        //    ViewBag.UserId = id;
        //    var obj = db.Users.Find(id);
        //    if(obj.Status == "Active")
        //    {
        //        ViewBag.Active = true;
        //    }
        //    else
        //    {
        //        ViewBag.Active = false;
        //    }
        //    return PartialView("_MarkState");
        //}
        [Authorize]
        public ActionResult MarkStatus(string result=null)
        {

            if (result != null)
                ViewBag.result = result;
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
            string name = ticket.Name;

            var obj=db.Users.Where(m=>m.Email==name).FirstOrDefault();
            int Userid = obj.Id;
            ViewBag.UserId = Userid;

            var obj2 = db.HistoryMarks.Where(m=>m.UserId==Userid);
            return View(obj2.ToList()); 
        }
        [Authorize]
        public ActionResult Mark(int id)
        { 
            try {
                string Status = "";
                    var obj = db.Users.Find(id);
                    int userid = obj.Id;
                    bool active=true; 
                
                    switch (obj.Status)
                    {
                        case "Active":
                            active = false;
                            Status = "InActive";
                            break;
                        case "InActive":
                            active = true;
                            Status = "Active";
                            break;
                    }
                obj.Status = Status;
                db.Entry(obj).State = EntityState.Modified;
                db.SaveChanges();

                HistoryMark state = new HistoryMark();
                    state.UserId = userid;
                    state.Active = active;
                state.ActionDate = Convert.ToDateTime(DateTime.Now.Date);
                state.ActionTime = DateTime.Now.TimeOfDay;
                db.Entry(state).State = EntityState.Added;
                    db.HistoryMarks.Add(state);
                    db.SaveChanges();
                    return RedirectToAction("MarkStatus", new { result = Status });
            }
            catch (Exception ex)
            {
                return RedirectToAction("MarkStatus", new {  result = "failed",exception=ex.Message});
            }
            
        }

        }
}