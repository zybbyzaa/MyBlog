using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Manage_AddArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "文章发表";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string title = TitleText.Text;
        string article = edit.Text;
        string name = User.Identity.Name;
        string datenow = DateTime.Now.ToString();
        int type = Convert.ToInt32(DropDownList1.SelectedValue);
        if (title == "")
        {
            lblInfo.Text = "标题不能为空";
            return;
        }
        if (article == "")
        {
            lblInfo.Text = "文章内容不能为空";
            return;
        }
        article = Server.HtmlEncode(article);
        string sqlStr = "insert into article(title,text,type,comment_num,author,create_time) values('" + title + "','" + article + "'," + type + ",0,'" + name + "','" + datenow + "')";
        DataAdapter da = new DataAdapter("BlogConString");
        if (da.ExecuteSqlNoQuery(sqlStr) == 0)
        {
            lblInfo.Text = "发表失败";
            return;
        }
        lblInfo.Text = "发表成功";
    }
}