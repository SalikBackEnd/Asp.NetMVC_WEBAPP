using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using WebApp.Models;

namespace WebApp.MyRoleProvider
{
    public class SiteRole : RoleProvider
    {
        mvcdbEntities2 db = new mvcdbEntities2();   
        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string email)
        {
            string[] result;
            var obj= db.Users.Where(u => u.Email == email).FirstOrDefault();
            if(obj != null)
            {
                var urobj=obj.UserRoles.FirstOrDefault();
                if (urobj != null)
                {
                    string roleName = urobj.Role.Name;
                    result = new[] { roleName } ;
                    return result;
                }
                else
                {
                    result = null;
                    return result;
                }
            }
            result = null;
            return result;
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}