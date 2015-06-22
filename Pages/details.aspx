<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="Pages_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .c_titile {
          font-size: 22px;
          margin: 20px 0;
          text-align: center;
          color: #333;
        }
        .box_c {
          border: #ccc 1px dashed;
          text-align: center;
          padding: 5px 0;
          margin-right: 30px;
          color: #999;
        }
        .box_c span {
          margin: 0 10px;
        }
        .box_c span a{
          color:#099b43;
        }
        ul.infos {
          overflow: hidden;
          margin: 20px 30px 20px 0;
          line-height: 28px;
          font-size: 14px;
          text-indent: 2em;
          color: #666;
        }
        .comments-info {
          width: 100%;
          font-size: 13px;
          margin-top: 10px;
          padding: 8px 0;
          line-height: 25px;
          position: relative;
        }
        .comments-num
        {
            border: 1px solid #ccc;
            background-color: rgba(0,0,0,0.04);
            text-shadow: 0 1px 0 #fff;
            padding: 3px 5px;
            display: inline;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            color: #777;
        }
        .comments
        {
            width: 100%;
            border-bottom: 1px solid rgba(0,0,0,0.13);
        }
        .comments li.none-data
        {
            border-top: 1px solid rgba(0,0,0,0.13);
            text-align: center;
            color: #999;
            padding: 1em 0;
        }
        .comments-body
        {
            border-top: 1px solid rgba(0,0,0,0.13);
            padding: 10px;
        }
        .comments-body p
        {
            font-size: 13px;
            line-height: 1.5em;
            margin: .5em 0;
            word-wrap: break-word;
        }
        .comments-header
        {
            font-size: 13px;
            margin-right: 8px;
            color: #d32;
        }
        .comments-footer
        {
            font-size: 12px;
            margin-right: 8px;
            color: #999;
        }
        .comment-edit-box
        {
            border-radius: 10px;
            border: solid 1px #ccc;
            width: 690px;
            margin-top: 10px;
            margin-left: 5px;
            padding-top: 10px;
            padding-left:20px;
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
        ConnectionString="<%$ ConnectionStrings:BlogConString %>">
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="100%"
         DataKeyNames="id">
         <ItemTemplate>
            <h2 class="c_titile"><%# Eval("title") %></h2>
            <p class="box_c"><span class="d_time">发布时间：<%# Eval("create_time") %></span><span>编辑：<%# Eval("author") %></span><span>类别 [<a href='article.aspx?type=<%# Eval("type") %>'><%# formatType(Eval("type").ToString())%></a>] </span></p>
            <ul class="infos">
                <%# Server.HtmlDecode(Eval("text").ToString()) %>
            </ul>
            <div class="comments-info">
                <a class="comments-num" href="javascript:void(0);"><%# Eval("comment_num") %>条评论</a>
            </div>
            <ul class="comments">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                    <EmptyDataTemplate>
                        <li class="none-data">还没有评论，沙发等你来抢</li>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <li class="item">
                            <div class="comments-body">
                                <span class="comments-header"><%# Eval("cmname")%></span>
                                <p><%# Eval("comment")%></p>
                                <span class="comments-footer"><%# formatDate(Eval("commenttime").ToString())%></span>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:ListView>              
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
                    SelectCommand="SELECT [cmname], [comment], [commenttime] FROM [comment] WHERE ([al_id] = @al_id) ORDER BY [commenttime] DESC">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="al_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ul>
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
         </ItemTemplate>
         <FooterTemplate>
             <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("title") %>' />           
         </FooterTemplate>
         <EmptyDataTemplate>
            <p>
                找不到数据
            </p>
          </EmptyDataTemplate>
    </asp:FormView>
</asp:Content>

