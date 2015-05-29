<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Pages_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #banner_top 
        {
            height: 265px;
            background: url(/MyBlog/Images/banner.jpg) top center;
        }
        .texts 
        {
            width: 350px;
            line-height: 26px;
            margin: 60px 0 0 200px;
            float: left;
            font-size: 14px;
        }
        .texts p 
        {
            color: #333;
            transform: translate(60px);
            text-shadow: 1px 1px 0 rgba(255,255,255,.8),2px 2px 3px rgba(180,151,151,.3);
        }
        .weather 
        {
            background: url(/MyBlog/Images/weather_bg.jpg) no-repeat;
            height: 88px;
            margin: 20px 0;
            padding: 10px 0 0 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="texts">
        <p>辛苦敲下一行行代码 不知能否改变这个世界</p>
        <p>但我知道 其实我的世界</p>
        <p>不过就是你的心。</p>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
    <div class="weather">
        <iframe width="250" scrolling="no" height="70" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&amp;id=12&amp;icon=1&amp;num=1"></iframe>
    </div> 
</asp:Content>

