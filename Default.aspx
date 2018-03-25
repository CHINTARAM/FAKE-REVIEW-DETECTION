<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <uc1:header ID="header" runat="server"></uc1:header>
        <div id="page_content">
          <uc2:leftmenu ID="leftmenu" runat="server" />
            <div class="right_section">
                <div class="common_content">
                    <h2>
                        Home</h2>
                    <hr>
                    <asp:Image ID="Image1" runat="server" Height="541px" 
                        ImageUrl="~/images/Picture1.png" Width="728px" />
                </div>
            </div>
            <div class="clear">
            </div>
            <!--start footer from here-->
           <uc3:footer ID="footer" runat="server" />
            <!--/. end footer from here-->
        </div>
    </div>
    </form>
</body>
</html>
