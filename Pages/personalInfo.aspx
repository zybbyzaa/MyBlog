<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="personalInfo.aspx.cs" Inherits="Pages_personalInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .userinfo
        {
            width:400px;
            margin: auto;
            text-align: center;
            color: #45484d;
        }
        .userinfo h3
        {
            font-size: 20px;
        }
        .userinfo input
        {
            display: inline-block;
            margin: 5px 0;
            height: 22px;
            width: 188px
        }
        .userinfo hr
        {
            margin: 20px 0;
        }
        .userinfo label
        {
            display: inline-block;
            width: 90px;
        }
        .userinfo input[type=submit]
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
    <div class="userinfo">    
        <h3>个人中心</h3>
        <hr />
        <div>
            <asp:Label ID="LabelName" runat="server" AssociatedControlID="TextName">&nbsp;&nbsp;用户名:&nbsp;</asp:Label>
            <asp:TextBox ID="TextName" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div>
            <Label ID="LabelBirth" for="TextBirth">&nbsp;&nbsp;&nbsp;生日:&nbsp;</Label>
            <input type="date" ID="TextBirth" value="<%=Profile.birthday.ToString("yyyy-MM-dd") %>" name="TextBirth"/>
        </div>
        <div>
            <Label ID="LabelQQ" for="TextQQ">&nbsp;&nbsp;&nbsp;&nbsp;QQ:&nbsp;&nbsp;</Label>
            <input type="text" ID="TextQQ" name="TextQQ" value="<%=Profile.qq %>"/>
        </div>
        <div>
            <asp:Label ID="LabelEmail" runat="server" AssociatedControlID="TextEmail">&nbsp;&nbsp;&nbsp;邮箱:&nbsp;</asp:Label>
            <asp:TextBox ID="TextEmail" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="LabelCreate" runat="server" AssociatedControlID="TextCreate">&nbsp;&nbsp;注册时间:&nbsp;</asp:Label>
            <asp:TextBox ID="TextCreate" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="LabelLoginTime" runat="server" AssociatedControlID="TextLoginTime">上次登录时间:&nbsp;</asp:Label>
            <asp:TextBox ID="TextLoginTime" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <hr />
        <asp:Button ID="SaveInfoButton" runat="server" Text="保存" 
            onclick="SaveInfoButton_Click"/>
        <div style="color:Red;"><asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></div>
    </div>
</asp:Content>

