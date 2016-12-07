<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>一起签</title>
	<link rel="stylesheet" href="App_Themes/style.css" /> 
</head>
<body>
    <form id="form1" runat="server">
    <div class="zhuce">
	    <asp:HyperLink ID="HyperLink_zhuce" runat="server" BorderStyle="None" 
            CssClass="HyperLink_zhuce" ForeColor="#999999" 
            NavigateUrl="~/register.aspx" >注册</asp:HyperLink>
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/login.aspx" 
            EnableTheming="False" >登录</asp:HyperLink>
        <br />
	</div>
	<div class="header">
	    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/banner.png"/> 
	</div>
	<div class="menu">
	    <div class="item active">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="active2">首 页</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/store.aspx" >店 铺 详 情</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/register.aspx" 
                EnableTheming="True" >欢 迎 进 驻</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/manage.aspx" >商 家 管 理</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/about.aspx" >关 于 一 起 签</asp:HyperLink>
        </div>
	</div>
	<div class="container">
		<div class="prompt_bar">今 日推 荐</div> 
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/store.aspx?id=1" ><asp:Image ID="Image2" runat="server" style="width:260px;height:150px;" /></asp:HyperLink>
        </div>
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/store.aspx?id=2"><asp:Image ID="Image3" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div>
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/store.aspx?id=3"><asp:Image ID="Image4" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div>
        <!------>
		<div class="pic_bar">
            <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/store.aspx?id=4"><asp:Image ID="Image5" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div> 
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/store.aspx?id=5"><asp:Image ID="Image6" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div> 
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/store.aspx?id=6"><asp:Image ID="Image7" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div> 
        <div class="prompt_bar">火 爆商 家</div>
        <!------>
		<div class="prompt_bar">新 晋商 家</div> 
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/store.aspx?id=7"><asp:Image ID="Image8" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div> 
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/store.aspx?id=2"><asp:Image ID="Image9" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div> 
        <div class="pic_bar">
            <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/store.aspx?id=1"><asp:Image ID="Image10" runat="server" style="width:260px;height:150px;"/></asp:HyperLink>
        </div>
	</div>
	<div class="bottom">
	</div>
    </form>
</body>
</html>
