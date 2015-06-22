using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "首页";
        ((Label)Page.Master.FindControl("lblTitle")).Text = "文章";
        ((Label)Page.Master.FindControl("lblTitle2")).Text = "推荐";
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
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        string kw = KeyWord.Text.Trim();
        Response.Redirect("article.aspx?kw=" + HttpUtility.UrlEncodeUnicode(kw));
    }
}