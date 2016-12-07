<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>一起签注册</title>
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
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/store.aspx" >店 铺 详 情</asp:HyperLink>
        </div>
        <div class="item active">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/register.aspx" CssClass="active2">欢 迎 进 驻</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/manage.aspx" >商 家 管 理</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/about.aspx" >关 于 一 起 签</asp:HyperLink>
        </div>
	</div>
	<div class="container">
		<div class="register">
            <p style="font-weight:600;font-size:22px;text-indent:2;width:400px;margin-left:50px;">请准确填写以下相关信息！</p>
            <div class="r_label">店名</div><asp:TextBox ID="TextBox1" runat="server" CssClass="r_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="请填写店铺名字！" ControlToValidate="TextBox1" CssClass="vali"></asp:RequiredFieldValidator>
            <div class="r_label">密码</div><asp:TextBox ID="TextBox2" runat="server" CssClass="r_input" TextMode="Password" ControlToValidate="TextBox2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="请填写密码!" ControlToValidate="TextBox2" CssClass="vali"></asp:RequiredFieldValidator>
            <div class="r_label">确认密码</div><asp:TextBox ID="TextBox3" runat="server" CssClass="r_input" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ErrorMessage="两次密码不一致请重试!" ControlToCompare="TextBox2" 
                ControlToValidate="TextBox3" ValueToCompare="TextBox2" CssClass="vali"></asp:CompareValidator>
            <div class="r_label">地址</div><asp:TextBox ID="TextBox4" runat="server" CssClass="r_input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="vali" runat="server" ErrorMessage="请填写准确地址!" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
            <div class="r_label">联系电话</div><asp:TextBox ID="TextBox5" runat="server" CssClass="r_input"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="请正确填写电话号码!" 
                ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{11}" 
                ControlToValidate="TextBox5" CssClass="vali"></asp:RegularExpressionValidator>
            <div class="r_label">最大容纳人数</div><asp:TextBox ID="TextBox7" runat="server" CssClass="r_input"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ErrorMessage="请输入0-500的整数" MaximumValue="500" MinimumValue="0" 
                ControlToValidate="TextBox7" CssClass="vali"></asp:RangeValidator>
            <div class="r_label">店铺简介</div><asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="请填写店铺简介，不要超过20字!" ControlToValidate="TextBox8" CssClass="vali_s"></asp:RequiredFieldValidator>
            <div class="r_label">上传头像</div><asp:FileUpload ID="FileUpload1" runat="server" />
            <p style="text-align:center"><asp:CheckBox ID="CheckBox1" runat="server" 
                />同意并接受<a href="202.118.89.16/service.htm">《一起签商家协议》</a>。</p>
            <asp:Button ID="Button1" runat="server" Text="确认注册" style="margin-left:160px" />
        </div>
	</div>
	<div class="bottom">
	</div>
    </form>
</body>
</html>
