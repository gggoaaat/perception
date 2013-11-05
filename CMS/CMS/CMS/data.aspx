<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="data.aspx.cs" Inherits="CMS.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eminent CMS Configuration Screen</title>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
      /*  $(document).ready*/(function() {
            $.ajax({
                url: '/ws/test.asmx/HelloWorld',
                data: '{}',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    alert(data.d, status);
                }
            });
        });

</script>
</head>
<body>


    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder runat="server" ID="currentDBStatus" >
             <asp:DataGrid runat="server" ID="dg" Visible="true" AutoGenerateColumns="true" />
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="createCmsDiv" Visible="false">
                <div style="Position:relative; width:100%; border-top: 2px solid #000; margin: 0 auto; text-align:left; padding-left:20%; ">
                <asp:PlaceHolder runat="server" ID="DBStatusHolder"></asp:PlaceHolder>
                    <h1>Start Installation of CMS</h1>
                    <hr />
                    <asp:Button runat="server" ID="submitCmsName" Text="Start Oracle Installation" onclick="submitOracleServer_Click" />
                    <asp:Button runat="server" ID="submitSqlServer" Text="Start SQL Server Installation" onclick="submitSqlServer_Click" />
                    Pressing Start install will ask a series of question that will Create Datafiles,  Root User, Profile, TableSpace, and Core Tables.
                    <h1>Toolset</h1>
                    <asp:DropDownList runat="server" ID="DBTypeddl" >
                    <asp:ListItem Text="Microsoft" Value="MICROSOFT"></asp:ListItem>
                    <asp:ListItem Text="Oracle" Value="ORACLE"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button runat="server" ID="subQuery" Text="Query" onclick="submitQuery_Click" />
                    <asp:Button runat="server" ID="NoneQuery" Text="None Query" onclick="submitNoneQuery_Click" />
                    <br />
                    <asp:TextBox runat="server" ID="SQLText" Height = "100px" Width = "750px"    />
                </div>
            </asp:PlaceHolder>

            <div style="Position:relative; width:100%; border-top: 2px solid #000; margin: 0 auto; text-align:left; padding-left:20%; ">
                <asp:PlaceHolder runat="server" ID="InstallerHolder" Visible="false">
                    <h1>Status Log</h1>
                    <hr />    
                    
                    <asp:DataGrid runat="server" ID="DGResults" Visible="true" AutoGenerateColumns="true" Width="100%" >
                        
                    </asp:DataGrid>     
            </asp:PlaceHolder> 
            </div>

           
             
        </div>
    </form>
   
</body>
</html>
