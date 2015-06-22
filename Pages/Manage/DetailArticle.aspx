<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="DetailArticle.aspx.cs" Inherits="Pages_Manage_DetailArticle" ValidateRequest="false" %>
<%@Register TagPrefix="dntb" Namespace="DotNetTextBox" Assembly="DotNetTextBox"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlogConString %>">
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="100%"
         DataKeyNames="id" onmodechanging="FormView1_ModeChanging" >
        <EditItemTemplate>
           <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("id") %>'/>
           <div style="width:600px;margin:20px auto;">
                
                <h3 style="text-align:center; margin-bottom:10px;">
                    <asp:TextBox runat="server" ID="TextTitle" Text='<%# Eval("title") %>' 
                        Width="300px" Font-Size="24px"></asp:TextBox>
                </h3>
                <hr />
                <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Size="16px"></asp:Label>
                <DNTB:WebEditor id="edit" runat="server" 
                    Text='<%# Server.HtmlDecode(Eval("text").ToString()) %>'> </DNTB:WebEditor>
                <hr />
                <div style="text-align:center;">
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                     Text="修改" onclick="UpdateButton_Click" />&nbsp;
                    <asp:Button ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
                </div>        
            </div>
        </EditItemTemplate>     
        <ItemTemplate>
            <div style="width:600px;margin:20px auto;">
                <h3 style="text-align:center; margin-bottom:10px;"><%# Eval("title") %></h3>
                <hr />
                    <span>发布时间：<%# Eval("create_time") %></span>&nbsp;
                    <span>作者：<%# Eval("author") %></span>&nbsp;
                    [<span style="color:#63b120"><%# formatType(Eval("type").ToString())%></span>]
                <hr style="margin-top:5px;" />
                <p>
                    <%# Server.HtmlDecode(Eval("text").ToString()) %>
                </p>
                <hr />          
                    <span>评论数：(<%# Eval("comment_num") %>)</span>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
                    SelectCommand="SELECT * FROM [comment] WHERE ([al_id] = @al_id) ORDER BY [commenttime]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="al_id" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <div style="line-height:16px;margin: 5px 70px;border:solid 1px #999;border-radius:8px;padding: 10px 5px;">
                                <span style="font-size:14px;"><%# Eval("cmname") %>：<%# Eval("comment") %></span>&nbsp;
                                <span style="color:Gray;padding-top:8px;">评论于 <%# Eval("commenttime") %></span><br />
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="delete" CommandArgument='<%# Eval("c_id") %>'>
                                    删除评论
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>              
                <hr style="margin-top:5px;"/>
                <asp:Button ID="EditButton" runat="server" Text="编辑" 
                 CausesValidation="True" CommandName="Edit"/>
            </div>          
        </ItemTemplate>
        <EmptyDataTemplate>
            <p>
                找不到数据
            </p>
        </EmptyDataTemplate>
    </asp:FormView>
</asp:Content>

