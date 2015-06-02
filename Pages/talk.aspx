<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="talk.aspx.cs" Inherits="Pages_talk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .comment-box > span
        {
            margin-left: 260px;
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
            margin: 6px 0;
            padding-left:5px;
            font-size: 13px;
            line-height: 1.5em;
        }
        .comment-body .reply-object
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
        .reply-box
        {
            position: absolute;
            left: -50%;
	        top: 50%;
	        -webkit-transform: translate(-50%, -50%) ;
	        -moz-transform: translate(-50%, -50%) ;
	        -ms-transform: translate(-50%, -50%) ;
	        -o-transform: translate(-50%, -50%) ;
	        transform: translate(-50%, -50%) ;
	        z-index: 2000;
	        background-color: #ccc;
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
        SelectCommand="SELECT * FROM [talk]"></asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" ItemContainerID= "ItemPlaceHolder">
        <LayoutTemplate>
            <div class="comment-box">
            <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
            <asp:DataPager runat="server" ID="ContactsDataPager" PageSize="5">    
                <Fields>    
                <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true"    
                FirstPageText="首页" LastPageText="尾页"  NextPageText="下一页" PreviousPageText="上一页"/>    
                </Fields>   
            </asp:DataPager>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="comment">
                <div class="comment-header"><span class="user-name"><%# Eval("username") %></span></div>
                <p class="comment-body">                               
                    <span class="reply-object">
                        <asp:PlaceHolder ID="PlaceHolder1"  runat="server" Visible='<%# Eval("isreply") %>'>回复&nbsp;<%# Eval("replyname")%>：</asp:PlaceHolder>
                    </span>
                    <%# Eval("talk") %>
                </p>
                <div class="comment-footer"><span class="comment-date"><%# Eval("replytime")%></span><a href="" class="reply-link">回复</a></div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <div class="comment-edit-box">
        <asp:Label ID="Label1" runat="server" Text="Label">你的昵称：</asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" MaxLength="200" Rows="4" 
                        TextMode="MultiLine" Width="680px"></asp:TextBox>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="发布" BackColor="#E6E6E6"
            ForeColor="#555555" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px" 
            Font-Size="14px" Height="32px" Width="100px" onclick="Button1_Click" AutoPostBack="false"/> 
        <div style="color:Red;font-size:14px;"><asp:Literal ID="FailureText" runat="server"></asp:Literal></div>
    </div>
    <div class="comment-edit-box reply-box">
        <asp:Label ID="Label2" runat="server" Text="Label">你的昵称：</asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" MaxLength="200" Rows="4" 
                        TextMode="MultiLine" Width="680px"></asp:TextBox>
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <asp:Button ID="Button2" runat="server" Text="发布" BackColor="#E6E6E6"
            ForeColor="#555555" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px" 
            Font-Size="14px" Height="32px" Width="100px" onclick="Button2_Click"/> 
        <div style="color:Red;font-size:14px;"><asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

