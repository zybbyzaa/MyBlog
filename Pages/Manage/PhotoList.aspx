<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="PhotoList.aspx.cs" Inherits="Pages_Manage_PhotoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table
        {
            font-size: 14px;
        }
        table table
        {
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" width: 600px; margin:20px auto; text-align:center; border: solid 1px #999">
        <h3 style="margin-top:15px;">查看相片</h3>
        <hr style="margin-top:15px;" />
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
                SelectCommand="SELECT * FROM [photo]" 
                UpdateCommand="UPDATE [photo] SET [description] = @description WHERE [id] = @id">
                <UpdateParameters>
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="id"
                OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                <Columns>                   
                    <asp:BoundField DataField="id" HeaderText="图片id" ReadOnly="true" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="图片描述">
                    <ItemStyle HorizontalAlign="Center" Width="240px" /> 
                    </asp:BoundField>                
                    <asp:TemplateField HeaderText="图片缩略">
                        <ItemTemplate>
                            <img src='/MyBlog/<%#Eval("photoUrl") %>' alt="图片" style="max-height:120px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="160px" />
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="删除" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%#Eval("id")+","+Eval("photoUrl") %>'
                                CommandName="Del" Text="删除" OnClientClick='return confirm("你真的要删除当前相片吗？");'></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True"  HeaderText="编辑">
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView> 
            <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
    </div>
</asp:Content>

