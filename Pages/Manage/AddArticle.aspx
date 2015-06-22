<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="AddArticle.aspx.cs" Inherits="Pages_Manage_AddArticle" ValidateRequest="false" %>
<%@Register TagPrefix="dntb" Namespace="DotNetTextBox" Assembly="DotNetTextBox"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" width: 600px; margin:20px auto; text-align:center; border: solid 1px #999">
        <h3 style="margin-top:15px;">文章发表</h3>
        <hr style="margin-top:15px;" />
        <div>
            <div style="text-align:left;">
                <asp:Label ID="lblTitle" runat="server" Text="文章标题" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="TitleText" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Selected="True" Value="0">移动开发</asp:ListItem>
                    <asp:ListItem Value="1">前端开发</asp:ListItem>
                    <asp:ListItem Value="2">后台开发</asp:ListItem>
                    <asp:ListItem Value="3">数据库相关</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="发表" OnClick="Button1_Click" />
            </div>          
            <div style="width:600px;margin: auto;">
                <DNTB:WebEditor id="edit" runat="server"> </DNTB:WebEditor>
            </div>
            <br />
            <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>           
        </div>
    </div>
</asp:Content>

