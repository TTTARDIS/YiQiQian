<%@ Page Language="C#" AutoEventWireup="true" CodeFile="store.aspx.cs" Inherits="store" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>商家详情</title>
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
        <div class="item active">
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
		<div class="container_left">
            <div class="left_bar" style="margin-bottom:50px;">
            <img src="images/adswanted.gif" alt="广告位" />
            </div>
            <h2 style="margin-bottom:10px;color:#303030">热 点 新 闻</h2>
            <div class="left_bar" style="color:#606060;line-height:35px;font-size:15px;text-decoration:underline;">
                <p><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="http://finance.sina.com.cn/money/lczx/20141113/015220801874.shtml" ForeColor="#666666">双十一热销理财易主 部分平台自掏腰包贴息</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="http://news.sina.com.cn/s/2014-11-13/030031135161.shtml" ForeColor="#666666">机长回应淡定播报飞机故障：应该做的</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="http://news.sina.com.cn/zl/zatan/blog/2014-11-13/09462631/1193610101/47250b750102vce7.shtml " ForeColor="#666666"> 明星“限薪令”能否提高国产剧低质量？</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="http://fashion.sohu.com/20141112/n405973033.shtml " ForeColor="#666666"> 教育部：不存在废除"211""985"情况</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="http://fashion.sohu.com/20141112/n405973033.shtml" ForeColor="#666666">最冷静的双11心理分析</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="http://business.sohu.com/20141113/n405988523.shtml" ForeColor="#666666">专家:APEC让我看到 治污或不需30年</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="http://news.163.com/14/1113/13/AAUFM1070001124J.html" ForeColor="#666666">习近平：让孩子们生活在良好生态环境之中</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="http://view.163.com/14/1113/10/AAU45D9900012Q9L.html" ForeColor="#666666">舒圣祥：家藏上亿现金，巨腐如何养成？</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="http://view.163.com/14/1107/08/AAEG393800012Q9L.html" ForeColor="#666666">敬一山：企业副总“身兼七职”没什么</asp:HyperLink></p>
                <p><asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="http://news.163.com/14/1111/07/AAOKTQ8H00014SEH.html#f=wfocus" ForeColor="#666666">荷兰举行MH17追悼会 国王首相出席</asp:HyperLink></p>
            </div>
        </div>
        <div class="container_right">
            <div class="store_name">
                <asp:Label ID="Label1" runat="server" Text="一起签规则简介"></asp:Label>
            </div>
            <div class="heng"></div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/ye.png" />
            <div class="sign_num">
                <asp:Label ID="Label2" runat="server" Text="通过用户签到得到签到人数"></asp:Label>
            </div>
			<div class="if_buzy">
                <asp:Label ID="Label3" runat="server" Text="根据当前签到人数与店铺最大容纳度比值得出忙碌程度"></asp:Label>
            </div>
			<div class="discount">
                <asp:Label ID="Label4" runat="server" Text="商家可以在商家管理界面设置折扣信息" style="margin-bottom:40px;"></asp:Label>
            </div>
            <div class="intro">
                <asp:Label ID="Label5" runat="server" Text="商家同样可以点击导航处商家管理，进入商家管理界面添加店铺的整体性文字介绍，包括地理位置、消费水平、店内风格、目标消费群体等，让消费者大致了解店铺情况。建议不要少于500字。"></asp:Label>
            </div>
			<div class="intro" style="text-indent:0;color:black;">
                <asp:Label ID="Label6" runat="server" Text="今日推荐："></asp:Label>
            </div>
            <div>
            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/ye.png" />
			<div class="command">
                <asp:Label ID="Label7" runat="server" Text="商家还可以在商家管理界面添加“今日推荐”信息，一组今日推荐消息包括一张图和一段文字，今日推荐组数不限，但是3-5组显示效果最佳，废弃的今天推荐可以从商家管理界面删除，不可更改或找回。"></asp:Label>
            </div>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
        </div>
	</div>
    </div>
	<div class="bottom">
	</div>
    </form>
</body>
</html>
