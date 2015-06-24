<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Pages_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .register
        {
            width:400px;
            margin: auto;
            text-align: center;
            color: #45484d;
        }
        .register h3
        {
            font-size: 20px;
        }
        .register input
        {
            display: inline-block;
            margin: 5px 0;
            height: 22px;
            width: 188px
        }
        .register hr
        {
            margin: 20px 0;
        }
        .register label
        {
            display: inline-block;
            width: 90px;
        }
        .register input[type=submit]
        {
            cursor: pointer;
            margin: 5px 0;
            width: 130px;
            height: 32px;
            line-height: 32px;
            background: #1398e2;
            border-radius: 5px;
            font-size: 14px;
            color: #fff;
            text-align: center;
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
    <div class="register">
        <h3>注册账户</h3>
        <hr />
        <div>
            <asp:Label ID="LabelName" runat="server" AssociatedControlID="TextName">用户名：</asp:Label>
            <asp:TextBox ID="TextName" runat="server"></asp:TextBox>
            <span style="color:Red;">*</span>
        </div>
        <div>
            <asp:Label ID="LabelPass" runat="server" AssociatedControlID="TextPass">密码：</asp:Label>
            <asp:TextBox ID="TextPass" runat="server" TextMode="Password"></asp:TextBox>
            <span style="color:Red;">*</span>
        </div>
        <div>
            <asp:Label ID="LabelPass2" runat="server" AssociatedControlID="TextPass2">密码确认：</asp:Label>
            <asp:TextBox ID="TextPass2" runat="server" TextMode="Password"></asp:TextBox>
            <span style="color:Red;">*</span>
        </div>
        <div>
            <asp:Label ID="LabelEmail" runat="server" AssociatedControlID="TextEmail">电子邮箱：</asp:Label>
            <asp:TextBox ID="TextEmail" runat="server"></asp:TextBox>
            <span style="color:Red;">*</span>
        </div>
        <div>
            <asp:Label ID="LabelQuestion" runat="server" AssociatedControlID="TextQuestion">安全问题：</asp:Label>
            <asp:TextBox ID="TextQuestion" runat="server"></asp:TextBox>
            <span style="color:Red;">*</span>
        </div>
        <div>
            <asp:Label ID="LabelAnswer" runat="server" AssociatedControlID="TextAnswer">问题答案：</asp:Label>
            <asp:TextBox ID="TextAnswer" runat="server"></asp:TextBox>
            <span style="color:Red;">*</span>
        </div>
        <hr />
        <asp:Button ID="RegisterButton" runat="server" Text="注册" 
            onclick="RegisterButton_Click"/>
        <div style="color:Red;"><asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></div>
        <div style="color:Red;"><asp:Literal ID="SuccessText" runat="server" EnableViewState="False"></asp:Literal></div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

