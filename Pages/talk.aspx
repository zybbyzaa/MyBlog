<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="talk.aspx.cs" Inherits="Pages_talk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .comment-box > span
        {
            margin-left: 230px;
        }
        .comment
        {
            background-color: #99CCFF;
            width:690px;
            padding: 10px;
            margin: 5px;
            border-radius: 10px;
            border: solid 1px #66CCCC;
        }
        .comment-header
        {
            padding-left:5px;
        }
        .comment-header .user-name
        {
            color: #d32;
            font-size: 13px;
        }
        .comment-body
        {
            margin: 4px 0;
            padding-left:5px;
            font-size: 13px;
            line-height: 1.5em;
        }
        .comment-body .reply-name
        {
            color: #e77064;
        }
        .comment-footer
        {
            padding-left:5px;
            line-height: 20px;
            color: #999;
        }
        .comment-footer > a
        {
            color: #999;
        }
        .comment-date
        {
            margin-right: 8px;
            color: #999;
        }
        .comment-edit-box
        {
            border-radius: 10px;
            border: solid 1px #ccc;
            width: 690px;
            margin-left: 5px;
            padding-top: 10px;
            padding-left:20px;
        }
        .reply
        {
            width:650px;
            padding: 10px;
            margin: auto;
            background-color: #CCFFCC;
            border-radius: 10px;
            border: solid 1px #66CCCC;
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
    <%--<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
        SelectCommand="SELECT reply.r_id, reply.username, reply.reply, reply.replytime, reply.tl_id, talk.username AS replyname FROM reply INNER JOIN talk ON reply.tl_id = talk.t_id WHERE (reply.tl_id = 1)"></asp:SqlDataSource>--%>
    <div style="margin: 0 auto;width:700px;">        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
            SelectCommand="SELECT * FROM [talk]"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" ItemContainerID= "ItemPlaceHolder">
            <LayoutTemplate>
                <div class="comment-box">
                <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                <asp:DataPager runat="server" ID="pager" PagedControlID="ListView1" PageSize="10">
                    <Fields>
                        <asp:NextPreviousPagerField FirstPageText="首页" PreviousPageText="上一页" NextPageText="下一页" ButtonType="Button" ButtonCssClass="button"
                            LastPageText="尾页" ShowFirstPageButton="true" ShowLastPageButton="true" ShowNextPageButton="true" ShowPreviousPageButton="true" />
                    </Fields>
                </asp:DataPager>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="comment">                   
                    <div class="comment-header"><span class="user-name"><%# Eval("username") %></span></div>
                    <p class="comment-body">                               
                        <%# Eval("talk") %>
                    </p>
                    <div class="comment-footer"><span class="comment-date"><%# Eval("replytime")%></span></div>
                    <asp:HiddenField ID="cmID" runat="server"  Value='<%#Eval("t_id") %>' />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BlogConString %>"                        
                        SelectCommand="SELECT reply.r_id, reply.username, reply.reply, reply.replytime, reply.tl_id, talk.username AS replyname FROM reply INNER JOIN talk ON reply.tl_id = talk.t_id WHERE (reply.tl_id = @tl_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmID" Name="tl_id" 
                            PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <div class="reply">
                        <div class="comment-header">
                            <span class="user-name"><%# Eval("username") %></span>                  
                        </div>
                        <p class="comment-body">                               
                            <span class="reply-name">回复：<%# Eval("replyname")%>&nbsp;</span><%# Eval("reply") %>
                        </p>
                        <div class="comment-footer"><span class="comment-date"><%# Eval("replytime")%></span></div>  
                    </div>
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="comment-edit-box"> 
                    <asp:Label ID="Label1" runat="server" Text="Label">你的昵称：</asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="200" Rows="4" 
                                    TextMode="MultiLine" Width="680px"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="发布" BackColor="#E6E6E6"
                        ForeColor="#555555" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Size="14px" Height="32px" Width="100px" onclick="Button1_Click" AutoPostBack="false"/> 
                    <div style="color:Red;font-size:14px;"><asp:Literal ID="FailureText" runat="server"></asp:Literal></div>
                </div>            
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <div class="comment-edit-box" id="rp" style="display:none">
            <div>
                <span>回复：</span>
                <span Class="reply-name"></span><br />                   
                <asp:Label ID="Label2" runat="server" Text="Label">你的昵称：</asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" MaxLength="200" Rows="4" 
                                TextMode="MultiLine" Width="680px"></asp:TextBox>
                <asp:HiddenField ID="HiddenField1" runat="server"/>
                <asp:Button ID="Button2" runat="server" Text="发布" BackColor="#E6E6E6"
                    ForeColor="#555555" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px" 
                    Font-Size="14px" Height="32px" Width="100px" onclick="Button2_Click"/> 
                <div style="color:Red;font-size:14px;"><asp:Literal ID="Literal1" runat="server"></asp:Literal></div>           
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

