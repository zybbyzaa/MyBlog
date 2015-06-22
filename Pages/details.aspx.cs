using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int queryId = Convert.ToInt32(Request.QueryString["id"]);
            if (!IsPostBack)
            {
                bind(queryId);//绑定代码
            }
        }
        catch
        {
            Response.Write("<script>alert('页面错误！');location.href='details.aspx';</script>");
        }
        if (FormView1.DataItemCount > 0)
        {
            this.Title = (FormView1.Row.FindControl("HiddenField1") as HiddenField).Value;
            if (User.Identity.IsAuthenticated)
            {
                TextBox1.ReadOnly = true;
                TextBox1.Text = User.Identity.Name;
            }
        }
        else
            this.Title = "没有数据";
    }
    public void bind(int id)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM [article] where id = " + id;
        SqlDataSource1.DataBind();
        FormView1.DataBind();
    }
    public string formatType(string type)
    {
        string typename = "";
        switch (type)
        {
            case "0":
                typename = "移动开发";
                break;
            case "1":
                typename = "前端开发";
                break;
            case "2":
                typename = "后台开发";
                break;
            case "3":
                typename = "数据库相关";
                break;
            default:
                typename = "未知错误";
                break;
        }
        return typename;
    }
    public string formatDate(string date)
    {
        string str = "";
        DateTime startTime = Convert.ToDateTime(date);
        DateTime endTime = DateTime.Now;
        TimeSpan ts = endTime - startTime;
        double sec = ts.TotalSeconds;
        if (sec < 60)
            str = "刚刚";
        else if (sec < 60 * 60)
            str = Math.Floor(ts.TotalMinutes) + "分钟前";
        else if (sec < 60 * 60 * 24)
            str = Math.Floor(ts.TotalHours) + "小时前";
        else if (sec < 60 * 60 * 24 * 30)
            str = Math.Floor(ts.TotalDays) + "天前";
        else
            str = date;
        return str;
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
        string alid = FormView1.DataKey.Value.ToString();
        string sqlStr = "insert into comment(cmname,comment,commenttime,al_id) values('" + name + "','" + comment + "','" + datenow + "',"+alid+")";
        string sqlstr2 = "update article set comment_num = comment_num+1 where id = " + alid;
        DataAdapter da = new DataAdapter("BlogConString");
        if (da.ExecuteSqlNoQuery(sqlStr) > 0 && da.ExecuteSqlNoQuery(sqlstr2) > 0)
        {
            Response.Redirect("details.aspx?id=" + FormView1.DataKey.Value.ToString());
        }
        else
        {
            FailureText.Text = "发布失败";
            return;
        }
    }
}