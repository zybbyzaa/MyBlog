using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "文章分享";
        ((Label)Page.Master.FindControl("lblTitle")).Text = "学无";
        ((Label)Page.Master.FindControl("lblTitle2")).Text = "止境";
        string str = "select * from article";
        bool flag1 = false;
        bool flag2 = false;
        if (!string.IsNullOrEmpty(Request.QueryString["type"]))
            flag1 = true;
        if (!string.IsNullOrEmpty(Request.QueryString["kw"]))
            flag2 = true;
        if (flag1 == true && flag2 == true)
            str = str + " where type =" + Request.QueryString["type"].ToString() + " and title like '%" + HttpUtility.UrlDecode(Request.QueryString["kw"].ToString()) + "%'";
        else if (flag1 == true && flag2 == false)
            str = str + " where type =" + Request.QueryString["type"].ToString();
        else if (flag1 == false && flag2 == true)
            str = str + " where title like '%" + HttpUtility.UrlDecode(Request.QueryString["kw"].ToString()) + "%'";
        Session["sqlstr"] = str;
        if (!IsPostBack)
        {
            GetPager(str);
            AspNetPager1.CurrentPageIndex = 1;
            GetArticle(str);
        } 
    }
    private void GetPager(string sqlstr)
    {
        string sqlPageString = sqlstr;
        DataAdapter da = new DataAdapter("BlogConString");
        int count = 0;
        if(da.ExcuteDataSet(sqlPageString)!=null)
            count = da.ExcuteDataSet(sqlPageString).Tables[0].DefaultView.Count;
        AspNetPager1.AlwaysShow = true;
        AspNetPager1.RecordCount = count;
        AspNetPager1.PageSize = 5;
    }
    private void GetArticle(string sqlstr)
    {
        string sqlDataString = sqlstr;
        DataAdapter da = new DataAdapter("BlogConString");
        DataSet ds = da.ExcuteDataSet(sqlDataString, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize);
        Repeater2.DataSource = ds.Tables[0].DefaultView;
        Repeater2.DataBind();
    }
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        string str = Session["sqlstr"].ToString();
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        GetPager(str);
        GetArticle(str);
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
}