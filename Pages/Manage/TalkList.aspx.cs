using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer;

public partial class Pages_Manage_TalkList : System.Web.UI.Page
{
    int recordcount; 
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "查看留言";
        if (!IsPostBack)
        {
            bind();//绑定代码  
        } 
    }
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex - 1;//这儿需要注意，AspNetPager中的PageIndex是从1开始的，而GridView的是从0开始的，所以要减1.这里是令GridView1跳到当前页面  
        bind();//GridView的数据绑定方法   
        AspNetPager pager = this.GridView1.BottomPagerRow.FindControl("AspNetPager1") as AspNetPager;
        pager.CurrentPageIndex = e.NewPageIndex; //这里是告诉AspNetPager当前页面是多少  
    }
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        recordcount = Convert.ToInt32(e.AffectedRows); //e.AffectedRows获取的就是总记录数   
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.BottomPagerRow; //获取GridView的PagerTemplate，即分页导航行   
        if (row != null) ((AspNetPager)(row.FindControl("AspNetPager1"))).RecordCount = recordcount;
    }  
    public void bind()
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM [talk]";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
    }
    protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Response.Write("<script>alert('删除成功！');location.href='TalkList.aspx';</script>");
    }
}