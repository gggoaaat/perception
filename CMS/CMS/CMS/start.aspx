<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="start.aspx.cs" Inherits="CMS.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!-- BEGIN HEAD -->
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/metro.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/style_responsive.css" rel="stylesheet" />
    <link href="assets/css/style_default.css" rel="stylesheet" id="style_color" />
    <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
    <link rel="shortcut icon" href="favicon.ico" />
</head>

<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
  <!-- BEGIN LOGO -->
  <div class="logo">
    <img src="assets/img/logo-big.png" alt="" /> 
  </div>
  <!-- END LOGO -->
  <!-- BEGIN LOGIN -->
  <div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form id="form_start" name="form_start" class="form-vertical login-form" 
      runat="server">
      <h3 class="form-title">Create your platform</h3> 
        <div class="alert alert-error hide">
        <button class="close" data-dismiss="alert"></button>
        <span><asp:Label ID="Message" runat="server" Text="Please enter valid data."></asp:Label></span>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="input-icon left">
            <i class="icon-pencil"></i>
            <asp:TextBox ID="PlatformNametxt" name="platformname" runat="server" CssClass="m-wrap" placeholder="Platform Name"></asp:TextBox>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="input-icon left">
            <i class="icon-briefcase"></i>
            <asp:TextBox ID="DatabaseTypetxt" runat="server" name="databasetype" CssClass="m-wrap" placeholder="Database Type"></asp:TextBox>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="input-icon left">
            <i class="icon-briefcase"></i>
            <asp:TextBox ID="DataSourcetxt" runat="server" name="datasource" CssClass="m-wrap" placeholder="Database Name"></asp:TextBox>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="input-icon left">
            <i class="icon-user"></i>
            <asp:TextBox ID="Usertxt" runat="server" name="user" CssClass="m-wrap" placeholder="UserName"></asp:TextBox>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="input-icon left">
            <i class="icon-lock"></i>
            <asp:TextBox ID="Passwordtxt" runat="server" name="password" CssClass="m-wrap" placeholder="Password"></asp:TextBox>
          </div>
        </div>
      </div>
      <div class="form-actions">
          <asp:Button ID="loginbtn1" runat="server" Text="Submit" 
              CssClass="btn green pull-right" ViewStateMode="Disabled" />
      </div>
    </form>
    <!-- END LOGIN FORM -->        
   
  </div>
  <!-- END LOGIN -->
  <!-- BEGIN COPYRIGHT -->
  <div class="copyright">
    2013 © Eminent IT, LLC</div>
  <!-- END COPYRIGHT -->
  <!-- BEGIN JAVASCRIPTS -->    
   <!-- Load javascripts at bottom, this will reduce page load time -->
   <script src="assets/js/jquery-1.8.3.min.js"></script>    
   <script src="assets/breakpoints/breakpoints.js"></script>      
   <script src="assets/bootstrap/js/bootstrap.min.js"></script>
   <script src="assets/js/jquery.blockui.js"></script>
   <script src="assets/js/jquery.cookie.js"></script>
   <!-- ie8 fixes -->
   <!--[if lt IE 9]>
   <script src="assets/js/excanvas.js"></script>
   <script src="assets/js/respond.js"></script>
   <![endif]-->
   <script type="text/javascript" src="assets/chosen-bootstrap/chosen/chosen.jquery.min.js"></script>
   <script type="text/javascript" src="assets/uniform/jquery.uniform.min.js"></script>
   <script type="text/javascript" src="assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
   <script type="text/javascript" src="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>

   <script type="text/javascript" src="assets/jquery-validation/dist/jquery.validate.min.js"></script>
   <script type="text/javascript" src="assets/js/jquery.tipsy.js"></script>
   
   <script type="text/javascript" src="assets/jquery-validation/dist/additional-methods.min.js"></script>
   <script src="assets/js/app.js"></script>     
   <script>
       jQuery(document).ready(function () {
           // initiate layout and plugins
           App.setPage("Start");
           App.initStart();
       });
   </script>
   <!-- END JAVASCRIPTS -->   
</body>
<!-- END BODY -->
</html>
