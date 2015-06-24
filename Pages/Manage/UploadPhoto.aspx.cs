using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Manage_UploadPhoto : System.Web.UI.Page
{
    private string uploadDir;//文件保存路径
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "相片上传";
        uploadDir = Path.Combine(Request.PhysicalApplicationPath, "Uploads");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string description = TextDesc.Text;
        if (description == "")
        {
            lblInfo.Text = "描述不能为空";
            return;
        }
        if (description.Length > 100)
        {
            lblInfo.Text = "描述过长，长度不能超过100个字符";
            return;
        }
        if (FileUpload1.PostedFile.FileName == "")
        {
            lblInfo.Text = "请选择文件";
        }
        else
        {
            if (FileUpload1.PostedFile.ContentLength > 1024 * 1024)
            {
                lblInfo.Text = "文件大小不能超过1M";
            }
            else
            {
                string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                if (extension.ToLower() != ".jpg")
                {
                    lblInfo.Text = "只支持上传jpg文件";
                }
                else
                {
                    string serverFileName = Guid.NewGuid().ToString() + extension;
                    string fullUploadPath = Path.Combine(uploadDir, serverFileName);
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(fullUploadPath);
                        string sqlStr = "insert into photo(description,photoUrl) values('" + description + "','Uploads/" + serverFileName + "')";
                        DataAdapter da = new DataAdapter("BlogConString");
                        if (da.ExecuteSqlNoQuery(sqlStr) == 0)
                        {
                            lblInfo.Text = "上传失败";
                            return;
                        }
                        Image1.ImageUrl = "/MyBlog/Uploads/" + serverFileName;
                        lblInfo.Text = "文件：" + serverFileName;
                        lblInfo.Text += "成功上传到 ";
                        lblInfo.Text += fullUploadPath;
                    }
                    catch (Exception ee)
                    {
                        lblInfo.Text = ee.Message;
                    }
                }
            }
        }
    }
}