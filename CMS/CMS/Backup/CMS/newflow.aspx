<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newflow.aspx.cs" Inherits="CMS.NewFlow" %>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head runat="server">
    <meta charset="utf-8" />
    <title>Eminent | New Flow</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/metro.css" rel="stylesheet" />
    <link href="assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/style_responsive.css" rel="stylesheet" />
    <link href="assets/css/style_default.css" rel="stylesheet" id="style_color" />
    <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
    <link rel="stylesheet" type="text/css" href="assets/chosen-bootstrap/chosen/chosen.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-timepicker/compiled/timepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" href="assets/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" />
    <link rel="stylesheet" href="assets/data-tables/DT_bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
    <!-- Form Builder Styles -->
    <link href="assets/flow-css/css" rel="stylesheet" type="text/css">
    <link href="assets/flow-css/css(1)" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/flow-css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="assets/flow-css/form.css" type="text/css" media="all">
    <link rel="stylesheet" href="assets/flow-css/style1.css" type="text/css" media="all" id="csstheme">
    <link rel="stylesheet" href="assets/flow-css/tipsy.css" type="text/css" media="all">
    <link rel="stylesheet" href="assets/flow-css/enhanced.css" type="text/css" media="all">
   
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="fixed-top">
    <theme:header ID="header" runat="server" />
    <!-- BEGIN CONTAINER -->
    <div class="page-container row-fluid">
        <theme:sidebar ID="siderbar" runat="server" />
        <!-- BEGIN PAGE -->
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL flow-->
            <div id="portlet-config" class="modal hide">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button">
                    </button>
                    <h3>
                        portlet Settings</h3>
                </div>
                <div class="modal-body">
                    <p>
                        Here will be a configuration form</p>
                </div>
            </div>
            <!-- END SAMPLE PORTLET CONFIGURATION MODAL flow-->
            <!-- BEGIN PAGE CONTAINER-->
            <div class="container-fluid">
                <!-- BEGIN PAGE HEADER-->
                <div class="row-fluid">
                    <div class="span12">
                        <theme:customizer ID="customizer" runat="server" />
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <h3 class="page-title">New Flow<small></small>
                        </h3>
                        <ul class="breadcrumb">
                            <li><i class="icon-home"></i><a href="index.html">Home</a> <i class="icon-angle-right">
                            </i></li>
                            <li><a href="#">New Flow</a> </li>
                        </ul>
                        <!-- END PAGE TITLE & BREADCRUMB-->
                    </div>
                </div>
                <!-- END PAGE HEADER-->
                <!-- BEGIN PAGE CONTENT-->
                <div class="row-fluid">
                    <div class="span12">
                    <div id="Div1">
                                                    <div id="buttons-container">
                                                        <a href="#" class="btn grey">Preview</a> <a href="#" class="btn blue">
                                                            Save</a>
                                                    </div>
                                                </div>
                         <div style="margin-top:50px;" id="container">
                                                
                                                <!--header-->
                                                <div id="js-warning" style="display: none;">
                                                    Your browser doesn't support javascript or currently it's disabled. Javascript is
                                                    mandatory to use this application. Please try using a modern web browser or enable
                                                    javascript support in your browser
                                                </div>
                                                <script type="text/javascript">
                                                    var el = document.getElementById("js-warning");
                                                    el.style.display = 'none';
                                                </script>
                                                <div>
                                                </div>
                                                <div class="row-fluid">


                                                <div id="left-column" class="span4">
                                               
                                         <div class="tabbable tabbable-custom">
											<ul class="nav nav-tabs" id="flow-tabs">
												<li class="active"><a data-toggle="tab" href="#flow-elements">Flow Items</a></li>
												<li class=""><a data-toggle="tab" href="#element-options">Item Options</a></li>
												<li class=""><a data-toggle="tab" href="#flow-options">Flow Settings</a></li>
											</ul>
											<div class="tab-content">
												<div id="flow-elements" class="tab-pane active">
													<ul>
                                                            <div class="flow-element-heading">
                                                                Flow Items</div>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="stepSection flow-element button1">
                                                                Step</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="stepActor flow-element button1">
                                                                Actor</a></li>
                                                            <li style="position: relative; left: 0px; top: 0px;" class="ui-draggable"><a href="#"
                                                                class="in_action flow-element button1">Action</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="and flow-element button1">
                                                                And</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="or flow-element button1">
                                                                Or</a></li>
                                                        </ul>
												</div>
												<div id="element-options" class="tab-pane">
													 Please select the form element that you want to view options for.
												</div>
												<div id="flow-options" class="tab-pane">

                                                <div id="accordion1" class="accordion in collapse" style="height: auto;">
									<div class="accordion-group">
										<div class="accordion-heading">
											<a href="#collapse_1" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">
											<i class="icon-angle-left"></i>
											General Settings
											</a>
										</div>
										<div class="accordion-body collapse" id="collapse_1" style="height: 0px;">
											<div class="accordion-inner">
													<label for="flow-options-formname">
                                                            Flow Name <a class="flow-tip" original-title="The Heading for the flow" href="#">
                                                                (?)</a>
                                                        </label>
                                                        <input id="flow-options-flowname" type="text">
                                                        <label for="flow-options-url">
                                                            Form Id <a class="flow-tip" original-title="If you are using your own script to process the flow, enter the url of the server side script"
                                                                href="#">(?)</a></label>
                                                        <input id="flow-options-url" type="text">
                                                        <label for="flow-options-type">
                                                            Form Table <a class="flow-tip" original-title="This is the name of the table where the data will be stored."
                                                                href="#">(?)</a></label>
                                                      <input id="flow-options-table" type="text">
                                                        <label for="flow-options-disable">
                                                            Disable Form <a class="flow-tip" original-title="Allows you to disable this form to no longer allow submissions"
                                                                href="#">(?)</a></label>
                                                        <select id="flow-options-disable">
                                                            <option value="post" selected="selected">Never</option>
                                                            <option value="now">Now</option>
                                                             <option value="date">On date</option>
                                                              <option value="number">After number of submissions</option>
                                                        </select>
                                                        <label for="flow-options-style">
                                                            Form Style <a class="flow-tip" original-title="The type of style you want the form fields to have."
                                                                href="#">(?)</a></label>
                                                        <select id="flow-options-style">
                                                            <option id="style1" value="style1">Style 1</option>
                                                            <option id="style2" value="style2">Style 2</option>
                                                        </select>
                                                
                                                		</div>
										</div>
									</div>
									    <div class="accordion-group">
										<div class="accordion-heading">
											<a href="#collapse_2" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">
											<i class="icon-angle-left"></i>
											Email & Redirects
											</a>
										</div>
										<div class="accordion-body collapse" id="collapse_2">
											<div class="accordion-inner">
												   <label for="flow-options-success-msg">
                                                            Success Message For Users <a class="flow-tip" original-title="Message to users once the form is submitted without any errors"
                                                                href="#">(?)</a></label>
                                                        <textarea id="flow-options-success-msg">Thank you for submitting the form, we will get back to you shortly!</textarea>
                                                        <div style="margin-top: 10px;">
                                                            <input type="checkbox" id="flow-options-email-user" class="checkbox">
                                                            <label for="flow-options-email-user" style="display: inline;">
                                                                Email Successful forms <a class="flow-tip" original-title="Once the form is submitted without any errors, an email with the complete form information will be sent based on the below fields"
                                                                    href="#">(?)</a></label>
                                                        </div>
                                                        <div id="flow-options-email-options">
                                                            <label for="flow-options-email-to">
                                                                To <a class="flow-tip" original-title="&#39;TO&#39; field for the email sent for a successfully submitted form, for multiple email addresses seperate them with a &#39;;&#39; no leading or ending spaces"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="flow-options-email-to" class="email-input">
                                                            <label for="flow-options-email-cc">
                                                                CC <a class="flow-tip" original-title="&#39;CC&#39; field for the email sent for a successfully submitted form, for multiple email addresses seperate them with a &#39;;&#39; no leading or ending spaces"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="flow-options-email-cc" class="email-input">
                                                            <label for="flow-options-email-subject">
                                                                Email Subject <a class="flow-tip" original-title="Subject for the email sent for a successfully submitted form"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="flow-options-email-subject" class="email-input" value="New Form Received">
                                                            <div>
                                                                <input type="checkbox" id="flow-options-email-smtp" class="checkbox">
                                                                <label for="flow-options-email-smtp" style="display: inline; margin-left: 0;">
                                                                    SMTP Server <a class="flow-tip" original-title="Please select this only if you will be using a SMTP server for sending emails"
                                                                        href="#">(?)</a></label>
                                                            </div>
                                                            <div id="flow-options-email-smtpserver" style="display: none">
                                                                <label for="flow-options-email-smtphost">
                                                                    SMTP Host <a class="flow-tip" original-title="The SMTP server address for sending emails"
                                                                        href="#">(?)</a></label>
                                                                <input type="text" id="flow-options-email-smtphost" class="email-input" value="localhost">
                                                                <label for="flow-options-email-smtp-username">
                                                                    Username <a class="flow-tip" original-title="SMTP Username - if the SMTP server requires authentication, leave this field blank if your SMTP server doesn&#39;t require authentication"
                                                                        href="#">(?)</a></label>
                                                                <input type="text" id="flow-options-email-smtp-username" class="email-input">
                                                                <label for="flow-options-email-smtp-password">
                                                                    Password <a class="flow-tip" original-title="SMTP Password - if the SMTP server requires authentication, leave this field blank if your SMTP server doesn&#39;t require authentication"
                                                                        href="#">(?)</a></label>
                                                                <input type="text" id="flow-options-email-smtp-password" class="email-input">
                                                            </div>
                                                        </div>		</div>
										</div>
									</div>
									    <div class="accordion-group">
										<div class="accordion-heading">
											<a href="#collapse_3" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">
											<i class="icon-angle-left"></i>
											User Access
											</a>
										</div>
										<div class="accordion-body collapse" id="collapse_3">
											<div class="accordion-inner">
												
                                                        <div style="margin-top: 10px;">
                                                            <input type="checkbox" id="flow-options-db-savedata" class="checkbox">
                                                            <label for="flow-options-db-savedata" style="display: inline;">
                                                                Save Data to DB<a class="flow-tip" original-title="Once the form is submitted without any errors, the data will be saved to a MySQL database"
                                                                    href="#">(?)</a></label>
                                                        </div>
                                                        <div id="flow-options-db-options" style="display: none">
                                                            <label for="flow-options-db-server">
                                                                Server Hostname <a class="flow-tip" original-title="The hostname or IP Address of the MySQL Server"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="flow-options-db-server" class="email-input" value="localhost">
                                                            <label for="flow-options-db-username">
                                                                DB Username <a class="flow-tip" original-title="Username to access the MySQL server"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="flow-options-db-username" class="email-input">
                                                            <label for="flow-options-db-password">
                                                                DB Password <a class="flow-tip" original-title="Password to access the MySQL server"
                                                                    href="#">(?)</a></label>
                                                            <input type="password" id="flow-options-db-password" class="email-input">
                                                            <label for="flow-options-db-dbname">
                                                                Database Name <a class="flow-tip" original-title="The name of the database " href="#">
                                                                    (?)</a></label>
                                                            <input type="text" id="flow-options-db-dbname" class="email-input">
                                                            <label for="flow-options-db-tablename">
                                                                Table Name <a class="flow-tip" original-title="The name of the table which will store the form data, it will be created in the above mentioned database. It&#39;s always recommended that you don&#39;t have an existing table with the same name in the database."
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="flow-options-db-tablename" class="email-input">
                                                        </div>	</div>
										</div>
									</div>
									
								                </div>

												</div>
											</div>
										</div>

                                                    <div id="right-arrow">
                                                    </div>
                                                </div>
                                                <!--left-column-->
                                                <script type="text/javascript">
                                                 //   var el = document.getElementById("left-column");
                                                  //  el.style.display = 'block';
                                                  //  el = document.getElementById("theme-changer-container");
                                                  //  el.style.display = 'block';
                                                </script>
                                                <div id="main-column" style="height: 450px;" class="span8">
                                                    <h1 id="flow-name" >New Flow</h1>
                                                    <form id="dynamic-flow" action="" method="post" enctype="multipart/flow-data" class="ui-sortable"> <!--flow-->
                                                   
                                                    </form>
                                                </div>
                                                <!--main-column-->
                                                </div><!-- end of fluid -->
                                                <div id="dialog-box">
                                                </div>
                                                <div id="error-message">
                                                </div>
                                                <div class="clr">
                                                </div>
                                            </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
            <!-- END PAGE CONTAINER-->
        </div>
        <!-- END PAGE -->
    </div>
    <!-- END CONTAINER -->
    <theme:footer ID="footer" runat="server" />
    <!-- BEGIN JAVASCRIPTS -->
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/breakpoints/breakpoints.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="assets/js/jquery.blockui.js"></script>
    <script src="assets/js/jquery.cookie.js"></script>
    <script src="assets/js/jquery-ui-1.8.23.custom.min.js"></script>
    <!-- ie8 fixes -->
    <!--[if lt IE 9]>
   <script src="assets/js/excanvas.js"></script>
   <script src="assets/js/respond.js"></script>
   <![endif]-->
    <script type="text/javascript" src="assets/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="assets/uniform/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script type="text/javascript" src="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script type="text/javascript" src="assets/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
    <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
    <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script type="text/javascript" src="assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    <script src="assets/js/app.js"></script>
  
    <script>
        jQuery(document).ready(function () {
            // initiate layout and plugins
            App.init();
            
        });

        jQuery(document).ready(function () {
            $("#flow-options-style").change(function () {

                var a = $("#flow-options-style option:selected").attr("id");

                $("link#csstheme").attr("href", "assets/flow-css/" + a + ".css")
            });

            
        });
    </script>
    <script type="text/javascript" src="assets/js/jquery.metadata.js"></script>
    <script type="text/javascript" src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript" src="assets/js/jquery.tipsy.js"></script>
    <script type="text/javascript" src="assets/js/jquery.json-2.3.min.js"></script>
    <script type="text/javascript" src="assets/js/jQuery.fileinput.js"></script>
     <script src="assets/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/flow/main.min.js"></script>
    <script type="text/javascript" src="assets/js/flow/flow.min.js"></script>
   
    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
