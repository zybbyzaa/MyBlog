using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_ChangePwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "信息修改";
        MembershipUserCollection u = Membership.FindUsersByName(User.Identity.Name);
    }
    protected void Continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("/MyBlog/Pages/Manage/Login.aspx");
    }
}