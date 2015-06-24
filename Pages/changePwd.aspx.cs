using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_changePwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "密码修改";
    }
    protected void Continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("/MyBlog/Pages/index.aspx");
    }
}