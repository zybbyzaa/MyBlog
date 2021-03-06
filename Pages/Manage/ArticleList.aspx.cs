﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Manage_ArticleList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "文章列表";
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton del = (LinkButton)e.Row.Cells[4].Controls[0];
                del.OnClientClick = "return confirm('您真的要删除当前文章吗？')";
            }
            catch (Exception ee)
            {
                Response.Write("<script>alert(" + ee.Message + ")</script>");
            }
        }
    }
}