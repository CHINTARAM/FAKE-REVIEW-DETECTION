<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;User id
        <asp:TextBox ID="txtUserid" runat="server"></asp:TextBox>
        <br />
        P ID
        <asp:TextBox ID="txtPid" runat="server"></asp:TextBox>
        <br />
        Rating
        <asp:TextBox ID="txtRating" runat="server"></asp:TextBox>
        <br />
        Feedback
        <asp:TextBox ID="txtAddress" runat="server" Height="102px" TextMode="MultiLine" 
            Width="204px"></asp:TextBox>
        <br />
        date
        <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
        <br />
        User trust degree
        <asp:TextBox ID="txtUsertrustdegree" runat="server"></asp:TextBox>
        <br />
        Feedback Trust Degree
        <asp:TextBox ID="txtFeedbackdegree" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Height="33px" onclick="Button1_Click" 
            Text="Save" Width="80px" />
    
    &nbsp;
        <asp:Button ID="Button2" runat="server" Height="28px" onclick="Button2_Click" 
            Text="Knowledge Base Save" Width="216px" />
    
    </div>
    </form>
</body>
</html>
