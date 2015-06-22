<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="ArticleList.aspx.cs" Inherits="Pages_Manage_ArticleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" width: 600px; margin:20px auto; text-align:center; border: solid 1px #999">
        <h3 style="margin-top:15px;">查看文章</h3>
        <hr style="margin-top:15px;" />
        <div style="margin:20px auto;width:500px;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
                DeleteCommand="DELETE FROM [article] WHERE [id] = @id" 
                SelectCommand="SELECT * FROM [article]">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="id" PageSize="10"
                OnRowDataBound="GridView1_RowDataBound" >
                <Columns>                   
                    <asp:BoundField DataField="id" HeaderText="文章id" ReadOnly="true" >
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="title" HeaderText="文章标题">
                    <ItemStyle HorizontalAlign="Center" Width="100px" /> 
                    </asp:BoundField>                
                    <asp:BoundField DataField="author" HeaderText="文章作者">
                    <ItemStyle HorizontalAlign="Center" Width="100px" /> 
                    </asp:BoundField>
                    <asp:BoundField DataField="create_time" HeaderText="发表时间">
                    <ItemStyle HorizontalAlign="Center" Width="100px" /> 
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="删除">
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:CommandField>
                    <asp:HyperLinkField DataNavigateUrlFields="id" 
                        DataNavigateUrlFormatString="DetailArticle.aspx?id={0}" HeaderText="详细" Text="文章内容" />
                </Columns>
            </asp:GridView>       
        </div>
    </div>
</asp:Content>

