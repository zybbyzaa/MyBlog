using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Manage_Reply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "回复留言";
        if (string.IsNullOrEmpty(Request.QueryString["t_id"]))
            Response.Write("<script>alert('参数错误！');location.href='TalkList.aspx';</script>");
        if (User.Identity.IsAuthenticated)
        {
            TextBox1.Text = User.Identity.Name;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["t_id"];
        string name = TextBox1.Text;
        string comment = TextBox2.Text;
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
        string sqlStr = "insert into reply(username,reply,replytime,tl_id) values('" + name + "','" + comment + "','" + datenow + "','" +id+ "')";
        DataAdapter da = new DataAdapter("BlogConString");
        if (da.ExecuteSqlNoQuery(sqlStr) == 0)
        {
            FailureText.Text = "回复失败";
            return;
        }
        Response.Redirect("ReplyList.aspx");
    }
}