<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 174px;
        }
        .style3
        {
            width: 84px;
        }
        .style4
        {
            width: 202px;
        }
        .style5
        {
            width: 237px;
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
                        Create Your Account IT's Free !</h2>
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
                                Username:
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtUsername" runat="server" Height="26px" Width="134px"></asp:TextBox>
                            </td>
                            <td class="style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                                    ErrorMessage="Username Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Password:
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtPassword" runat="server" Height="26px" Width="134px" 
                                    TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    </table>
                    <div style="margin-left: 40px; height: 80px;">
                        <br />
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" 
                            Text="I agree to the Trustworthiness Terms of Service and Privacy policy " 
                            oncheckedchanged="CheckBox1_CheckedChanged" />
                        &nbsp;&nbsp;<br />
                        <asp:Label ID="lblCheck" runat="server" Visible="false" Text="In order to use our services, you must agree to Trustwothiness Terms of Service."></asp:Label>
                    </div>
                    <table>
                        <tr>
                            <td class="style3">
                            </td>
                            <td class="style4">
                                <asp:ImageButton ID="btnOK" runat="server" Height="36px" ImageUrl="~/images/Ok.jpg"
                                    Width="95px" onclick="btnOK_Click" Enabled="False" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnCancel" runat="server"
                                        Height="36px" ImageUrl="~/images/cancel.jpg" Width="95px" CausesValidation="false" />
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
