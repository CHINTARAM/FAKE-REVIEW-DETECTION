<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewUser.aspx.cs" Inherits="Admin_ViewUser" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/Admin/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Admin/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Admin/Includes/footer.ascx" %>
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
                        User Details</h2>
                    <hr>
                    <table>
                        <tr>
                            <td class="style3">
                            </td>
                            <td class="style4">
                                <asp:Label ID="lblShow" runat="server"></asp:Label>
                            </td>
                            <td class="style5">
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                First Name :
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtFirst" runat="server" Height="26px" Width="134px"></asp:TextBox>
                            </td>
                            <td class="style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirst"
                                    ErrorMessage="First Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Last Name :
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtLast" runat="server" Height="26px" Width="134px"></asp:TextBox>
                            <td class="style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLast"
                                    ErrorMessage="Last Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Address :
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtAddress" runat="server" Height="82px" Width="160px"></asp:TextBox>
                            <td class="style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Phone no. :
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtPhone" runat="server" Height="26px" Width="134px" MaxLength="10"></asp:TextBox>
                            <td class="style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="Phone No Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="Invalid Phone No." ForeColor="Red" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Email ID :
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtEmail" runat="server" Height="26px" Width="160px"></asp:TextBox>
                            <td class="style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Email Id Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Invalid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Change Status :</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="150px" 
                                    AutoPostBack="True">
                                <asp:ListItem Text="False" Value="0">Change Here</asp:ListItem>
                                <asp:ListItem Text="True" Value="1">UnBlocked</asp:ListItem>
                                <asp:ListItem Text="False" Value="2">Blocked</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSave" runat="server" Height="34px" onclick="btnSave_Click" 
                                    Text="Save" Width="82px" />
                            </td>
                            <td>
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
