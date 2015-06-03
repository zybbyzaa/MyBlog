using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_talk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "留言";
        ((Label)Page.Master.FindControl("lblTitle")).Text = "谈天";
        ((Label)Page.Master.FindControl("lblTitle2")).Text = "说地";
        if (User.Identity.IsAuthenticated)
        {
            TextBox1.ReadOnly = true;
            TextBox1.Text = User.Identity.Name;
            TextBox3.ReadOnly = true;
            TextBox3.Text = User.Identity.Name;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = TextBox1.Text;
        string comment = TextBox2.Text;
        if (name == "")
        {
            FailureText.Text = "昵称不能为空";
            return;
        }
        if (comment == "")
        {
            FailureText.Text = "内容不能为空";
            return;
        }
        else if (comment.Length > 200)
        {
            FailureText.Text = "输入字符超过200个";
            return;
        }
        string datenow = DateTime.Now.ToString();
        string sqlStr = "insert into talk(username,talk,replytime) values('" + name + "','" + comment + "','" + datenow + "')";
        DataAdapter da = new DataAdapter("BlogConString");
        if (da.ExecuteSqlNoQuery(sqlStr) == 0)
        {
            FailureText.Text = "发布失败";
            return;
        }
        Response.Redirect("talk.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string name = TextBox3.Text;
        string comment = TextBox4.Text;
        if (name == "")
        {
            Literal1.Text = "昵称不能为空";
            return;
        }
        if (comment == "")
        {
            Literal1.Text = "内容不能为空";
            return;
        }
        else if (comment.Length > 200)
        {
            Literal1.Text = "输入字符超过200个";
            return;
        }
        string rname = HiddenField1.Value;
        string datenow = DateTime.Now.ToString();
        string sqlStr = "insert into talk(username,talk,replytime,isreply,replyname) values('" + name + "','" + comment + "','" + datenow + "',1,'" + rname + "')";
        DataAdapter da = new DataAdapter("BlogConString");
        if (da.ExecuteSqlNoQuery(sqlStr) == 0)
        {
            Literal1.Text = "发布失败";
            return;
        }
        Response.Redirect("talk.aspx");
    }
}