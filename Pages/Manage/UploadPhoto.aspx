<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="UploadPhoto.aspx.cs" Inherits="Pages_Manage_UploadPhoto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        img
        {
            max-height: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" width: 600px; margin:20px auto; text-align:center; border: solid 1px #999">
        <h3 style="margin-top:15px;">图片上传</h3>
        <hr style="margin-top:15px;" />
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="上传" OnClick="Button1_Click" />
            <div style="width:300px; margin: auto; text-align:left;">
                <asp:Label ID="lblDesc" runat="server" Text="图片描述"></asp:Label>
            </div>
            <div style="width:300px;margin: auto;">
                <asp:TextBox ID="TextDesc" runat="server" TextMode="MultiLine" Height="80px" Width="300px"></asp:TextBox>
            </div>
            <asp:Image ID="Image1" runat="server"/>
            <br />
            <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>           
        </div>
    </div>
</asp:Content>

