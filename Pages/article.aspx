<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/FrontPage.master" AutoEventWireup="true" CodeFile="article.aspx.cs" Inherits="Pages_article" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="Webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .new li {
            height: 25px;
            line-height: 25px;
            clear: both;
            padding-left: 5px;
            overflow: hidden;
            padding-left: 15px;
            background: url(../Images/li.jpg) no-repeat left center;
        }
        .rnav {
          width: 250px;
          margin: 20px 0;
          overflow: hidden;
        }
        .rnav li {
          width: 120px;
          text-align: center;
          display: inline-block;
          margin-bottom: 5px;
          margin-right: 5px;
          float: left;
          height: 40px;
          line-height: 40px;
        }
        .rnav li a {
          color: #fff;
          display: block;
          -webkit-transition: all 1s;
          -moz-transition: all 1s;
          -o-transition: all 1s;
          transition: all 1s;
        }
        .rnav1 {
          background: #fe5187;
        }
        .rnav2 {
          background: #339967;
        }
        .rnav3 {
          background: #ff8151;
        }
        .rnav4 {
          background: #66cc9a;
        }
        .rnav ul li a:hover {
          background: rgba(255,255,255,.2);
          -webkit-transform: rotate(360deg);
          -moz-transform: rotate(360deg);
          -o-transform: rotate(360deg);
          transform: rotate(360deg);
        }
        #main_left h3
        {
            color: #333;
            font-size: 14px;
            margin: 20px 0 10px 0;
            clear: both;
        }
        a.readmore {
          background: #f90;
          color: #fff;
          padding: 5px 10px;
          float: right;
          margin: 20px 0 0 0;
        }
        .dateview {
          margin-bottom: 10px;
        }
        .dateview span {
          margin: 0 10px;
          font: 12px "宋体",Arial,Helvetica,sans-serif;
          color: #756f71;
        }
        .dateview span a {
          color: #099b43;
        } 
        .nlist {
          width: 530px;
          float: left;
          margin: 0 0 0 10px;
          line-height: 1.9;
        } 
        .line {
          overflow: hidden;
          width: 97%;
          height: 20px;
          border-bottom: 1px dashed #ccc;
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
    <div id="main_left" class="left" style="min-height:500px">
        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <div>
                    <h3>
                        <%# Eval("title") %>                        
                    </h3>       
                    <p class="dateview">
                        <span>发表于：<%# Eval("create_time") %></span><span>评论数：<span><%# Eval("comment_num") %></span></span><span>作者：<%# Eval("author") %></span><span>个人博客：
                        [<a href='article.aspx?type=<%# Eval("type") %>'><%# formatType(Eval("type").ToString())%></a>]
                        </span>                        
                    </p>
                    <ul class="nlist">                   
                        <a title='<%# Eval("title") %>' href='details.aspx?id=<%# Eval("id") %>'' class="readmore">阅读全文&gt;&gt;</a>
                    </ul>
                    <div class="line"></div>
                </div> 
            </ItemTemplate>
            <FooterTemplate>
                <p> 
                <asp:Label ID="lbEmpty" Text="找不到任何数据！" ForeColor="Red"  runat="server" Visible='<%#bool.Parse((Repeater2.Items.Count==0).ToString())%>'></asp:Label>  
                </p> 
            </FooterTemplate> 
        </asp:Repeater>
        <div id="page" style="line-height:24px;">  
           <webdiyer:AspNetPager ID="AspNetPager1" runat="server"   
            CurrentPageButtonClass="biaogebg" CurrentPageButtonStyle="biaogebg"   
            CustomInfoHTML="[第 %CurrentPageIndex% / %PageCount% 页] [共%RecordCount%条 %PageSize%条/页]　"   
            FirstPageText="首页" LastPageText="尾页" LayoutType="Table" NextPageText="后一页"   
            OnPageChanging="AspNetPager1_PageChanging" PrevPageText="上一页"   
            ShowCustomInfoSection="Right" ShowPageIndexBox="Always" SubmitButtonText="Go"   
            TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" ShowBoxThreshold="20"   
            PagingButtonSpacing="8px" CenterCurrentPageButton="True"   
            CustomInfoSectionWidth="30%" PageIndexBoxType="DropDownList" PageSize="8"   
                ShowPrevNext="False">  
            </webdiyer:AspNetPager>   
        </div>
    </div>
    <div id="main_right" class="right">
        <div class="rnav">
            <ul id="ulNav">
            <li class="rnav1"><a href="?type=0">移动开发</a></li>
            <li class="rnav2"><a href="?type=1">前端开发</a></li>
            <li class="rnav3"><a href="?type=2">后台开发</a></li>
            <li class="rnav4"><a href="?type=3">数据库相关</a></li>
            </ul>
        </div>
        <h3>
            <p>最新文章</p>
        </h3>
        <ul class="new">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <li><a href='details.aspx?id=<%# Eval("id") %>'><%# Eval("title") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BlogConString %>" 
                SelectCommand="SELECT TOP 10 * FROM [article] ORDER BY [create_time] DESC"></asp:SqlDataSource>
        </ul>
    </div>
</asp:Content>

