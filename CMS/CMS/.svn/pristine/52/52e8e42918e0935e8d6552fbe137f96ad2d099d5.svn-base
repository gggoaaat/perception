using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CMS.classes;
using Oracle.DataAccess.Client;

namespace CMS
{
    public partial class Apps : System.Web.UI.Page
    {
        string constr1 = System.Configuration.ConfigurationManager.ConnectionStrings["EP_OracleUserConn"].ToString();
        DB_Toolbox EMIN_DBK = new DB_Toolbox();
        DB_Toolbox DB_Kit = new DB_Toolbox();

        DB_Toolbox.DBParameters ProcParams = new DB_Toolbox.DBParameters();

        List<DB_Toolbox.DBParameters> ParamList0 = new List<DB_Toolbox.DBParameters>();
        List<DB_Toolbox.DBParameters> ParamList1 = new List<DB_Toolbox.DBParameters>();

        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();

            dt = EMIN_DBK.EP_RUN_QUERY("ORACLE", constr1, "Select * from APPLICATIONS_VW");

            if (Request.Form.Count > 0)
            {
                
                if (Request.Form[0].Length > 1 && Request.Form["n"].Length > 1)
                {
                    if (Convert.ToInt32(Request.Form["t"]) == 0) //if inserting a new Application
                    {
                        InsertProcedure(Request.Form["n"], Convert.ToInt32(Request.Form["i"]));
                    }
                    else if (Convert.ToInt32(Request.Form["t"]) == 1) //if updating an application
                    {
                        UpdateProcedure(Request.Form["n"], Convert.ToInt32(Request.Form["i"]));
                    }
                }
            }

            DataSet ds = new DataSet();

            ds.Tables.Add(dt);
            
            Repeater1.DataSourceID = null;
            Repeater1.DataSource = ds.Tables[0].DefaultView;
            Repeater1.DataBind();
            
        }

        protected DataTable InsertProcedure(string name,int application_id)
        {
            DataTable dt = new DataTable();
            ParamList0.Clear();
            ParamList1.Clear();

            ParamList0.Add(new DB_Toolbox.DBParameters { ParamName = "P_NAME", ParamValue=name, OracleParamDataType = Oracle.DataAccess.Client.OracleDbType.Varchar2, ParamDirection = System.Data.ParameterDirection.Input, ParamSize = 100  });
            ParamList0.Add(new DB_Toolbox.DBParameters { ParamName = "P_USER_ID", ParamValue = "1000", OracleParamDataType = Oracle.DataAccess.Client.OracleDbType.Int32, ParamDirection = System.Data.ParameterDirection.Input });
            ParamList0.Add(new DB_Toolbox.DBParameters { ParamName = "R_APPLICATIONS_ID", OracleParamDataType = Oracle.DataAccess.Client.OracleDbType.Int32, ParamDirection = System.Data.ParameterDirection.Output });
            string tempvalue = "";
            DataTable datatable = DB_Kit.SQL_PROCEDURE_PARAMS("ORACLE", constr1, "APPLICATIONS_INSERT_ROW", ParamList0);

            tempvalue = DB_Kit.SQL_PROCEDURE_GET_VALUE("R_APPLICATIONS_ID", datatable);

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_NAME", ParamDirection = ParameterDirection.Input, OracleParamDataType = OracleDbType.Varchar2, ParamSize = 100, ParamValue = name
            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_APPLICATIONS_ID", ParamDirection = ParameterDirection.Input, OracleParamDataType = OracleDbType.Int32, ParamValue = tempvalue,

            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_VERSION", ParamDirection = ParameterDirection.Input, OracleParamDataType = OracleDbType.Int32, ParamValue = "10",

            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_PUBLISHED", ParamDirection = ParameterDirection.Input, OracleParamDataType = OracleDbType.Varchar2, ParamValue = "Y",

            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "R_APPLICATION_NAME_ID", ParamDirection = ParameterDirection.Output, OracleParamDataType = OracleDbType.Int32, ParamSize = 100
            });

            

            dt = DB_Kit.SQL_PROCEDURE_PARAMS("ORACLE", constr1, "APPLICATIONS_NAME_INSERT_ROW", ParamList1);
                
            return dt;

        }

        protected DataTable UpdateProcedure(string name, int application_id)
        {
            DataTable dt = new DataTable();

            string tempvalue = "";

            ParamList1.Clear();
            tempvalue = application_id.ToString();

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_NAME",
                ParamDirection = ParameterDirection.Input,
                OracleParamDataType = OracleDbType.Varchar2,
                ParamSize = 100,
                ParamValue = name
            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_APPLICATIONS_ID",
                ParamDirection = ParameterDirection.Input,
                OracleParamDataType = OracleDbType.Int32,
                ParamValue = tempvalue,

            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_VERSION",
                ParamDirection = ParameterDirection.Input,
                OracleParamDataType = OracleDbType.Int32,
                ParamValue = "10",

            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "P_PUBLISHED",
                ParamDirection = ParameterDirection.Input,
                OracleParamDataType = OracleDbType.Varchar2,
                ParamValue = "Y",

            });

            ParamList1.Add(new DB_Toolbox.DBParameters
            {
                ParamName = "R_APPLICATION_NAME_ID",
                ParamDirection = ParameterDirection.Output,
                OracleParamDataType = OracleDbType.Int32,
                ParamSize = 100
            });



            dt = DB_Kit.SQL_PROCEDURE_PARAMS("ORACLE", constr1, "APPLICATIONS_NAME_INSERT_ROW", ParamList1);

            return dt;

        }

        protected DataTable DeleteProcedure(string name, int application_id){ 
        
        return new DataTable();
        
        }
    }
}