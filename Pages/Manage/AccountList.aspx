<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="AccountList.aspx.cs" Inherits="Pages_Account_AccountList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:700px;margin: 20px auto;">
        <div>
            <asp:Label ID="SearchLabel" runat="server" Text="Label" AssociatedControlID="SearchText">账户名：</asp:Label>
            <asp:TextBox ID="SearchText" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="查找" 
                onclick="SearchButton_Click" />
        </div>       
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="UserName" 
            ForeColor="#333333" GridLines="None" 
            AutoGenerateColumns="False" Width="700px" Font-Size="16px"
            HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="账户名" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="邮箱" SortExpression="Email" />
                <asp:BoundField DataField="PasswordQuestion" HeaderText="密码问题" 
                    SortExpression="PasswordQuestion" />
                <asp:CheckBoxField DataField="IsLockedOut" HeaderText="是否锁定" 
                    SortExpression="IsLockedOut" >
                <ItemStyle Width="80px" />
                </asp:CheckBoxField>
                <asp:TemplateField HeaderText="所属角色">
                    <ItemTemplate>
                        <asp:Label ID="LabelRole" runat="server" Text='<%# getUserRoleName(Eval("UserName").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>                  
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Del" 
                             Text="删除" OnClientClick = 'return confirm("你真的要删除当前账号吗？");' 
                             CommandArgument='<%# Eval("username")%>' >
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Unlock" 
                             Text="解锁" OnClientClick = 'return confirm("你真的要解锁当前账号吗？");' CommandArgument='<%# Eval("username")%>' >
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>                
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" Font-Size="16px" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </div>
</asp:Content>

