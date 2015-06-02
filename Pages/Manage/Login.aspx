<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录</title>
    <link href="/MyBlog/Style/CommonStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            background: #fff url(/MyBlog/Images/bg.png) repeat-x;
        }
        #logo
        {
            width: 300px;
            height: 75px;
            background: #3b6ea5 url(/MyBlog/Images/logo2.jpg);
            margin: 200px auto 0;
        }
        #login
        {
            width: 500px;
            margin: 60px 530px;
        }
        .style1
        {
            height: 96px;
        }
        #Reset,#Login_LoginButton
        {
            width: 60px;
            height: 30px;
            background-color: #3b6ea5;
            border: 1px Outset #fff;
            color: #fff;
        }
        td
        {
            color: Black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="logo">
        </div>
        <div id="login">
            <asp:Login ID="Login" runat="server" DestinationPageUrl="index.aspx">
            </asp:Login>          
        </div>
    </form>
    <script src="/MyBlog/Script/jquery-1.11.2.min.js" type="text/javascript"></script> 
</body>
</html>
