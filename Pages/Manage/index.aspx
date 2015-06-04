<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Pages_Manage_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table
        {
            width:700px;
            margin: 30px auto;
            font-size:15px;
            table-layout: automatic;
        }
        .td1
        {
            width:12%;
            text-align: center;
        }
        .td2
        {
            width:88%;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border='1'  style='border-collapse:collapse;' cellspacing='0' bordercolor='black'>
        <tr>
            <td colspan="2" align="center">服务器信息</td>
        </tr>
        <tr>
            <td class="td1">本机ip</td>
            <td class="td2"><%=Request.ServerVariables["remote_addr"]%></td>
        </tr>
        <tr>
            <td class="td1">服务器名</td>
            <td class="td2"><%=Request.ServerVariables["SERVER_NAME"]%></td>
        </tr>
        <tr>
            <td class="td1">服务器IP</td>
            <td class="td2"><%=Request.ServerVariables["LOCAL_ADDR"]%></td>
        </tr>
        <tr>
            <td class="td1">服务器端口</td>
            <td class="td2"><%=Request.ServerVariables["SERVER_PORT"]%></td>
        </tr>
        <tr>
            <td class="td1">用户代理</td>
            <td class="td2"><%=Request.ServerVariables["HTTP_USER_AGENT"]%></td>
        </tr>
        <tr>
            <td class="td1">当前时间</td>
            <td class="td2"><span id="clock"></span></td>
        </tr>
    </table>
    <script>
        document.getElementById("clock").value = new Date().toLocaleString();
        var int = self.setInterval("clock()", 1000);
        function clock() {
            var time = new Date()
            document.getElementById("clock").value = time.toLocaleString();
        }
    </script>
</asp:Content>
