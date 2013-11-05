using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.IO;
using System.Configuration;
using System.Data;
using Oracle.DataAccess.Client;
using System.Text;
using System.Collections;
using CMS.classes;

namespace CMS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //string SystemName = "CMS"; //Referred to as name in subcalls.
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["EP_OracleRootConn"].ToString();
        string constr1 = System.Configuration.ConfigurationManager.ConnectionStrings["EP_OracleUserConn"].ToString();
        DB_Toolbox EMIN_DBK = new DB_Toolbox();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateDB(string SystemName)
        {

            EMIN_DBK.EP_CREATE_DB("ORACLE", constr, constr1, constr1, SystemName, "alpha123");

        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            if (Request.Form["PlatformNametxt"].Length > 1 && Request.Form["DataSourcetxt"].Length > 1 &&
                Request.Form["Usertxt"].Length > 1 && Request.Form["Passwordtxt"].Length > 1)
            {
                System.Configuration.Configuration Config1 = WebConfigurationManager.OpenWebConfiguration("~");
                ConnectionStringsSection conSetting = (ConnectionStringsSection)Config1.GetSection("connectionStrings");
                //Use this for SQL Server
                //ConnectionStringSettings StringSettings = new ConnectionStringSettings("conn", "Data Source=" + server + ";Database=" + database + ";User ID=" + userid + ";Password=" + password + ";");
                ConnectionStringSettings StringSettings = new ConnectionStringSettings("EP_OracleUserConn", "Data Source=" + Request.Form["DataSourcetxt"] + ";User ID=" + Request.Form["Usertxt"] + ";Password=" + Request.Form["Passwordtxt"] + ";");

                conSetting.ConnectionStrings.Remove(StringSettings);
                conSetting.ConnectionStrings.Add(StringSettings);
                Config1.Save(ConfigurationSaveMode.Modified);

                CreateDB(Request.Form["PlatformNametxt"]);

            }
            else
            {
                Message.Text = "Please enter the correct info.";
            }

        }

    }
}