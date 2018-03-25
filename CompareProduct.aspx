<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompareProduct.aspx.cs" Inherits="CompareProduct" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx" %>
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
                        Compare Graph</h2>
                    <hr>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    Select First Product :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlFirst" runat="server" Height="22px" Width="150px" DataTextField="ProductName"
                                        DataValueField="P_id" AutoPostBack="True" OnSelectedIndexChanged="ddlFirst_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Select Second Product:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlSecond" runat="server" Height="22px" Width="150px" DataTextField="ProductName"
                                        DataValueField="P_id" AutoPostBack="True" OnSelectedIndexChanged="ddlSecond_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btnShow" runat="server" Height="29px" Text="Show" Width="63px" OnClick="btnShow_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="clear">
                </div>
                <div>
                    <asp:Chart ID="Chart1" runat="server" Width="728px">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" Name="Dotnet Chart Example" />
                        </Legends>
                        <Series>
                            <asp:Series Name="FirstProduct">
                            </asp:Series>
                            <asp:Series ChartArea="ChartArea1" Name="SecondProduct">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
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
