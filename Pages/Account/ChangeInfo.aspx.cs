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
    }
    protected void Continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("/MyBlog/Pages/Manage/Login.aspx");
    }
    protected void ChangeEmailPushButton_Click(object sender, EventArgs e)
    {
        MembershipUser u = Membership.GetUser(CurrentName.Text.Trim());
        if (u == null)
        {
            FailureText2.Text = "当前账户名不存在";
            return;
        }
        else
        {
            if (EmailText.Text.Trim() != u.Email)
            {
                FailureText2.Text = "账户名与邮箱不匹配";
                return;
            }
            else
            {
                u.Email = NewEmail.Text.Trim();
                Membership.UpdateUser(u);
                Response.Write("<script>alert('修改邮箱成功！');location.href='ChangeInfo.aspx';</script>");
            }
        }
    }
}