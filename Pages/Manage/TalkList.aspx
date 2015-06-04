<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="TalkList.aspx.cs" Inherits="Pages_Manage_TalkList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table
        {
            width: 600px;
            margin: 20px auto;
            font-size: 15px;
        }
        td
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
        DeleteCommand="DELETE FROM [talk] WHERE [t_id] = @t_id" 
        onSelected="SqlDataSource1_Selected" OnDeleted="SqlDataSource1_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="t_id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" DataKeyNames="t_id" 
        ondatabound="GridView1_DataBound" DataSourceID="SqlDataSource1" >
        <Columns>
            <asp:BoundField DataField="t_id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="t_id" />
            <asp:BoundField DataField="username" HeaderText="留言人" 
                SortExpression="username" />
            <asp:BoundField DataField="talk" HeaderText="内容" SortExpression="talk" />
            <asp:BoundField DataField="replytime" HeaderText="留言时间" 
                SortExpression="replytime" />
            <asp:TemplateField HeaderText="操作" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="删除" OnClientClick = 'return confirm("你真的要删除当前留言吗？");'></asp:LinkButton>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("t_id", "Reply.aspx?t_id={0}") %>' Text="回复"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerTemplate>  
        <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" ID="AspNetPager1" runat="server" PageSize="<%# ((GridView)Container.NamingContainer).PageSize%>" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" OnPageChanging="AspNetPager1_PageChanging"></webdiyer:AspNetPager>  
        </PagerTemplate> 
    </asp:GridView>
</asp:Content>

