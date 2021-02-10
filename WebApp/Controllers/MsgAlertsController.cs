using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;
namespace WebApp.Controllers
{
    public class MsgAlertsController : Controller
    {
        MsgAlert alert = new MsgAlert();
        // GET: MsgAlerts
        [HttpGet]
        [ChildActionOnly]
        public ActionResult Alert(string msg)
        {
            string s = "alert-success";
            string w = "alert-warning";
            string i = "alert-info";
            string d = "alert-danger";
            switch (msg)
            {
                case "success":
                    alert.alertclass = s;
                    alert.alerttype = "Success!";
                    alert.alertmsg = "Action Performed Successfully.";
                    break;
                case "error":
                    alert.alertclass = d;
                    alert.alerttype = "Error!";
                    alert.alertmsg = "An error occured while performing this action.";
                    break;
                case "passupdated":
                    alert.alertclass = s;
                    alert.alerttype = "Updated!";
                    alert.alertmsg = "Password Updated successfully.";
                    break;
                case "unauth":
                    alert.alertclass = w;
                    alert.alerttype = "Not Authorized!";
                    alert.alertmsg = "Your role is not authorized for this action.";
                    break;
                case "usercreated":
                    alert.alertclass = s;
                    alert.alerttype = "Success!";
                    alert.alertmsg = "User Created Successfully.";
                    break;
                case "usernotfound":
                    alert.alertclass = i;
                    alert.alerttype = "User Not Found!";
                    alert.alertmsg = "can not be able to find user.";
                    break;
                case "rolecreated":
                    alert.alertclass = s;
                    alert.alerttype = "Success!";
                    alert.alertmsg = "Role Created Successfully.";
                    break;
                case "Active":
                    alert.alertclass = s;
                    alert.alerttype = "Marked Active!";
                    alert.alertmsg = " you are Active now.";
                    break;
                case "InActive":
                    alert.alertclass = w;
                    alert.alerttype = "Marked In-Active!";
                    alert.alertmsg = " you are In-Active now.";
                    break;
                default:
                    alert.alertclass = "alert-Warning";
                    alert.alerttype = "Some Action Performed!";
                    alert.alertmsg = "An action has been performed";
                    break;
            }
            return PartialView("_Alert",alert);
        }
    }
}