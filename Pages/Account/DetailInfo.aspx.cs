using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_DetailInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "个人信息";
        if (!IsPostBack)
        {
            bind();//绑定代码  
        }
    }
    public void bind()
    {
        string name = User.Identity.Name;
        SqlDataSource1.SelectCommand = "SELECT [Email], [PasswordQuestion], [PasswordAnswer], [UserName] FROM [vw_aspnet_MembershipUsers] WHERE ([UserName] = '" + name + "')";
        SqlDataSource1.DataBind();
        DetailsView1.DataBind();
    }
}