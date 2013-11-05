<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newcase.aspx.cs" Inherits="CMS.NewCase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head runat="server">
	<meta charset="utf-8" />
	<title>Eminent | NewCase</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/css/metro.css" rel="stylesheet" />
	<link href="assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
	<link href="assets/css/style.css" rel="stylesheet" />
	<link href="assets/css/style_responsive.css" rel="stylesheet" />
	<link href="assets/css/style_default.css" rel="stylesheet" id="style_color" />
	<link rel="stylesheet" type="text/css" href="assets/chosen-bootstrap/chosen/chosen.css" />
	<link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
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
					<button data-dismiss="modal" class="close" type="button"></button>
					<h3>portlet Settings</h3>
				</div>
				<div class="modal-body">
					<p>Here will be a configuration form</p>
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
						<h3 class="page-title">
							New Case				<small></small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">Home</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">New Case</a>
							
							</li>
							
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
                 <div class="span6">
                    <div class="portlet box grey">
                    <div class="portlet-title">
                        <h4><i class="icon-reorder"></i>Properties</h4>
                        <div class="tools">
                           <a class="collapse" href="javascript:;"></a>
                           <a class="config" data-toggle="modal" href="#portlet-config"></a>
                           <a class="reload" href="javascript:;"></a>
                           <a class="remove" href="javascript:;"></a>
                        </div>
                     </div>
						<div class="portlet-body">This is the first</div>
					</div>
                    </div>
					<div class="span6">
                    <div class="portlet box blue">
                    <div class="portlet-title">
                        <h4><i class="icon-reorder"></i>Documents</h4>
                        <div class="tools">
                           <a class="collapse" href="javascript:;"></a>
                           <a class="config" data-toggle="modal" href="#portlet-config"></a>
                           <a class="reload" href="javascript:;"></a>
                           <a class="remove" href="javascript:;"></a>
                        </div>
                     </div>
						<div class="portlet-body">This is the first</div>
					</div>
                    </div>

                 
				</div>
                <div class="row-fluid">
					<div class="span6">
                    <div class="portlet box red">
                    <div class="portlet-title">
                        <h4><i class="icon-reorder"></i>History</h4>
                        <div class="tools">
                           <a class="collapse" href="javascript:;"></a>
                           <a class="config" data-toggle="modal" href="#portlet-config"></a>
                           <a class="reload" href="javascript:;"></a>
                           <a class="remove" href="javascript:;"></a>
                        </div>
                     </div>
						<div class="portlet-body">This is the first</div>
					</div>
                    </div>

                       <div class="span6">
                    <div class="portlet box green">
                    <div class="portlet-title">
                        <h4><i class="icon-reorder"></i>Tasks</h4>
                        <div class="tools">
                           <a class="collapse" href="javascript:;"></a>
                           <a class="config" data-toggle="modal" href="#portlet-config"></a>
                           <a class="reload" href="javascript:;"></a>
                           <a class="remove" href="javascript:;"></a>
                        </div>
                     </div>
						<div class="portlet-body">This is the first</div>
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
	<script src="assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js"></script>	
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.blockui.js"></script>
	<script src="assets/js/jquery.cookie.js"></script>
	<script src="assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>	
	<script type="text/javascript" src="assets/uniform/jquery.uniform.min.js"></script>
	<script type="text/javascript" src="assets/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
	<!-- ie8 fixes -->
	<!--[if lt IE 9]>
	<script src="assets/js/excanvas.js"></script>
	<script src="assets/js/respond.js"></script>
	<![endif]-->
	<script src="assets/js/app.js"></script>		
	<script>
	    jQuery(document).ready(function () {
	        // initiate layout and plugins
	      /*  App.setPage('calendar');*/
	        App.init();
	    });
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->

</html>
