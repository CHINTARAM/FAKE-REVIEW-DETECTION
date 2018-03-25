<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 147px;
        }
        .style2
        {
            width: 164px;
        }
        .style3
        {
            width: 79px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="header">
            <div class="top_banner">
                <h1>
                    Trustworthiness in E-Commerce Context</h1>
                <%--<p>
                    Enter Site Slogan</p>--%>
            </div>
        </div>
        <div id="page_content">
            <div class="right_section">
                <div class="common_content">
                    <h2>
                        Login From Here !</h2>
                    <hr>
                    <table>
                        <tr>
                            <td class="style3">
                            </td>
                            <td class="style2">
                                <asp:Label ID="lblShow" runat="server"></asp:Label>
                            </td>
                            <td class="style1">
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                User Name :</td>
                            <td class="style2">
                                <asp:TextBox ID="txtUsername" runat="server" Height="23px" Width="139px"></asp:TextBox>
                            </td>
                            <td class="style1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtUsername" ErrorMessage="User Name required" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Password :</td>
                            <td class="style2">
                                <asp:TextBox ID="txtPassword" runat="server" Height="23px" Width="139px" 
                                    TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="style1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtPassword" ErrorMessage="Password Required" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                            </td>
                            <td class="style2">
                                <asp:ImageButton ID="btnLogin" runat="server" Height="32px" 
                                    ImageUrl="~/images/login_button.jpg" Width="97px" 
                                    onclick="btnLogin_Click" />
                            </td>
                            <td class="style1">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style3">
                            </td>
                            <td class="style2">
                                <a href="Registration.aspx">Register New User</a></td>
                            <td class="style1">
                            </td>
                        </tr>
                    </table>
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
