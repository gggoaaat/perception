﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form2Document.aspx.cs" Inherits="CMS.Form2Document" %>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head id="Head1" runat="server">
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
                        <div id="Grid_Controls">

                            <a href="#" id="add_widget" class="btn green">Add widget</a> 
                        </div>
                                                    <div id="buttons-container">
                                                        
                                                        <a href="#" class="btn grey">Preview</a> 
                                                        <a href="#" class="btn blue">
                                                            Save</a>
                                                    </div>
                                                </div>
                        <div style="margin-top:50px;" id="container">
                              <link rel="stylesheet" type="text/css" href="assets/ducksboard-gridster.js-2603104/dist/jquery.gridster.css">
                                <link rel="stylesheet" type="text/css" href="assets/ducksboard-gridster.js-2603104/dist/demo.css">
                             <section class="Form2Document">
                                <div style="position: relative; width:200px; min-height:400px; float:left; background-color:#00ff21; margin: 0 20px 0 0; ">
                                    <script src="http://html5demos.com/h5utils.js"></script>
                                    <article>
                                        <p>Drag the list items over the dustbin, and drop them to have the bin eat the item</p>
                                        <div id="bin"></div>
                                        <ul>
                                        <li><img src="http://twitter.com/api/users/profile_image/rem" alt="Remy Sharp"></li>
                                        <li><img src="http://twitter.com/api/users/profile_image/rem" alt="Remy Sharp"></li>
                                        <li><a draggable="true" href="#" id="three" class="btn green">three</a></li>
                                        <li><a draggable="true" href="#" id="four" class="btn green">four</a></li>
                                        <li draggable="true"><a  href="#" id="five" class="btn green">five</a></li>
                                        </ul>
                                    </article>

                                    <script>
                                        function cancel(e) {
                                            if (e.preventDefault) {
                                                e.preventDefault();
                                            }
                                            return false;
                                        }

                                        var drop = document.querySelector('.gridster UL > LI');

                                        // Tells the browser that we *can* drop on this target
                                        addEvent(drop, 'dragover', cancel);
                                        addEvent(drop, 'dragenter', cancel);

                                        addEvent(drop, 'drop', function (e) {
                                            if (e.preventDefault) e.preventDefault(); // stops the browser from redirecting off to the text.

                                            this.innerHTML += '<p>' + e.dataTransfer.getData('Text') + '</p>';
                                            return false;
                                        });
</script>
                                </div>
                                
                                 <div style="position: relative;float:left;  height:842px; width:582px; overflow:hidden; background: #fff; padding:45px 45px 25px 44px; 
                        background-image:url(assets/_EP-PageGrid/PageGridSafeZone.png); background-repeat:no-repeat;">
                                <div class="gridster">
                                <ul style="position: relative; height: 760px;">
                                        <!--li data-row="1" data-col="1" data-sizex="5" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></!--li>
                                        <li data-row="1" data-col="6" data-sizex="5" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="2" data-col="1" data-sizex="5" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="1" data-col="11" data-sizex="5" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="3" data-col="1" data-sizex="24" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="1" data-col="16" data-sizex="9" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="4" data-col="1" data-sizex="24" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>               
                                        <li data-row="2" data-col="6" data-sizex="5" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="5" data-col="1" data-sizex="24" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="2" data-col="11" data-sizex="14" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-row="6" data-col="1" data-sizex="5" data-sizey="1" class="gs-w"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li-->               
                                        <li data-col="1" data-row="1" data-sizex="57" data-sizey="4" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="58" data-row="1" data-sizex="59" data-sizey="4" class="gs-w" style="display: list-item; min-width: 5px; min-height: 20px; position: absolute;"><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="5" data-sizex="57" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="58" data-row="5" data-sizex="59" data-sizey="1" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="58" data-row="6" data-sizex="59" data-sizey="1" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="7" data-sizex="57" data-sizey="4" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="58" data-row="7" data-sizex="35" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="93" data-row="7" data-sizex="24" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="58" data-row="9" data-sizex="59" data-sizey="1" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="58" data-row="10" data-sizex="59" data-sizey="1" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="11" data-sizex="57" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="58" data-row="11" data-sizex="59" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="13" data-sizex="116" data-sizey="4" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="17" data-sizex="116" data-sizey="5" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="22" data-sizex="116" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="24" data-sizex="116" data-sizey="3" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="27" data-sizex="116" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="29" data-sizex="116" data-sizey="1" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="30" data-sizex="116" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="32" data-sizex="48" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="49" data-row="32" data-sizex="48" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="97" data-row="32" data-sizex="20" data-sizey="2" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                        <li data-col="1" data-row="34" data-sizex="116" data-sizey="5" class="gs-w" ><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>
                                </ul>
                                </div></div>
                            </section>

                                <script type="text/javascript" src="assets/js/jquery-1.7.2.min.js"></script>
     <script type="text/javascript" src="assets/ducksboard-gridster.js-2603104/src/jquery.coords.js" charster="utf-8"></script>
    <script type="text/javascript" src="assets/ducksboard-gridster.js-2603104/src/jquery.gridster.js" charster="utf-8"></script>
  
    <script type="text/javascript">
        var gridster;

        $(function () {
            gridster = $(".gridster > ul").gridster({
                widget_margins: [0, 0],
                widget_base_dimensions: [5, 20],
                min_cols: 8,

                resize: { enabled: true }
            }).data('gridster');
        });


        $('#add_widget').on('click', function () {
            gridster.add_widget('<li><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span><span class="gs-resize-handle gs-resize-handle-x"></span><span class="gs-resize-handle gs-resize-handle-y"></span><span class="gs-resize-handle gs-resize-handle-both"></span></li>', 20, 5)
        });
      </script> 


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
    <!--script src="assets/js/jquery-1.8.3.min.js"></!--script-->
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
