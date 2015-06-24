﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_changeHeadIco : System.Web.UI.Page
{
    private string uploadDir;//文件保存路径
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "头像修改";
        Image1.ImageUrl = "../" + Profile.icoUrl;
        uploadDir = Path.Combine(Request.PhysicalApplicationPath, "Uploads/ico");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
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
                    string serverFileName = User.Identity.Name + extension;
                    string fullUploadPath = Path.Combine(uploadDir, serverFileName);
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(fullUploadPath);
                        Profile.icoUrl = "Uploads/ico/" + serverFileName;
                        Image1.ImageUrl = "../" + Profile.icoUrl;
                        lblInfo.Text = "文件：" + serverFileName;
                        lblInfo.Text += "上传成功";
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