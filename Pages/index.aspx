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
        #main_right h3 p
        {
            background: #fff;
            width: 70px;
        }
        #main_right h3
        {
            font-size: 14px;
            background: url(../Images/r_title_bg.jpg) repeat-x center;
        }
        #main_right h3 span {
            color: #65b020;
        }
        #main_right h3.search span {
            color: #37ccca;
        }  
        .new li {
            height: 25px;
            line-height: 25px;
            clear: both;
            padding-left: 5px;
            overflow: hidden;
            padding-left: 15px;
            background: url(../Images/li.jpg) no-repeat left center;
        }
        #main_left h3
        {
            margin: 20px 0 10px 0;
            color: #333;
            line-height: 24px;
        }    
        a.readmore {
          background: #fd8a61;
          color: #fff;
          padding: 5px 10px;
          float: right;
          margin: 0 40px;
          line-height: 24px;
        }
        .dateview {
          width: 695px;
          overflow: hidden;
          clear: both;
          margin: 10px 0 0 0;
          display: inline-block;
          background-color: #f6f6f6;
          line-height: 26px;
          height: 26px;
          color: #838383;
        }
        .dateview span {
          margin: 0 10px;
        }
        .dateview span a {
          color: #099b43;
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
    <div id="main_left" class="left">
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <div>
                    <h3>
                        <%# Eval("title") %>
                        <a title='<%# Eval("title") %>' href='details.aspx?id=<%# Eval("id") %>'' class="readmore">阅读全文&gt;&gt;</a>
                    </h3>       
                    <p class="dateview">
                        <span>发表于：<%# Eval("create_time") %></span><span>评论数：<span><%# Eval("comment_num") %></span></span><span>作者：<%# Eval("author") %></span><span>个人博客：
                        [<a href='article.aspx?type=<%# Eval("type") %>'><%# formatType(Eval("type").ToString())%></a>]
                        </span>
                    </p>
                </div> 
            </ItemTemplate>
        </asp:Repeater>    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
            SelectCommand="SELECT TOP 8 * FROM [article] ORDER BY [comment_num] DESC">
        </asp:SqlDataSource>
    </div>
    <div id="main_right" class="right">
        <div class="weather">
        <iframe width="250" scrolling="no" height="70" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&amp;id=12&amp;icon=1&amp;num=1"></iframe>
        </div>  
        <h3 class="search">
            <p>站内<span>搜索</span></p>           
        </h3>     
        <p style="margin:10px 5px 15px">
            <asp:TextBox ID="KeyWord" runat="server" Height="24px"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="搜索" 
                onclick="SearchButton_Click" /> 
        </p> 
        <h3>
            <p>最新<span>文章</span></p>           
        </h3>
        <ul class="new">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <li><a href='details.aspx?id=<%# Eval("id") %>'><%# Eval("title") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
                SelectCommand="SELECT TOP 10 * FROM [article] ORDER BY [create_time] DESC"></asp:SqlDataSource>
        </ul>
    </div>
</asp:Content>

