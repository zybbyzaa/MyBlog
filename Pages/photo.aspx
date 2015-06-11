<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="photo.aspx.cs" Inherits="Pages_photo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .grid
        {
            width: 164px;
            min-height: 100px;
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
            background: #ccc;
            display: block;
            background: url(../Images/loding.gif) no-repeat center;
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

