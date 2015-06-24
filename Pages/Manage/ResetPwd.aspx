<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="ResetPwd.aspx.cs" Inherits="Pages_Account_ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 400px;
            margin: 80px auto;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="style1">
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" Font-Size="18px">
            <QuestionTemplate>
                        <h3>标识确认</h3>
                        <p>要接收新密码，请回答下列问题。</p>
                        <span>用户名:</span><asp:Literal ID="UserName" runat="server"></asp:Literal><br />
                        <span>问题:</span><asp:Literal ID="Question" runat="server"></asp:Literal><br />
                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">答案:</asp:Label>
                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                            ControlToValidate="Answer" ErrorMessage="需要答案。" ToolTip="需要答案。" 
                            ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator><br />
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal><br />
                        <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="提交" 
                            ValidationGroup="PasswordRecovery1" />
            </QuestionTemplate>
            <SuccessTemplate>
                <p>您的密码已发送给您。</p>
            </SuccessTemplate>
            <UserNameTemplate>
                <h3>重置密码</h3>
                <p>为了接收新密码，请输入用户名</p>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                            ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" 
                            ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator><br />
                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal><br />
                <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="提交" 
                            ValidationGroup="PasswordRecovery1" />
            </UserNameTemplate>
        </asp:PasswordRecovery>
    </div>           
</asp:Content>

