<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false"%>
<html>
<head>
<title></title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<base target="_self" />
<script language=javascript>
var userAgent = navigator.userAgent.toLowerCase();
var is_ie = (userAgent.indexOf('msie') != -1);
</script>
<style type="text/css">
body,a,table,input,button{font-size:9pt;font-family:Verdana,Arial}
</style>
</head>
<body leftmargin=5 topmargin=5>
    <form id="form1" runat="server">
    <fieldset><legend>试用版信息</legend>你使用的是试用版,不提供导入Word文档的功能,购买正式授权商业版后,才能正常使用此功能(无需任何设置,普通的虚拟ASP.NET2.0空间即可支持)!你也可以到官方网站的<a href="http://www.aspxcn.com.cn/dotnettextbox/demo.aspx" style=" color:Red" target=_blank>在线演示</a>试用此功能!</fieldset>
       
    </form>
</body>
<script language=javascript>
if(is_ie)
{
document.body.bgColor="ButtonFace";
}
else
{
document.body.bgColor="#E0E0E0";
}
</script>
</html>