using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebApp.CustomClass
{
    public class MyAuthAttribute:AuthorizeAttribute
    {
        protected override void HandleUnauthorizedRequest(AuthorizationContext context)
        {
            //string id = context.HttpContext.Request.Params["id"];
            //int i = Convert.ToInt32(id);
            //string ReturnUrl = context.HttpContext.Request.Params["RetrunUrl"];
            //context.Result = new RedirectResult("/Home/Index/"+i+"?result=unauth&&ReturnUrl=ReturnUrl");
            // if you want to redirect to some action, use: 
            //   new RedirectResult("/UnAuthorizedUsers/ErrorDetails");

            if (context.HttpContext.User.Identity.IsAuthenticated)
            {

                context.Result = new RedirectToRouteResult(
                            new RouteValueDictionary(
                                new
                                {
                                    controller = "Home",
                                    action = "Index",
                                    result ="unauth"
                                })
                            );
            }
            else
            {
                base.HandleUnauthorizedRequest(context);
            }
        }
    }
}