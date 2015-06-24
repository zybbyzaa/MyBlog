<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="changePwd.aspx.cs" Inherits="Pages_changePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .changePdBox
        {
            width:400px;
            margin: auto;
            text-align: center;
            color: #45484d;
        }
        .changePdBox h3
        {
            font-size: 20px;
        }
        .changePdBox input
        {
            margin: 5px 0;
            height: 22px;
            width: 188px
        }
        .changePdBox hr
        {
            margin: 20px 0;
        }
        .changePdBox input[type=submit]
        {
            cursor: pointer;
            margin: 5px 0;
            width: 60px;
            height: 30px;
            background-color: #00A0D8;
            color: #fff;
            font-weight: 700;
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
    <div class="changePdBox">
    <asp:ChangePassword ID="ChangePassword1" runat="server" OnContinueButtonClick="Continue_Click">
        <ChangePasswordTemplate>
                <h3>更改密码</h3>
                <hr />
                <asp:Label ID="CurrentPasswordLabel" runat="server"  AssociatedControlID="CurrentPassword">&nbsp;当前密码:&nbsp;</asp:Label>
                <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                     ControlToValidate="CurrentPassword" ErrorMessage="必须填写“密码”。" 
                     ToolTip="必须填写“密码”。" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">&nbsp;新的密码:&nbsp;</asp:Label>
                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                    ControlToValidate="NewPassword" ErrorMessage="必须填写“新密码”。" ToolTip="必须填写“新密码”。" 
                    ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">&nbsp;再次确认:&nbsp;</asp:Label>
                <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                    ControlToValidate="ConfirmNewPassword" ErrorMessage="必须填写“确认新密码”。" 
                    ToolTip="必须填写“确认新密码”。" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                    ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                    Display="Dynamic" ErrorMessage="“确认新密码”与“新密码”项必须匹配。" 
                    ValidationGroup="ChangePassword1"></asp:CompareValidator>
                <br />
                <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="更改" ValidationGroup="ChangePassword1" />
                <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
    </div>
</asp:Content>


