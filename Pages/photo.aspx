<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="photo.aspx.cs" Inherits="Pages_photo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .grid
        {
            width: 164px;
            height: 270px;
            padding: 10px;
            background: #fff;
            margin: 8px 8px 8px 0;
            font-size: 12px;
            float: left;
            box-shadow: 0 1px 3px rgba(34,25,25,0.4);
            -moz-box-shadow: 0 1px 3px rgba(34,25,25,0.4);
            -webkit-box-shadow: 0 1px 3px rgba(34,25,25,0.4);
            -webkit-transition: top 1s ease, left 1s ease;
            -moz-transition: top 1s ease, left 1s ease;
            -o-transition: top 1s ease, left 1s ease;
            -ms-transition: top 1s ease, left 1s ease;
        }
        .grid .imgholder img {
            max-width: 100%;
            max-height: 220px;
            background: #ccc;
            display: block;
            cursor: pointer;
        }
        .grid hr
        {
            margin: 5px 0;
        }
        .grid p
        {
            color: #756f71;
            word-wrap:break-word; 
            word-break:normal;
        }
        .popup-bigic {
	        position: absolute;
	        left: 0;
	        top: 0;
	        background: #eee;
	        overflow: hidden;
	        z-index: 999;
        }
        .popup-bigic .loading-bigic {
	        position: absolute;
	        left: 50%;
	        top: 50%;
	        width: 24px;
	        height: 24px;
	        margin-left: -12px;
	        margin-top: -12px;
        }
        .popup-bigic .img-bigic {
	        position: absolute;
        }
        .option-bigic {
	        position: absolute;
	        right: 20px;
	        top: 20px;
	        z-index: 1;
        }
        .option-bigic span {
	        display: inline-block;
	        width: 40px;
	        height: 40px;
	        margin-right: 20px;
	        text-indent: -999px;
	        overflow: hidden;
	        cursor: pointer;
	        border-radius: 5px;
	        background-image: url(../Images/icons.png);
	        background-repeat: no-repeat;
	        background-color: #fff;
	        opacity: .5;
        }
        .option-bigic span:hover {
	        opacity: 1;
        }
        .option-bigic span.change-bigic {
	        display: none;
	        background-position: -52px 3px;
        }
        .option-bigic span.max-bigic {
	        display: none;
	        background-position: -119px 3px;
        }
        .option-bigic span.close-bigic {
	        background-position: 8px 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server">          
    </asp:SiteMapPath>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div style="width:100%;">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
            SelectCommand="SELECT * FROM [photo]"></asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
            <div class="grid">
                <div class="imgholder">
                    <img src='/MyBlog/<%# Eval("photoUrl") %>'>
                </div>
                <hr />
                <p><%# Eval("description") %></p>
            </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

