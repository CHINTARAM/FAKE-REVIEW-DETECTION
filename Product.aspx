<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="~/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <%-- <link href="Style/css/animate.css" rel="stylesheet" type="text/css" />--%>
    <link href="Style/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%-- <link href="Style/css/font-awesome.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="Style/css/main.css" rel="stylesheet" type="text/css" />
    <%-- <link href="Style/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="Style/css/price-range.css" rel="stylesheet" type="text/css" />
    <link href="Style/css/responsive.css" rel="stylesheet" type="text/css" />--%>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <uc1:header ID="header" runat="server"></uc1:header>
        <div id="page_content">
            <uc2:leftmenu ID="leftmenu" runat="server" />
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 padding-right">
                        <div class="features_items">
                            <!--features_items-->
                            <h2 class="title text-center">
                                Products</h2>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/Moto X (2nd Gen).jpeg" alt="" />
                                            <h2>
                                                Rs: 29,999</h2>
                                            <p>
                                                Moto X (2nd Gen)</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 29,999</h2>
                                                <p>
                                                    Moto X (2nd Gen)</p>
                                                <%--<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback </a>--%>
                                                <asp:LinkButton ID="LinkButton1" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton1_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/sony-xperia-zr.jpeg" alt="" />
                                            <h2>
                                                Rs: 26,999</h2>
                                            <p>
                                                Sony Xperia ZR</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 26,999</h2>
                                                <p>
                                                    Sony Xperia ZR</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton2" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton2_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/lg-nexus-5.jpeg" alt="" />
                                            <h2>
                                                Rs: 26,535</h2>
                                            <p>
                                                Google Nexus 5</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 26,535</h2>
                                                <p>
                                                    Google Nexus 5</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton3" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton3_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/lenovo-vibe-z2.jpeg" alt="" />
                                            <h2>
                                                Rs: 32,999</h2>
                                            <p>
                                                Lenovo Vibe Z2 Pro</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 32,999</h2>
                                                <p>
                                                    Lenovo Vibe Z2 Pro</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton4" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton4_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                        <img src="Style/images/home/new.png" class="new" alt="" />
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/htc-desire-816.jpeg" alt="" />
                                            <h2>
                                                Rs: 26,499</h2>
                                            <p>
                                                HTC Desire 816</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 26,499</h2>
                                                <p>
                                                    HTC Desire 816</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton5" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton5_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                        <img src="Style/images/home/sale.png" class="new" alt="" />
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/apple-iphone-5c.jpeg" alt="" />
                                            <h2>
                                                Rs: 27,999</h2>
                                            <p>
                                                Apple iPhone 5C</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 27,999</h2>
                                                <p>
                                                    Apple iPhone 5C</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton6" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton6_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/samsung-galaxy-note-3.jpeg" alt="" />
                                            <h2>
                                                Rs: 34,800</h2>
                                            <p>
                                                Samsung Galaxy Note 3 N9000</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 34,800</h2>
                                                <p>
                                                    Samsung Galaxy Note 3 N9000</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton7" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton7_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/blackberry-z30.jpeg" alt="" />
                                            <h2>
                                                Rs: 29,800</h2>
                                            <p>
                                                BlackBerry Z30</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 29,800</h2>
                                                <p>
                                                    BlackBerry Z30</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton8" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton8_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/product11.jpeg" alt="" />
                                            <h2>
                                                Rs: 26,990</h2>
                                            <p>
                                                Nokia Lumia 830</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 26,990</h2>
                                                <p>
                                                    Nokia Lumia 830</p>
                                                <%-- <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton9" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton9_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/oppo-find-7a-x9006.jpeg" alt="" />
                                            <h2>
                                                Rs: 31,990</h2>
                                            <p>
                                                OPPO Find 7a X9006</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 31,990</h2>
                                                <p>
                                                    OPPO Find 7a X9006</p>
                                                <%--  <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton10" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton10_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/lg-optimus-g2.jpeg" alt="" />
                                            <h2>
                                                Rs: 29,899</h2>
                                            <p>
                                                LG G2</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 29,899</h2>
                                                <p>
                                                    LG G2</p>
                                                <%--<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton11" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton11_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="Style/images/shop/micromax-canvas-nitro.jpeg" alt="" />
                                            <h2>
                                                Rs: 12,300</h2>
                                            <p>
                                                Micromax Canvas Nitro A310</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add
                                                to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>
                                                    Rs: 12,300</h2>
                                                <p>
                                                    Micromax Canvas Nitro A310</p>
                                                <%--   <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>New
                                                    Feedback</a>--%>
                                                <asp:LinkButton ID="LinkButton12" class="btn btn-default add-to-cart" 
                                                    runat="server" onclick="LinkButton12_Click">New Feedback</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                            </div>
                            <%--<ul class="pagination">
                                <li class="active"><a href="">1</a></li>
                                <li><a href="">2</a></li>
                                <li><a href="">3</a></li>
                                <li><a href="">&raquo;</a></li>
                            </ul>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
    <!--start footer from here-->
    <uc3:footer ID="footer" runat="server" />
    <!--/. end footer from here-->
    </form>
</body>
</html>
