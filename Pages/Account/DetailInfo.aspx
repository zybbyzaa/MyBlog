<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="DetailInfo.aspx.cs" Inherits="Pages_Account_DetailInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table
        {
            margin: 20px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" >
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="150px" Width="250px" 
        AutoGenerateRows="False" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="UserName" HeaderText="帐号名" ReadOnly="true" />
            <asp:TemplateField HeaderText="邮箱">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PasswordQuestion" HeaderText="安全问题"  />
        </Fields>
        <HeaderStyle HorizontalAlign="Center" />
        <HeaderTemplate>
            详细信息
        </HeaderTemplate>
        <RowStyle HorizontalAlign="Center" />
    </asp:DetailsView>
</asp:Content>

