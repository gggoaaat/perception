<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newform.aspx.cs" Inherits="CMS.NewForm" %>

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
    <title>Eminent | New Form</title>
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
    <link href="assets/form-css/css" rel="stylesheet" type="text/css">
    <link href="assets/form-css/css(1)" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/form-css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="assets/form-css/form.css" type="text/css" media="all">
    <link rel="stylesheet" href="assets/form-css/style1.css" type="text/css" media="all" id="csstheme">
    <link rel="stylesheet" href="assets/form-css/tipsy.css" type="text/css" media="all">
    <link rel="stylesheet" href="assets/form-css/enhanced.css" type="text/css" media="all">
   
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
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
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
            <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <!-- BEGIN PAGE CONTAINER-->
            <div class="container-fluid">
                <!-- BEGIN PAGE HEADER-->
                <div class="row-fluid">
                    <div class="span12">
                        <theme:customizer ID="customizer" runat="server" />
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <h3 class="page-title">New Form<small></small>
                        </h3>
                        <ul class="breadcrumb">
                            <li><i class="icon-home"></i><a href="index.html">Home</a> <i class="icon-angle-right">
                            </i></li>
                            <li><a href="#">New Form</a> </li>
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
                                                        <a href="#" class="btn grey" id="form-preview-btn">Preview</a>
                                                         <a  href="#" class="btn blue" id="form-save-btn">Save</a>

                                                    </div>
                                                    </div>
                         <div id="container" style="margin-top:50px;">
                                                
                                                
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
                                               <div>
                                         <div class="tabbable tabbable-custom">
											<ul class="nav nav-tabs" id="form-tabs">
												<li class="active"><a data-toggle="tab" href="#form-elements">Form Fields</a></li>
												<li class=""><a data-toggle="tab" href="#element-options">Field Options</a></li>
												<li class=""><a data-toggle="tab" href="#form-options">Form Settings</a></li>
											</ul>
											<div class="tab-content">
												<div id="form-elements" class="tab-pane active">
													<ul>
                                                            <div class="form-element-heading">
                                                                Normal Fields</div>
                                                            
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="paragraph_text form-element button1">
                                                                Paragraph Text</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="rich_text form-element button1">
                                                                Rich Text</a></li>

                                                            <li style="position: relative; left: 0px; top: 0px;" class="ui-draggable"><a href="#"
                                                                class="single_line_text form-element button1">Single Line Text</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="check_box form-element button1">
                                                                Check Box</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="radio_buttons form-element button1">
                                                                Radio Buttons</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="drop_down form-element button1">
                                                                Drop Down</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="section form-element button1">
                                                                Section</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="page_break form-element button1">
                                                                Page Break</a></li>

                                                            <div class="form-element-heading">
                                                                Extra Fields</div>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_number form-element button1">
                                                                Number</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_email form-element button1">
                                                                Email</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_url form-element button1">
                                                                Url</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_date form-element button1">
                                                                Date</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_time form-element button1">
                                                                Time</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_phone form-element button1">
                                                                Phone</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_credit_card form-element button1">
                                                                Credit Card</a></li>
                                                            <li style="position: relative;" class="ui-draggable"><a href="#" class="in_file_upload form-element button1">
                                                                File Upload</a></li>
                                                              <!--  <li style="position: relative;" class="ui-draggable"><a href="#" class="in_password form-element button1">
                                                                Password</a></li>-->
                                                        </ul>
												</div>
												<div id="element-options" class="tab-pane">
													 <p>Please add a form element.</p>
												</div>
												<div id="form-options" class="tab-pane">

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
													<label for="form-options-formname">
                                                            Form Name <a class="form-tip" original-title="The Heading for the form" href="#">
                                                                (?)</a>
                                                        </label>
                                                        <input id="form-options-formname" type="text">
                                                       <!-- <label for="form-options-url">
                                                            Form Id <a class="form-tip" original-title="If you are using your own script to process the form, enter the url of the server side script"
                                                                href="#">(?)</a></label>
                                                        <input id="form-options-url" type="text">-->
                                                        <label for="form-options-action">
                                                            Flow Action<a class="form-tip" original-title="This is the flow action that this form will be tied to."
                                                                href="#">(?)</a></label>
                                                        <select id="form-options-action">
                                                            <option value="post" selected="selected">Flow 1</option>
                                                        </select>
                                                         <select id="Select1">
                                                            <option value="post" selected="selected">Action 1</option>
                                                        </select>
                                                        <label for="form-options-disable">
                                                            Disable Form <a class="form-tip" original-title="Allows you to disable this form to no longer allow submissions"
                                                                href="#">(?)</a></label>
                                                        <select id="form-options-disable">
                                                            <option value="post" selected="selected">Never</option>
                                                            <option value="now">Now</option>
                                                             <option value="date">On date</option>
                                                              <option value="number">After number of submissions</option>
                                                        </select>
                                                        <label for="form-options-style">
                                                            Form Style <a class="form-tip" original-title="The type of style you want the form fields to have."
                                                                href="#">(?)</a></label>
                                                        <select id="form-options-style">
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
												   <label for="form-options-success-msg">
                                                            Success Message For Users <a class="form-tip" original-title="Message to users once the form is submitted without any errors"
                                                                href="#">(?)</a></label>
                                                        <textarea id="form-options-success-msg">Thank you for submitting the form, we will get back to you shortly!</textarea>
                                                        <div style="margin-top: 10px;">
                                                            <input type="checkbox" id="form-options-email-user" class="checkbox">
                                                            <label for="form-options-email-user" style="display: inline;">
                                                                Email Successful forms <a class="form-tip" original-title="Once the form is submitted without any errors, an email with the complete form information will be sent based on the below fields"
                                                                    href="#">(?)</a></label>
                                                        </div>
                                                        <div id="form-options-email-options">
                                                            <label for="form-options-email-to">
                                                                To <a class="form-tip" original-title="&#39;TO&#39; field for the email sent for a successfully submitted form, for multiple email addresses seperate them with a &#39;;&#39; no leading or ending spaces"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="form-options-email-to" class="email-input">
                                                            <label for="form-options-email-cc">
                                                                CC <a class="form-tip" original-title="&#39;CC&#39; field for the email sent for a successfully submitted form, for multiple email addresses seperate them with a &#39;;&#39; no leading or ending spaces"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="form-options-email-cc" class="email-input">
                                                            <label for="form-options-email-subject">
                                                                Email Subject <a class="form-tip" original-title="Subject for the email sent for a successfully submitted form"
                                                                    href="#">(?)</a></label>
                                                            <input type="text" id="form-options-email-subject" class="email-input" value="New Form Received">
                                                            
                                                        </div>		
                                                        
                                               </div>
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
												
                                            </div>
										</div>
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
                                                <div class="span8 " style="border: 1px solid #E9E9E9;">
                                                <div id="main-column" style="height: 500px;" >
                                                    <h1 id="form-name" >New Form</h1>
                                                    <form id="dynamic-form" action="" method="get" enctype="multipart/form-data" class="ui-sortable"> <!--Form-->
                                                   <div id="no-fields" class="alert-info"><h3>Your Form is Empty!</h3><p>This is a live preview of your form. Currently the form is empty as you have not added any fields. Click a button in the "Form Fields" tab on the left to add a field and start building your form!</p></div>
                                                   <input type="hidden" value="" id="form-id" /> 

                                                    </form>
                                                </div>
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
    <script type="text/javascript" src="assets/bootstrap-affix/boostrap-affix.js"></script>
    <script src="assets/js/app.js"></script>
    <script>
        jQuery(document).ready(function () {
            // initiate layout and plugins
            App.init();
        });

        jQuery(document).ready(function () {
            $("#form-options-style").change(function () {

                var a = $("#form-options-style option:selected").attr("id");

                $("link#csstheme").attr("href", "assets/form-css/" + a + ".css")
            });

            
        });
    </script>
    <script type="text/javascript" src="assets/js/jquery.metadata.js"></script>
    <script type="text/javascript" src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript" src="assets/js/jquery.tipsy.js"></script>
    <script type="text/javascript" src="assets/js/jquery.json-2.3.min.js"></script>
    <script type="text/javascript" src="assets/js/jQuery.fileinput.js"></script>
     <script src="assets/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/form/main.min.js"></script>
    <script type="text/javascript" src="assets/js/form/form.min.js"></script>
   <script src="assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js"></script>
<script src="assets/jquery-slimscroll/jquery.slimscroll.min.js"></script> 
    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
