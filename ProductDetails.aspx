<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails"
    MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="~/Includes/header.ascx" %>
<%@ Register TagPrefix="uc2" TagName="leftmenu" Src="~/Includes/Left_menu.ascx" %>
<%@ Register TagPrefix="uc3" TagName="footer" Src="~/Includes/footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="Style/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Style/css/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: auto;
            height: auto;
        }
    </style>
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
                        <div class="product-details">
                            <!--product-details-->
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <asp:Image ID="Image1" runat="server" />
                                    <%-- <img src="Style/images/product-details/1.jpg" alt="" />--%>
                                    <%--<h3>
                                        ZOOM</h3>--%>
                                </div>
                                <%--<div id="similar-product" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <a href="">
                                                <img src="Style/images/product-details/similar1.jpg" alt=""></a> <a href="">
                                                    <img src="Style/images/product-details/similar2.jpg" alt=""></a> <a href="">
                                                        <img src="Style/images/product-details/similar3.jpg" alt=""></a>
                                        </div>
                                        <div class="item">
                                            <a href="">
                                                <img src="Style/images/product-details/similar1.jpg" alt=""></a> <a href="">
                                                    <img src="Style/images/product-details/similar2.jpg" alt=""></a> <a href="">
                                                        <img src="Style/images/product-details/similar3.jpg" alt=""></a>
                                        </div>
                                        <div class="item">
                                            <a href="">
                                                <img src="Style/images/product-details/similar1.jpg" alt=""></a> <a href="">
                                                    <img src="Style/images/product-details/similar2.jpg" alt=""></a> <a href="">
                                                        <img src="Style/images/product-details/similar3.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <!-- Controls -->
                                    <a class="left item-control" href="#similar-product" data-slide="prev"><i class="fa fa-angle-left">
                                    </i></a><a class="right item-control" href="#similar-product" data-slide="next"><i
                                        class="fa fa-angle-right"></i></a>
                                </div>--%>
                            </div>
                            <div class="col-sm-7">
                                <div class="product-information">
                                    <!--/product-information-->
                                    <%-- <img src="Style/images/product-details/new.jpg" class="newarrival" alt="" />--%>
                                    <h2>
                                        <%=PName%></h2>
                                    <p>
                                        Web ID: 1089772</p>
                                    <%-- <img src="Style/images/product-details/rating.png" alt="" />--%>
                                    <span><span>
                                        <%=Price %></span>
                                        <label>
                                            Quantity:</label>
                                        <input type="text" value="1" />
                                        <button type="submit" runat="server" id="btnAddtocart" onserverclick="btnAddtocart_Click"
                                            class="btn btn-fefault cart">
                                            <i class="fa fa-shopping-cart"></i>Add to cart
                                        </button>
                                    </span>
                                    <p>
                                        <b>Availability:</b> In Stock</p>
                                    <p>
                                        <b>Condition:</b> New</p>
                                    <p>
                                        <b>Brand:</b> E-SHOPPER</p>
                                    <a href="">
                                        <img src="Style/images/product-details/share.png" class="share img-responsive" alt="" /></a>
                                </div>
                                <!--/product-information-->
                            </div>
                        </div>
                        <!--/product-details-->
                        <div class="category-tab shop-details-tab">
                            <!--category-tab-->
                            <%--<div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li><a href="#details" data-toggle="tab">Details</a></li>
                                    <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>
                                    <li><a href="#tag" data-toggle="tab">Tag</a></li>
                                    <li class="active"><a href="#reviews" data-toggle="tab">Reviews (5)</a></li>
                                </ul>
                            </div>--%>
                            <div class="tab-content">
                                <div class="tab-pane fade" id="details">
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery1.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery2.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery3.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery4.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="companyprofile">
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery1.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery3.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery2.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery4.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tag">
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery1.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery2.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery3.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Style/images/home/gallery4.jpg" alt="" />
                                                    <h2>
                                                        $56</h2>
                                                    <p>
                                                        Easy Polo Black Edition</p>
                                                    <button type="button" class="btn btn-default add-to-cart">
                                                        <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade active in" id="reviews">
                                    <asp:Button ID="btnScore" runat="server" Text="Get Sentiment Score" Height="27px"
                                        OnClick="btnScore_Click" Width="140px" />
                                    <div>
                                        <b>User Review</b>
                                        <asp:Repeater ID="RepterDetails" runat="server">
                                            <HeaderTemplate>
                                                <table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="width: 80px; color: #fe980f;">
                                                        Post By :
                                                    </td>
                                                    <td style="color: #fe980f;">
                                                        <%#Eval("Name") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="color: #fe980f;">
                                                        Post Date :
                                                    </td>
                                                    <td style="color: #fe980f;">
                                                        <%#Eval("Date") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="color: #fe980f;">
                                                        Review :
                                                    </td>
                                                    <td>
                                                        <%# Eval("Feedback") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="color: #fe980f;">
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="LinkButton1_Command" CommandName="MyUpdate"
                                                            CommandArgument='<%# Eval("F_id") %>'>Opinion Mining</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </table></FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="col-sm-12">
                                        <%--                                        <ul>
                                            <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                            <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                            <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                                        </ul>--%>
                                        <%-- <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                            incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud
                                            exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure
                                            dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                        <p>--%>
                                        <b>Write Your Review</b></p>
                                        <%-- <form action="#">--%>
                                        <span>
                                            <asp:TextBox ID="txtName" runat="server" Height="24px" Width="160px" placeholder="Your Name"></asp:TextBox>
                                            <asp:TextBox ID="txtEmail" runat="server" Height="24px" Width="160px" placeholder="Email Address"></asp:TextBox>
                                            <%--<input type="text" placeholder="Your Name" />
                                            <input type="email" placeholder="Email Address" />--%>
                                        </span>
                                        <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" CssClass="TextBox3bg"></asp:TextBox>
                                        <%-- <textarea name=""></textarea>--%>
                                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                        </asp:ToolkitScriptManager>
                                        <b>Rating: </b>
                                        <asp:TextBox ID="Slider1" runat="server" AutoPostBack="true"></asp:TextBox>
                                        <asp:Label ID="lblRating" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtRating" runat="server"></asp:TextBox>
                                        <asp:SliderExtender ID="SliderExtender1" runat="server" TargetControlID="Slider1"
                                            Minimum="-5.0" Maximum="5.0" BoundControlID="txtRating" Steps="21" Decimals="2" />
                                        <%--<asp:SliderExtender ID="SliderExtender2" runat="server" TargetControlID="Slider2"
                                            BoundControlID="Slider2_BoundControl" Orientation="Vertical" EnableHandleAnimation="true" />--%>
                                        <%-- <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
                                            Height="24px" Width="80px">
                                        </asp:DropDownList>--%>
                                        <%--<img src="Style/images/product-details/rating.png" alt="" />--%>
                                        <asp:Button ID="btnSubmit" class="btn btn-default pull-right" runat="server" Text="Submit"
                                            OnClick="btnSubmit_Click" />
                                        <%-- </form>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/category-tab-->
                        <%--<div class="recommended_items">
                            <!--recommended_items-->
                            <h2 class="title text-center">
                                recommended items</h2>
                            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="Style/images/home/recommend1.jpg" alt="" />
                                                        <h2>
                                                            $56</h2>
                                                        <p>
                                                            Easy Polo Black Edition</p>
                                                        <button type="button" class="btn btn-default add-to-cart">
                                                            <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="Style/images/home/recommend2.jpg" alt="" />
                                                        <h2>
                                                            $56</h2>
                                                        <p>
                                                            Easy Polo Black Edition</p>
                                                        <button type="button" class="btn btn-default add-to-cart">
                                                            <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="Style/images/home/recommend3.jpg" alt="" />
                                                        <h2>
                                                            $56</h2>
                                                        <p>
                                                            Easy Polo Black Edition</p>
                                                        <button type="button" class="btn btn-default add-to-cart">
                                                            <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="Style/images/home/recommend1.jpg" alt="" />
                                                        <h2>
                                                            $56</h2>
                                                        <p>
                                                            Easy Polo Black Edition</p>
                                                        <button type="button" class="btn btn-default add-to-cart">
                                                            <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="Style/images/home/recommend2.jpg" alt="" />
                                                        <h2>
                                                            $56</h2>
                                                        <p>
                                                            Easy Polo Black Edition</p>
                                                        <button type="button" class="btn btn-default add-to-cart">
                                                            <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="Style/images/home/recommend3.jpg" alt="" />
                                                        <h2>
                                                            $56</h2>
                                                        <p>
                                                            Easy Polo Black Edition</p>
                                                        <button type="button" class="btn btn-default add-to-cart">
                                                            <i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                    <i class="fa fa-angle-left"></i></a><a class="right recommended-item-control" href="#recommended-item-carousel"
                                        data-slide="next"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>--%>
                        <!--/recommended_items-->
                    </div>
                </div>
            </div>
        </div>
        <div>
            <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
            <asp:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="LinkButton2" BehaviorID="mpe"
                runat="server" PopupControlID="pnlPopup" BackgroundCssClass="modalBackground"
                CancelControlID="btnHide">
            </asp:ModalPopupExtender>
            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                <div class="header">
                    Sentiment Analysis of
                    <%=PName %>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        Width="100%" BorderColor="#66CDCB" BorderStyle="None" BorderWidth="2px" CellPadding="4"
                        ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="Feature" ItemStyle-HorizontalAlign="Center" HeaderText="Feature"
                                SortExpression="Feature" />
                            <asp:BoundField DataField="PositivePolarity" ItemStyle-HorizontalAlign="Center" HeaderText="Positive Polarity"
                                SortExpression="PositivePolarity" />
                            <asp:BoundField DataField="NegativePolarity" ItemStyle-HorizontalAlign="Center" HeaderText="Negative Polarity"
                                SortExpression="NegativePolarity" />
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
                <div class="body">
                    <br />
                    <asp:Button ID="btnHide" runat="server" Text="Close" />
                </div>
            </asp:Panel>
        </div>
        <%--<div class="right_section">
                <div class="common_content">
                    <h2>
                        Home</h2>
                    <hr>
                    <asp:Image ID="Image1" runat="server" Height="541px" 
                        ImageUrl="~/images/Picture1.png" Width="728px" />
                </div>
            </div>--%>
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
