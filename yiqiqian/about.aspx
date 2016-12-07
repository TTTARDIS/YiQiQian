<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>关于</title>
	<link rel="stylesheet" href="App_Themes/style.css" /> 
    <style type="text/css">
    .ques{font-weight:bold;color:Black;float:left;margin-left:60px;width:800px;line-height:35px;}
    .ans{color:#303030;float:left;width:800px;margin-bottom:30px;margin-left:60px;line-height:30px;}
    </style>
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
        <div class="item">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/register.aspx" >欢 迎 进 驻</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/manage.aspx" >商 家 管 理</asp:HyperLink>
        </div>
        <div class="item active">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/about.aspx" CssClass="active2">关 于 一 起 签</asp:HyperLink>
        </div>
	</div>
	<div class="container">
		<div class="ques">
        Q：一起签是一款什么样的产品？
        </div>
        <div class="ans">
        A：一起签是一款手机APP，商家如果想进驻一起签可以在这个网站进行注册和相关信息的填写，我方审核通过后即注册成功，
        以后可以在注册条款允许范围内自由更改信息。通常商家应给出具有时间梯度和人数梯度的折扣，用户到达感兴趣的商家后
        签到，系统统计签到人数，用户消费完毕离开时根据人数获得对应折扣。
        </div>
        <div class="ques">
        Q：如果有人恶意刷签到人数怎么办？
        </div>
        <div class="ans">
        A：一起签必须要到店才能签到，系统根据GPS判断是否处于商家店内，若不在则签到失败。所以一起签不能刷签到人数。
        </div>
        <div class="ques">
        Q：这个网站是怎么回事？
        </div>
        <div class="ans">
        A：这是商家版，商家可以在这上面注册成为一起签的合作商家、查看其它商家的信息、设置和更改自己的介绍与折扣、
        查看实时签到人数等。手机版和电脑版应用对象不同，功能也不同，普通消费者应使用手机版完成签到、离开等相关功能。
        </div>
        <div class="ques">
        Q：一起签有其它宣传策略吗？
        </div>
        <div class="ans">
        A：一起签除了线上发布商家信息，还可以协助线下举办一些促销活动，我方将根据规模、性质和需要我方提供的人、力、
        物数量收取一定费用，具体合作请联系虞先生，手机18840835720。
        </div>
        <div class="ques">
        Q：一起签的适用范围？
        </div>
        <div class="ans">
        A：一起签原则上适用于任何在腾讯地图上能够搜索到的商家（注册时请确保地址信息填写正确），但是目前用户主要集中
        于大连，尤其是大连海事大学及其周边。目前进驻一起签不需要费用，欢迎商家进驻形成良好的签到氛围。
        </div>
	</div>
	<div class="bottom">
	</div>
    </form>
</body>
</html>
