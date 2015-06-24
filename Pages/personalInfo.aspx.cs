using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_personalInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "个人中心";
        if (User.Identity.IsAuthenticated)
        {
            MembershipUser u = Membership.GetUser(User.Identity.Name);
            TextName.Text = u.UserName;
            TextEmail.Text = u.Email;
            TextCreate.Text = u.CreationDate.ToString("yyyy-MM-dd HH:mm:ss");
            TextLoginTime.Text = u.LastLoginDate.ToString("yyyy-MM-dd HH:mm:ss");
        }

    }
    protected void SaveInfoButton_Click(object sender, EventArgs e)
    {
        string qq = Request.Form["TextQQ"].ToString();
        string birth = Request.Form["TextBirth"].ToString();
        if (!string.IsNullOrEmpty(qq))
        {
            if (qq.Length < 6 || qq.Length > 11)
            {
                FailureText.Text = "QQ格式错误";
                return;
            }
            char[] ch = new char[qq.Length];
            ch = qq.ToCharArray();
            for (int i = 0; i < ch.Length; i++)
            {
                if (ch[i] < 48 || ch[i] > 57)
                {
                    FailureText.Text = "QQ格式错误";
                    return;
                }
            } 
        }
        Profile.birthday = Convert.ToDateTime(birth);
        Profile.qq = qq;
        Response.Write("<script>alert('保存成功');location.href='personalInfo.aspx';</script>");
    }
}