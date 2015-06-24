<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="AddAccount.aspx.cs" Inherits="Pages_Account_AddAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 452px;
        }
        .style2
        {
            width: 144px;
        }
        .style3
        {
            width: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table style="margin: 60px auto 30px auto; width:40%">
            <tr>
                <td colspan="3" align="center" style="font-size: 16px">
                <span class="style1" style="color: #000000">新建账户</span>
                </td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    用户名:</td>
                <td class="style2">
                    <asp:TextBox ID="TextName" runat="server"></asp:TextBox>
                </td>
                <td style="color:Red;">
                    <asp:Literal ID="Literal1" runat="server">*</asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    密码:</td>
                <td class="style2">
                    <asp:TextBox ID="TextPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td style="color:Red;"><asp:Literal ID="Literal2" runat="server">*</asp:Literal></td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    密码确认:
                </td>
                <td class="style2">
                    <asp:TextBox ID="TextNewPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td style="color:Red;">
                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                         ControlToCompare="TextNewPass" ControlToValidate="TextPass"
                         Display="Dynamic" ErrorMessage="确认密码不一致" ></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    邮箱:</td>
                <td class="style2">
                    <asp:TextBox ID="TextEmail" runat="server"></asp:TextBox>
                </td>
                <td style="color:Red;"><asp:Literal ID="Literal3" runat="server">*</asp:Literal></td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    安全问题:</td>
                <td class="style2">
                    <asp:TextBox ID="TextQuestion" runat="server"></asp:TextBox>
                </td>
                <td style="color:Red;"><asp:Literal ID="Literal4" runat="server">*</asp:Literal></td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    问题答案:</td>
                <td class="style2">
                    <asp:TextBox ID="TextAnswer" runat="server"></asp:TextBox>
                </td>
                <td style="color:Red;"><asp:Literal ID="Literal5" runat="server">*</asp:Literal></td>
            </tr>
            <tr>
                <td colspan="3" style="color:Red;font-size:14px;">
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                </td>
           </tr>
           <tr>
                <td colspan="2" style="color:Red;font-size:14px;" align="center">
                    <asp:Literal ID="SuccessText" runat="server" EnableViewState="False"></asp:Literal>
                </td>
           </tr>
            <tr>
                <td colspan="2" align="right">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="新建" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

