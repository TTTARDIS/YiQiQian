﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>一起签登录</title>
	<link rel="stylesheet" href="App_Themes/style.css" /> 
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="login">
        <p>用户名：
            <asp:TextBox ID="TextBox1" runat="server" CssClass="login_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="!" style="margin-left:0;width:20px;color:red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        </p>
        <p>密&nbsp;&nbsp; 码：
            <asp:TextBox ID="TextBox2" runat="server" CssClass="login_input" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" Text="登 录" onclick="Button2_Click" />
        </p>
	    </div>
    </div>
	<div class="bottom">
	</div>
    </form>

    </body>
</html>
