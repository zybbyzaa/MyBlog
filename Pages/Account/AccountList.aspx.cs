using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_AccountList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "账户列表";
        if (!IsPostBack)
        {
            bind();//绑定代码  
        }
    }
    protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            string username = e.CommandArgument.ToString();
            if (username == User.Identity.Name)
            {
                Response.Write("<script>alert('不能删除在线用户！');location.href='AccountList.aspx';</script>");
                return;
            }
            if (Membership.DeleteUser(username, true))
            {
                Response.Write("<script>alert('删除" + username + "成功！');location.href='AccountList.aspx';</script>");

            }
            else
            {
                Response.Write("<script>alert('删除失败！');location.href='AccountList.aspx';</script>");
            }
        }
    }
    public void bind()
    {
        string sql = "SELECT [UserId], [Email], [PasswordQuestion], [IsLockedOut], [CreateDate], [LastLoginDate], [UserName] FROM [vw_aspnet_MembershipUsers]";
        DataAdapter da = new DataAdapter("ApplicationServices");
        DataSet ds = da.ExcuteDataSet(sql);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        string sql = "SELECT [UserId], [Email], [PasswordQuestion], [IsLockedOut], [CreateDate], [LastLoginDate], [UserName] FROM [vw_aspnet_MembershipUsers]";
        if (SearchText.Text == "")
        {
            Response.Write("<script>alert('账户名不能为空！')</script>");
        }
        else
        {
            sql += " where [UserName]='" + SearchText.Text.Trim()+ "'";
            DataAdapter da = new DataAdapter("ApplicationServices");
            DataSet ds = da.ExcuteDataSet(sql);
            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
        }
    }
}