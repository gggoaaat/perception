using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS.classes
{
    public class CMS_System_Owner
    {
        //These function will be used to create user in the Oracle Database.
        //TO BE RAN ONLY BY ACCOUT WITH DBA ROLE.
        //Check if the user exist ?

        public string Create(string Name)
        {
            DB_Toolbox environment_tools_db = new DB_Toolbox();

            //Check to see if it exist, before creating
            if (environment_tools_db.SQL_SELECT_DoesCMSUserExist(Name) == "yes")
            {
                //User already exist please navigate to URL.
                return ("Warning-Operation did not Succeed. System Application already exist please use another name.");
            }
            else
            {
                return ("Success-User created successfully.");
                //Create User in the Database.
            }
        }

        public string Update(string oldName, string newName)
        {
            DB_Toolbox environment_tools_db = new DB_Toolbox();

            if (environment_tools_db.SQL_SELECT_DoesCMSUserExist(oldName) == "yes")
            {
                //User already exist please navigate to URL.
                //Update it
                return "Success-System Application " + oldName + " has been updated to " + newName;
            }
            else
            {
                return "Warning-No System Application with that name exist.";
                //do Nothing there is nothing to update. 
            }
            
        }

        public string Delete(string Name)
        {
            DB_Toolbox environment_tools_db = new DB_Toolbox();

            if (environment_tools_db.SQL_SELECT_DoesCMSUserExist(Name) == "yes")
            {
                //User already exist please delete
                return "Success-System Application " + Name + " has been deleted.";

            }
            else
            {
                return "Warning-System Application " + Name + " does not exist.";
                //Do nothing, there is nothing to delete.
            }
        }      
        
        //Create the User with basic Insert Statement

        
        
    }
}