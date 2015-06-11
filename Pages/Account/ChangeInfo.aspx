<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="ChangeInfo.aspx.cs" Inherits="Pages_Account_ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #tabbox{ width:500px; height:250px;margin:60px auto;border:1px solid #555;}
        .tabItem{width:500px;height:30px;border-bottom:2px solid #444;}
        .tabItem li{float:left;height:30px;width:75px;line-height:30px;text-align:center;cursor:pointer;overflow:hidden;}
        .tabItem li.on{background:#444;color:#fff;width:74px;}
        .tabItem li.hover{background:#555;color:#fff;}
        .tabContent{width:500px;height:208px; padding:10px 0 0px 0;overflow:auto;}
        .tabContent div{width:400px; margin: 10px auto;}
        .style1
        {
            width: 306px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div id="tabbox">
                <ul class="tabItem" id="tab">
                    <li class="on">密码修改</li>
                    <li>密码重置</li>
                    <li>邮箱修改</li>
                </ul>
                <div class="tabContent" id="tabcon">
                    <div>
                        <asp:ChangePassword ID="ChangePassword1" runat="server" OnContinueButtonClick="Continue_Click">
                            <ChangePasswordTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                                <tr>
                                                    <td></td>
                                                    <td align="center">更改密码</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                                            AssociatedControlID="CurrentPassword">密码:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                                            ControlToValidate="CurrentPassword" ErrorMessage="必须填写“密码”。" 
                                                            ToolTip="必须填写“密码”。" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="NewPasswordLabel" runat="server" 
                                                            AssociatedControlID="NewPassword">新密码:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                                            ControlToValidate="NewPassword" ErrorMessage="必须填写“新密码”。" ToolTip="必须填写“新密码”。" 
                                                            ValidationGroup="ChangePassword1"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                                            AssociatedControlID="ConfirmNewPassword">确认新密码:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                                            ControlToValidate="ConfirmNewPassword" ErrorMessage="必须填写“确认新密码”。" 
                                                            ToolTip="必须填写“确认新密码”。" ValidationGroup="ChangePassword1"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                            ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                                            Display="Dynamic" ErrorMessage="“确认新密码”与“新密码”项必须匹配。" 
                                                            ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="color:Red;">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                                            CommandName="ChangePassword" Text="更改密码" ValidationGroup="ChangePassword1" />
                                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="取消" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ChangePasswordTemplate>
                            <SuccessTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        密码更改完成</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        您的密码已更改!</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" colspan="2">
                                                        <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" 
                                                            CommandName="Continue" Text="继续" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </SuccessTemplate>
                        </asp:ChangePassword>
                    </div>
                    <div  style="display:none;">
                        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
                        </asp:PasswordRecovery>
                    </div>           
                    <div style="display:none;">
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td></td>
                                        <td align="center">邮箱修改</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UsernameLabel" runat="server" 
                                                AssociatedControlID="CurrentName">用户名:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="CurrentName" runat="server"></asp:TextBox>                                          
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="CurrentNameRequired" runat="server" 
                                                ControlToValidate="CurrentName" ErrorMessage="必须填写“用户名”。" 
                                                ToolTip="必须填写“用户名”。"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="EmailLabel" runat="server" 
                                                AssociatedControlID="EmailText">邮箱:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="EmailText" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                                ControlToValidate="EmailText" ErrorMessage="必须填写“邮箱”。" ToolTip="必须填写“邮箱”。" 
                                                ></asp:RequiredFieldValidator>                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="NewEmailLabel" runat="server" 
                                                AssociatedControlID="NewEmail">新邮箱:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="NewEmail" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="NewEmailRequired" runat="server" 
                                                ControlToValidate="NewEmail" ErrorMessage="必须填写“新邮箱”。" 
                                                ToolTip="必须填写“新邮箱”。"></asp:RequiredFieldValidator>                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText2" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ChangeEmailPushButton" runat="server"  Text="修改" 
                                                onclick="ChangeEmailPushButton_Click"  />
                                            <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="取消" />
                                        </td>
                                    </tr>
                                </table>
                    </div>
                </div>        
            </div>
</asp:Content>

