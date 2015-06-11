using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_photo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "相册";
        ((Label)Page.Master.FindControl("lblTitle")).Text = "图片";
        ((Label)Page.Master.FindControl("lblTitle2")).Text = "园地";
    }
}