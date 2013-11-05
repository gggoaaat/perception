using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;

namespace CMS.classes
{
    public class Environment_Tools
    {

        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["EP_OracleRootConn"].ToString();
           
        private string dbStatus = "Unknown";

        // Declare a dbStatus property of type string:

        public string DBStatus
        {
            get
            {
                return dbStatus;
            }
            set
            {
                //dbStatus = value;
                dbStatus = CheckConnection();
            }
        }

        public string CheckConnection()
        {
            DB_Toolbox env_dbkit = new DB_Toolbox();

            using (OracleConnection connection =
                new OracleConnection())
            {
                connection.ConnectionString =
                    constr;
                try
                {
                    connection.Open();

                   // DBstatus = ("Connection Successful!");
                    return ("EMIN-00001-Connection Successful!");
                    //stops the console from closing
                    //until you hit the ENTER key
                   //Console.ReadLine();
                }
                catch (OracleException ex)
                {
                    
                    
                    //DBstatus = ("Connection Error!");
                    return ("EMIN-00000-Connection Error! " + env_dbkit.DB_ERROR_FORMATTER("ORACLE", ex.ToString()));
                    //Console.WriteLine(ex.ToString());
                    // stops the console from closing
                    //until you hit the ENTER key
                   // Console.ReadLine();
                }
            }


        }

        public string CheckIfCMSUserIsInstalled(string Name)
        {
            DB_Toolbox environment_Tools_db = new DB_Toolbox();

            return environment_Tools_db.SQL_SELECT_DoesCMSUserExist(Name);       
        }
            
    }
}