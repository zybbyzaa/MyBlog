<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="Pages_about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #main_left
        {
            height: 365px;
        }
        #main_left h2 {
            font-size: 22px;
            font-family: 'Architects Daughter',cursive;
            margin-bottom: 20px;
        }
        #main_left p {
            margin-bottom: 20px;
        }
        #main_right
        {
            padding: 10px 0 0 10px;
            color: #999;
            line-height: 26px;
        }
        #main_right span
        {
            color: Green;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server">          
    </asp:SiteMapPath>
    <span class="right text">像“草根”一样，紧贴着地面，低调的存在，冬去春来，枯荣无恙。</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div id="main_left" class="left">
        <h2>About my blog</h2>
        <p>应用名：MyBlog </p>
        <p>程序：Asp.net 3.5 </p>
        <p>作者：张源滨 </p>
        <p>开始时间：2015-05-09 </p>
        <p>结束时间： </p>        
    </div>
    <div id="main_right" class="right">
        <p>扣扣：<span>532394460</span> </p>    
        <p>姓名：张源滨 </p>       
        <p>学号：3112002836 </p>
        <p>班级：电信4班 </p>        
    </div>   
</asp:Content>