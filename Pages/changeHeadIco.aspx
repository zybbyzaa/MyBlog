<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="changeHeadIco.aspx.cs" Inherits="Pages_changeHeadIco" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .header-ico
        {
            width:400px;
            margin: auto;
            text-align: center;
            color: #45484d;
        }
        .header-ico h3
        {
            font-size: 20px;
        }
        .header-ico hr
        {
            margin: 20px 0;
        }
        .header-ico input[type=submit]
        {
            cursor: pointer;
            margin: 20px 0 5px;
            width: 130px;
            height: 32px;
            line-height: 32px;
            background: #1398e2;
            border-radius: 5px;
            font-size: 14px;
            color: #fff;
            text-align: center;
        }
        .upload-ico
        {
            width: 300px;
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
    <div class="header-ico">
        <h3>头像修改</h3>
        <hr />
        <div class="current-ico left">
            <h4>当前头像</h4>
            <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
        </div>
        <div class="upload-ico right">
            <h4>头像上传</h4>
            <p>请选择新的图片上传，图片大小不能超过2M</p>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="上传" onclick="Button1_Click" />
        </div>       
        <div class="clearfix"></div>
        <hr />
        <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

