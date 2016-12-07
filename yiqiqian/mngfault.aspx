<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mngfault.aspx.cs" Inherits="mngfault" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>没有登录</title>
    <link rel="stylesheet" href="App_Themes/style.css" />
    <meta http-equiv="refresh" content="3;url=login.aspx" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="zhuce">
	    <asp:HyperLink ID="HyperLink_zhuce" runat="server" BorderStyle="None" 
            CssClass="HyperLink_zhuce" ForeColor="#999999" NavigateUrl="~/register.aspx" >注册</asp:HyperLink>
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/login.aspx" >登录</asp:HyperLink>
        <br />
	</div>
	<div class="header">
	    <asp:Image ID="Image1" runat="server"  ImageUrl="~/images/banner.png"/>
	</div>
	<div class="menu">
	    <div class="item">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" >首 页</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/store.aspx" CssClass="active2">店 铺 详 情</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/register.aspx" >欢 迎 进 驻</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/manage.aspx" >商 家 管 理</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/about.aspx" >关 于 一 起 签</asp:HyperLink>
        </div>
	</div>
	<div class="container">
        <p style="margin-left:80px;">您还未登录，5秒内自动跳转到登录页，若无法跳转请点击<asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/login.aspx">这里</asp:HyperLink>。</p>
    </div>
    </div>
    </form>
</body>
</html>
