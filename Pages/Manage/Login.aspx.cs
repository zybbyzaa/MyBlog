using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
        {
            if (Roles.IsUserInRole(Page.User.Identity.Name, "Admin"))
                Response.Write("<script>location.href='/MyBlog/Pages/Manage/index.aspx';</script>");
            else
               info.Text = "您没有权限访问后台网站，请重新登录！";
        }
        else
            info.Text = "您还没有登录，请登录后再访问！";
    }
}