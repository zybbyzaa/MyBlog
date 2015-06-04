<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="Reply.aspx.cs" Inherits="Pages_Manage_Reply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #reply
        {
            width: 400px;
            border-radius: 10px;
            border: solid 1px #ccc;
            margin: 20px auto;
            padding-top: 10px;
            padding-left:20px;   
                   
        }
        #reply-header
        {
            text-align: center;  
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                <div id="reply">
                <div id="reply-header">
                    <h3>回复留言</h3>
                </div>
                <div id="reply-body">
                    <asp:Label ID="Label1" runat="server" Text="Label">回复人：</asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Width="320px" ReadOnly="true"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="200" Rows="4" 
                                    TextMode="MultiLine" Width="380px"></asp:TextBox>
                    <div style="color:Red;font-size:14px;"><asp:Literal ID="FailureText" runat="server"></asp:Literal></div>             
                </div>
                <div style="text-align:right;padding-right:20px">
                    <asp:Button ID="Button1" runat="server" Text="回复" BackColor="#E6E6E6" onclick="Button1_Click"
                    ForeColor="#555555" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px" 
                    Font-Size="14px" Height="32px" Width="100px" AutoPostBack="false"/> 
                </div>
            </div>         
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

