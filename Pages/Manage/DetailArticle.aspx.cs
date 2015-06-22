using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Manage_DetailArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "文章内容";
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
            Response.Write("<script>alert('页面错误！');location.href='DetailArticle.aspx';</script>");
        }       
    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        string id = (FormView1.Row.FindControl("HiddenField1") as HiddenField).Value;
        string title = (FormView1.Row.FindControl("TextTitle") as TextBox).Text;
        string article = (FormView1.Row.FindControl("edit") as DotNetTextBox.WebEditor).Text;
        if (title == "")
        {
            (FormView1.Row.FindControl("lblInfo") as Label).Text = "标题不能为空";
            return;
        }
        if (article == "")
        {
            (FormView1.Row.FindControl("lblInfo") as Label).Text = "文章内容不能为空";
            return;
        }
        article = Server.HtmlEncode(article);
        string sqlStr = "update article set title = '"+title+"',text = '"+article+"' where id = "+id;
        DataAdapter da = new DataAdapter("BlogConString");
        if (da.ExecuteSqlNoQuery(sqlStr) == 0)
        {
            (FormView1.Row.FindControl("lblInfo") as Label).Text = "修改失败";
            return;
        }
        (FormView1.Row.FindControl("lblInfo") as Label).Text = "修改成功";
    }
    public string formatType(string type)
    {
        string typename = "";
        switch (type)
        {
            case "0":
                typename="移动开发";
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
    public void bind(int id)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM [article] where id = "+id;
        SqlDataSource1.DataBind();
        FormView1.DataBind();
    }
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        switch (e.NewMode)
        {
            case FormViewMode.Edit:
                bind(Convert.ToInt32(Request.QueryString["id"]));
                break;
            case FormViewMode.Insert:
                bind(Convert.ToInt32(Request.QueryString["id"]));
                break;
            case FormViewMode.ReadOnly:
                bind(Convert.ToInt32(Request.QueryString["id"]));
                break;
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            string sqlstr1 = "delete from comment where c_id = "+e.CommandArgument;
            string sqlstr2 = "update article set comment_num = comment_num-1 where id = " + Request.QueryString["id"] + " and comment_num <> 0";
            DataAdapter da = new DataAdapter("BlogConString");
            if (da.ExecuteSqlNoQuery(sqlstr1) > 0 && da.ExecuteSqlNoQuery(sqlstr2) > 0)
            {
                Response.Write("<script>alert('删除成功！');location.href='DetailArticle.aspx?id=" + Request.QueryString["id"] + "';</script>");
            }
            else
            {
                Response.Write("<script>alert('删除失败！');location.href='DetailArticle.aspx?id=" + Request.QueryString["id"] + "';</script>");               
            }
        }
    }
}