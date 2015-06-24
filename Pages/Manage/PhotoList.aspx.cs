using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Manage_PhotoList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "查看相片";
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton del = (LinkButton)e.Row.Cells[3].Controls[0];
                del.OnClientClick = "return confirm('您真的要删除当前图片吗？')";
            }
            catch (Exception ee)
            {
                Response.Write("<script>alert("+ee.Message+")</script>");
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            String[] argument = e.CommandArgument.ToString().Split(',');
            string id = argument[0];
            string photoUrl = argument[1];
            string sqlstr = "delete from photo where id = " + id;
            try
            {
                DataAdapter da = new DataAdapter("BlogConString");
                if (da.ExecuteSqlNoQuery(sqlstr) > 0)
                {
                    string pathTarget = Path.Combine(Server.MapPath("/MyBlog"), photoUrl);
                    if (File.Exists(pathTarget))
                    {
                        File.Delete(pathTarget);
                        Response.Write("<script>alert('删除成功！');location.href='PhotoList.aspx';</script>");
                    }
                }
                else
                    lblInfo.Text = "删除失败";
            }
            catch(Exception ee)
            {
                lblInfo.Text = ee.Message;
            }         
            //Response.Write(pathTarget);
        }
    }
}