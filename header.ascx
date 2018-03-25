<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header.ascx.cs" Inherits="Includes_header" %>
<html>
<head>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <%-- <div id="wrapper">--%>
    <div id="header">
        <div class="top_banner">
            <h1>
                Trustworthiness in E-Commerce Context</h1>
            <%--<p>
                    Enter Site Slogan</p>--%>
        </div>
    </div>
    <div id="page_content">
        <div class="navigation">
            <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="Product.aspx">Product</a></li>
                <li><a href="CompareProduct.aspx">Compare</a></li>
                <li><a href="Cart.aspx">Cart</a></li>
                <li>
                    <asp:LinkButton ID="btnLogout" runat="server" CausesValidation="False" OnClick="btnLogout_Click">Logout</asp:LinkButton></li>
                <%--<li><a href="#">Clients</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Resources</a></li>
                    <li><a href="#">Extra</a></li>--%>
            </ul>
        </div>
    </div>
    <%--   </div>--%>
</body>
</html>
