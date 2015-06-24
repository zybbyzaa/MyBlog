using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated)
        {
            //登录后进行Profile属性初始化
            if (Profile.visitNum == 0)
            {
                Profile.icoUrl = "Uploads/ico/ico.jpg";
                Profile.birthday = Convert.ToDateTime("1990-02-01");
                Profile.qq = "";
                Profile.visitNum++;
            }
            else
                Profile.visitNum++;
            ((Page.Master.FindControl("LoginView1") as LoginView).FindControl("icoImg") as Image).ImageUrl = "~/" + Profile.icoUrl;
            //Response.Write(Profile.visitNum);

        }
    }
}
