using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.classes;
using System.Text;

namespace CMS
{
    public partial class NewForm : System.Web.UI.Page
    {

        string DB_PLATFORM = "ORACLE";
        string connAuth = System.Configuration.ConfigurationManager.ConnectionStrings["EP_OracleUserConn"].ToString();
         string Organizations_ID = "1000";

            string Users_ID = "1000";

            string Cores_ID = "1000";

            string APP_ID = "1000";

            string Cases_ID = "1000";

            string Forms_ID = "1000";
            
            string ObjectSetsID = "1000";

            string Stages_ID, GripsID;
            
            string ObjectPropertySetID;
                
            string ObjectPropertyOptionSetID;

        DB_Toolbox DBTK = new DB_Toolbox();

        ArrayList Logger = new ArrayList();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form.Count > 1)
            {
                CreateForm();
            }
        }

        protected void CreateForm (){
            String formName = Request.Form["?form_name"];
          
            //string Organizations_ID = DBTK.EP_ADD_ENTRY_Organizations(DB_PLATFORM, connAuth, "Eminent", "System Organization");
            //string Users_ID = DBTK.EP_ADD_ENTRY_Users(DB_PLATFORM, connAuth, "ROOT", "BEFORE", "YOU", DateTime.MinValue.ToString("dd-MMM-yyyy"));
            string formid = DBTK.EP_ADD_ENTRY_Form(DB_PLATFORM, connAuth, "1000", "1000");

            String query = Request.Form.ToString();
            int count = CountStringOccurrences(query, "fType"); //Check query string for form fields 
            
            int i;

           // DBTK.EP_ADD_ENTRY_Form_Property(DB_PLATFORM, connAuth, formid, "1000", "Name", "Text_Box", formName);
              
            if (count > 0)
            {
                Stages_ID = DBTK.EP_ADD_ENTRY_Stage(DB_PLATFORM, connAuth, "Form", formName, Organizations_ID, Users_ID);
                GripsID = DBTK.EP_ADD_ENTRY_Grip(DB_PLATFORM, connAuth, "Form", formName, "Form Fields", Organizations_ID, Users_ID);

                //Forms_ID = DBTK.EP_ADD_ENTRY_Form(DB_PLATFORM, connAuth, Organizations_ID, Users_ID);
                
                for (i = 0; i < count; i++)
                {
                    
                    string fieldType = Request.Form["fType_" + i];
                    string fieldID  = Request.Form["fID_" + i];  
                    string fieldRequired = Request.Form["fReq_" + i];

                    switch (fieldType){
                        case "textField":
                            ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form", formName, "Form Fields", "Text_Box", Organizations_ID, Users_ID);
                        
                            ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID", "false", "false", "", fieldID);
                            //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", );   

                            ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Label", "false", "false", "", Request.Form["fLabel_" + i]);
                            //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fLabel_" + i]);

                            if (fieldRequired == "true")
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Required", "false", "false", "", "true");
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", "true");

                            }
                            else if (fieldRequired == "false")
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Required", "false", "false", "", "false");
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", "false");
                            }

                            if (Request.Form["fRegExp_" + i] != null)
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Regular Expression", "false", "false", "", Request.Form["fRegExp_" + i]);
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fRegExp_" + i]);

                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Regular Expression Pattern", "false", "false", "", Request.Form["fPattern_" + i]);
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fPattern_" + i]);

                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Regular Expression Pattern", "false", "false", "", Request.Form["fMessage_" + i]);
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fMessage_" + i]);
                            }

                            if (Request.Form["fMin_" + i] != null)
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Min", "false", "false", "", Request.Form["fMin_" + i]);
                            //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fMin_" + i]);
                            }


                            if (Request.Form["fMax_" + i] != null)
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Max", "false", "false", "", Request.Form["fMax_" + i]);
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fMax_" + i]);
                            }
                            if (Request.Form["fFormat_" + i] != null)
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Format", "false", "false", "", Request.Form["fFormat_" + i]);
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fFormat_" + i]);
                            }

                            //Check to see how many occurances of field_rule_field there are in the query string
                            //Use this number as the count
                            int conCount = CountStringOccurrences(query, "fConID_" + i);

                            if (Request.Form["fConAction_" + i] != null)
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Condition Action", "false", "false", "", Request.Form["fConAction_" + i]);
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fConAction_" + i]);

                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Condition Logic", "false", "false", "", Request.Form["fConLogic_" + i]);
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fConLogic_" + i]);

                               for (int b = 0; b < count; b++)
                               {
                                   ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Condition ID " + b, "false", "false", "", Request.Form["fConID_" + i + "_" + b]);
                                   //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fConID_" + i + "_" + b]);

                                   ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Condition Field " + b, "false", "false", "", Request.Form["fConField_" + i + "_" + b]);
                                   //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fConField_" + i + "_" + b]);

                                   ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Condition Operator " + b, "false", "false", "", Request.Form["fConOperator_" + i + "_" + b]);
                                   //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fConOperator_" + i + "_" + b]);

                                   ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Condition Option " + b, "false", "false", "", Request.Form["fConOption_" + i + "_" + b]);
                                   //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fConOption_" + i + "_" + b]);

                                
                               }

                            }
                            

                            


                          
                            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Value", "Characters", "Value");

                            //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", "Example 101091");  

                            //Save conditionial logic fields
                        break;
                        case "dropDown":
                            ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form", formName, "Form Fields", fieldType, Organizations_ID, Users_ID);

                            ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID", "false", "false", "", fieldID);
                            DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", fieldID);

                            ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Drop_Down", "Characters", "Label", "false", "false", "", Request.Form["fLabel_" + i]);
                            DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", Request.Form["fLabel_" + i]);

                            if (fieldRequired == "true")
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Drop_Down", "Characters", "Required", "false", "false", "", "true");
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", "true");

                            }
                            else if (fieldRequired == "false")
                            {
                                ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Drop_Down", "Characters", "Required", "false", "false", "", "false");
                                //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectPropertySetID, "Forms", Forms_ID, "Characters", "false");
                            }
                        break;
                        default:
                        break;


                    }
                }
            }
        }

        protected void Data()
        {
          
            string Organizations_ID = DBTK.EP_ADD_ENTRY_Organizations(DB_PLATFORM, connAuth);

            string Users_ID = DBTK.EP_ADD_ENTRY_Users(DB_PLATFORM, connAuth);

            string Cores_ID = DBTK.EP_ADD_ENTRY_Cores(DB_PLATFORM, connAuth, Users_ID, Organizations_ID);

            string APP_ID = DBTK.EP_ADD_ENTRY_Application(DB_PLATFORM, connAuth, Cores_ID, Users_ID, Organizations_ID);

            string Cases_ID = DBTK.EP_ADD_ENTRY_Case(DB_PLATFORM, connAuth, APP_ID, Users_ID);

            Logger.Add(Users_ID = DBTK.EP_ADD_ENTRY_Users(DB_PLATFORM, connAuth));
            Users_ID = DBTK.EP_ADD_ENTRY_Users(DB_PLATFORM, connAuth);

            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Text_Box", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Paragraph_Text", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Rich_Text", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Check_Box", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Radio_Buttons", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Drop_Down", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Section", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Page_Break", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Extra_Fields", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Number", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Email", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Url", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Date", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Time", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Phone", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "Credit_Card", "Application"));
            Logger.Add(DBTK.EP_ADD_ENTRY_Object(DB_PLATFORM, connAuth, "File_Upload", "Application"));

            string formid = DBTK.EP_ADD_ENTRY_Form(DB_PLATFORM, connAuth, Organizations_ID, Users_ID);

            Logger.Add(DBTK.EP_ADD_ENTRY_Form_Property(DB_PLATFORM, connAuth, formid, "1000",  "Name", "Sine Line Text", "Test Application"));
            Logger.Add( DBTK.EP_ADD_ENTRY_Form_Property(DB_PLATFORM, connAuth, formid,"1000", "Style", "Drop Down", "Style2"));
            Logger.Add( DBTK.EP_ADD_ENTRY_Form_Property(DB_PLATFORM, connAuth, formid, "1000", "Success Message", "Paragraph Text", "Thanks for filling out!"));
            Logger.Add( DBTK.EP_ADD_ENTRY_Form_Property(DB_PLATFORM, connAuth, formid, "1000",  "Name", "Sine Line Text", "Eminent-App"));

            //return Logger;
        }

        protected void Load_Data()
        {
           



            //Stages_ID = DBTK.EP_ADD_ENTRY_Stage(DB_PLATFORM, connAuth, "User", "Base User", Organizations_ID, Users_ID);
            //GripsID = DBTK.EP_ADD_ENTRY_Grip(DB_PLATFORM, connAuth, "Base User", "User Settings", Organizations_ID, Users_ID);
            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "User Settings", "Demographic", Organizations_ID, Users_ID);
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "First Name");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Last Name");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Date", "Date", "DOB");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Email", "Characters", "Email");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "SSN");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Radio_Button", "Characters", "Sex");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Male");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Female");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Unknown");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Radio_Button", "Characters", "Clearance Level");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Top Secret /SCI");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Top Secret");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Secret");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Classified");

            ////Create a form stage for Default FORMS
            //Stages_ID = DBTK.EP_ADD_ENTRY_Stage(DB_PLATFORM, connAuth, "Form", "Default Form", Organizations_ID, Users_ID);
            
            ////Create a grip for Default Forms STage
            //GripsID = DBTK.EP_ADD_ENTRY_Grip(DB_PLATFORM, connAuth, "Default Form", "Form Settings", Organizations_ID, Users_ID);
            
            ////Add an Object to Grip
            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form Settings", "Text_Box", Organizations_ID, Users_ID);
            
            ////Add Property to Object
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID");

            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form Settings", "Text_Box", Organizations_ID, Users_ID);
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Drop_Down", "Characters", "Form Style");
            //DBTK.EP_ADD_ENTRY_Object_Option_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Style 1");
            //DBTK.EP_ADD_ENTRY_Object_Option_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Style 2");

            ////Stages_ID = DBTK.EP_ADD_ENTRY_Stage(DB_PLATFORM, connAuth, "Form", "Default Form", Organizations_ID, Users_ID);
            //GripsID = DBTK.EP_ADD_ENTRY_Grip(DB_PLATFORM, connAuth, "Default Form", "Form Fields", Organizations_ID, Users_ID);
            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form Fields", "Text_Box", Organizations_ID, Users_ID);
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Radio_Button", "Characters", "Required");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Yes");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "No");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Min");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Max");

            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form Fields", "Text_Box", Organizations_ID, Users_ID);
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Label");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Radio_Button", "Characters", "Required");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Yes");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "No");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Min");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Max");

            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form Fields", "Text_Box", Organizations_ID, Users_ID);
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Label");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Radio_Button", "Characters", "Required");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Yes");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "No");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Min");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Max");

            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form Fields", "Drop_Down", Organizations_ID, Users_ID);
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Label");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Radio_Button", "Characters", "Required");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Yes");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "No");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Min");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Max");

            //DBTK.EP_ADD_ENTRY_Object_Option_Set(DB_PLATFORM, connAuth, ObjectSetsID, "One");
            //DBTK.EP_ADD_ENTRY_Object_Option_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Two");

            //ObjectSetsID = DBTK.EP_ADD_ENTRY_Object_Set(DB_PLATFORM, connAuth, "Form Fields", "Paragraph_Text", Organizations_ID, Users_ID);
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "ID", "Characters", "ID");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Text_Box", "Characters", "Label");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Radio_Button", "Characters", "Required");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "Yes");
            //ObjectPropertyOptionSetID = DBTK.EP_ADD_ENTRY_Object_Property_Option_Set(DB_PLATFORM, connAuth, ObjectPropertySetID, "No");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Min");
            //ObjectPropertySetID = DBTK.EP_ADD_ENTRY_Object_Property_Set(DB_PLATFORM, connAuth, ObjectSetsID, "Number", "Number", "Max");

            //DBTK.SQL_ADD_ROW_OBJECT_DATA_ENTRY(DB_PLATFORM, connAuth, ObjectSetsID, "Forms", Forms_ID, "Characters", "alsjdhflakjsdhf"); 


        }
        public static int CountStringOccurrences(string text, string pattern)
        {
            // Loop through all instances of the string 'text'.
            int count = 0;
            int i = 0;
            while ((i = text.IndexOf(pattern, i)) != -1)
            {
                i += pattern.Length;
                count++;
            }
            return count;
        }
    }
}