<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/javascript">
        table tr
        {
            width: 100%;
        }
        table tr td
        {
            text-align: center;
        }
    </style>
    <style type="text/css">
        .style1
        {
            width: 305px;
            text-align: center;
        }
        .style2
        {
            width: 136px;
            text-align: center;
        }
        .style3
        {
            width: 258px;
            text-align: center;
        }
    </style>
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
                        Cart</h2>
                    <table>
                        <tr>
                            <th>
                                <span>ID</span>
                            </th>
                            <th class="style1">
                                <span>Product Name</span>
                            </th>
                            <th class="style2">
                                <span>Product Qty</span>
                            </th>
                            <th class="style3">
                                <span>Price</span>
                            </th>
                        </tr>
                        <%if (objDs.Tables.Count > 0)
                          { %>
                        <%for (int i = 0; i < objDs.Tables[0].Rows.Count; i++)
                          {                           
                        %>
                        <tr>
                            <td>
                                <%=i + 1%>
                            </td>
                            <td class="style1">
                                <%=objDs.Tables[0].Rows[i]["ProductName"].ToString()%>
                            </td>
                            <td class="style2">
                                1
                            </td>
                            <td class="style3">
                                <%=objDs.Tables[0].Rows[i]["Price"].ToString()%>
                            </td>
                        </tr>
                        <%}
                          }%>
                        <tr>
                            <td>
                            </td>
                            <td class="style1">
                                <asp:Button ID="btnBuy" runat="server" Height="28px" OnClick="btnBuy_Click" Text="Buy"
                                    Width="68px" />
                            </td>
                            <td class="style2">
                                Total:
                            </td>
                            <td class="style3">
                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
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
