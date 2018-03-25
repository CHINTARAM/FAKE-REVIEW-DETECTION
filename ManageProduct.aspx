<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageProduct.aspx.cs" Inherits="Admin_ManageProduct" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/Admin/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Admin/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Admin/Includes/footer.ascx"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                        Manage Product</h2>
                    <hr>
                   
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

