<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="Admin_ManageUser" %>

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
                        Manage Users</h2>
                    <hr>
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                        Width="730px" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="User_id" DataField="User_id" SortExpression="User_id" />
                            <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
                            <asp:BoundField HeaderText="Phone No." DataField="Phone" SortExpression="Phone" />
                            <asp:BoundField HeaderText="Email Id" DataField="Email" SortExpression="Email" />
                            <asp:BoundField HeaderText="User Status" DataField="Status" SortExpression="Status" />
                            <asp:HyperLinkField HeaderText="Details" DataNavigateUrlFields="User_id" DataNavigateUrlFormatString="ViewUser.aspx?Action=view&amp;User_id={0}"
                                Text="View" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
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
