<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>一起签商家管理</title>
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
        <div class="item">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/register.aspx" >欢 迎 进 驻</asp:HyperLink>
        </div>
        <div class="item active">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/manage.aspx" CssClass="active2">商 家 管 理</asp:HyperLink>
        </div>
        <div class="item">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/about.aspx" >关 于 一 起 签</asp:HyperLink>
        </div>
	</div>
	<div class="container">
        <div style="width:480px;height:auto;margin-left:25px;float:left;">
        <ul>
        <li>
            <asp:Label ID="Label1" runat="server" Text="当前用户店名" CssClass="store_name" style="text-align:left;font:20px;"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label2" runat="server" Text="当前签到人数" CssClass="sign_num" style="text-align:left;font:20px;"></asp:Label>
        </li>
        <li>
            <div class="m_label">当前简介</div>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="m_input" 
                Text="此为您的店铺当前简介，20字以内。"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="修改" onclick="Button3_Click"/>
        </li>
        <li>
            <div class="m_label">当前介绍</div>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="m_textarea" 
                style="height:160px;" Text="此为您的店铺当前详细介绍，1000字以内。点击按钮即可进行修改。" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" Text="修改" style="float:left" onclick="Button4_Click"/>
        </li>
        <li>
            <asp:Panel ID="Panel2" runat="server">
            <div class="m_label">当前折扣</div>
            <asp:Label ID="Label3" runat="server" Text="当前折扣不可更改，请删除或添加。" CssClass="m_intro"></asp:Label>
            </asp:Panel>
            <asp:Button ID="Button5" runat="server" Text="删除" onclick="Button5_Click" />
        </li>
        <li>
            <div class="m_label">今日推荐</div>
                <asp:Image ID="Image2" runat="server" class="m_pic" Visible="False" />
                <asp:Label ID="Label4" runat="server" Text="推荐文字内容" CssClass="m_intro"></asp:Label>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
            <asp:Button ID="Button6" runat="server" Text="删除" />
        </li>
        </ul>
        </div>
        <div style="width:400px;margin-left:25px;float:left;">
            <ul>
                <li><b>添加折扣</b>
                </li>
                <li><div class="m_label">活动时间</div>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>-----选择活动时间-----</asp:ListItem>
                        <asp:ListItem>每天</asp:ListItem>
                        <asp:ListItem>工作日</asp:ListItem>
                        <asp:ListItem>周末</asp:ListItem>
                        <asp:ListItem>周一至周四</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li><div class="m_label">开始时间</div>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>-----选择开始时间-----</asp:ListItem>
                        <asp:ListItem>09:30</asp:ListItem>
                        <asp:ListItem>10:00</asp:ListItem>
                        <asp:ListItem>10:30</asp:ListItem>
                        <asp:ListItem>11:00</asp:ListItem>
                        <asp:ListItem>11:30</asp:ListItem>
                        <asp:ListItem>12:00</asp:ListItem>
                        <asp:ListItem>12:30</asp:ListItem>
                        <asp:ListItem>13:00</asp:ListItem>
                        <asp:ListItem>13:30</asp:ListItem>
                        <asp:ListItem>14:00</asp:ListItem>
                        <asp:ListItem>14:30</asp:ListItem>
                        <asp:ListItem>15:00</asp:ListItem>
                        <asp:ListItem>15:30</asp:ListItem>
                        <asp:ListItem>16:00</asp:ListItem>
                        <asp:ListItem>16:30</asp:ListItem>
                        <asp:ListItem>17:00</asp:ListItem>
                        <asp:ListItem>17:30</asp:ListItem>
                        <asp:ListItem>18:00</asp:ListItem>
                        <asp:ListItem>18:30</asp:ListItem>
                        <asp:ListItem>19:00</asp:ListItem>
                        <asp:ListItem>19:30</asp:ListItem>
                        <asp:ListItem>20:00</asp:ListItem>
                        <asp:ListItem>20:30</asp:ListItem>
                        <asp:ListItem>21:00</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li><div class="m_label">结束时间</div>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>-----选择结束时间-----</asp:ListItem>
                        <asp:ListItem>09:30</asp:ListItem>
                        <asp:ListItem>10:00</asp:ListItem>
                        <asp:ListItem>10:30</asp:ListItem>
                        <asp:ListItem>11:00</asp:ListItem>
                        <asp:ListItem>11:30</asp:ListItem>
                        <asp:ListItem>12:00</asp:ListItem>
                        <asp:ListItem>12:30</asp:ListItem>
                        <asp:ListItem>13:00</asp:ListItem>
                        <asp:ListItem>13:30</asp:ListItem>
                        <asp:ListItem>14:00</asp:ListItem>
                        <asp:ListItem>14:30</asp:ListItem>
                        <asp:ListItem>15:00</asp:ListItem>
                        <asp:ListItem>15:30</asp:ListItem>
                        <asp:ListItem>16:00</asp:ListItem>
                        <asp:ListItem>16:30</asp:ListItem>
                        <asp:ListItem>17:00</asp:ListItem>
                        <asp:ListItem>17:30</asp:ListItem>
                        <asp:ListItem>18:00</asp:ListItem>
                        <asp:ListItem>18:30</asp:ListItem>
                        <asp:ListItem>19:00</asp:ListItem>
                        <asp:ListItem>19:30</asp:ListItem>
                        <asp:ListItem>20:00</asp:ListItem>
                        <asp:ListItem>20:30</asp:ListItem>
                        <asp:ListItem>21:00</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li><div class="m_label">折扣内容</div>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" style="margin-top:0;margin-bottom:15px;"></asp:TextBox>
                </li>
                <li><asp:Button ID="Button1" runat="server" Text="确认添加" onclick="Button1_Click" />
                </li>
                </ul>
                <div style="height:1px;width:370px;border-top:1px solid #606060;border-bottom:1px solid #606060;margin:10px;float:left;"></div>
                <ul>
                <li style="margin-top:20px;float:left;width:200px;"><b>添加今日推荐</b>
                </li>
                <li><div class="m_label">图片介绍</div>
                    <asp:FileUpload ID="FileUpload1" runat="server" style="margin-left:0;margin-top:0;margin-bottom:10px;float:left;" />
                </li>
                <li><div class="m_label">文字介绍</div>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" style="margin-top:0;margin-bottom:15px;"></asp:TextBox>
                </li>
                <li>
                    <asp:Button ID="Button2" runat="server" Text="确认添加" onclick="Button2_Click" />
                </li>
                </ul>
        </div>
	</div>

	<div class="bottom">
	</div>
    </form>
</body>
</html>
