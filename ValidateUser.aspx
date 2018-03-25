<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidateUser.aspx.cs" Inherits="ValidateUser" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx" %>
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
                        Validating the Information</h2>
                    <hr>
                    <table>
                        <tr>
                            <td>
                            </td>
                            <td>
                                This Is Mandatory
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFeedback" runat="server" Height="307px" TextMode="MultiLine"
                                    Width="632px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <div>
                                    <div style="float: left;">
                                        <asp:ImageButton ID="btnLike" runat="server" Height="127px" Width="141px" ImageUrl="~/images/Like.jpg"
                                            OnClick="btnLike_Click" /></div>
                                    <div style="text-align: right;">
                                        <asp:ImageButton ID="btnDislike" runat="server" Height="127px" Width="141px" ImageUrl="~/images/Unlike.jpg"
                                            OnClick="btnDislike_Click" />
                                    </div>
                                </div>
                                <div>
                                    <center>
                                        <asp:Button ID="btnFinish" runat="server" Text="Finish" Height="45px" 
                                    Width="111px" onclick="btnFinish_Click" Visible="False" /></center>
                                </div>
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
