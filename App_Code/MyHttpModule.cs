using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///MyHttpModule 的摘要说明
/// </summary>
public class MyHttpModule : IHttpModule
{
    public void Dispose() { }
    public void Init(HttpApplication context)
    {
        context.BeginRequest += new EventHandler(Application_BeginRequest);
        context.EndRequest += new EventHandler(Application_EndRequest);
    }
    public void Application_BeginRequest(object sender, EventArgs e)
    {
        HttpApplication application = sender as HttpApplication;
        HttpContext context = application.Context;
        HttpResponse response = context.Response;
        if (context.Request.CurrentExecutionFilePath.Contains("Pages"))
        {
            if (context.Request.CurrentExecutionFilePath.EndsWith(".aspx") || context.Request.CurrentExecutionFilePath.EndsWith(".html") || context.Request.CurrentExecutionFilePath.EndsWith(".htm"))
                ;
            else
                response.Redirect("/MyBlog/Pages/index.aspx");
        }
        string[] urlfilter = { "Uploads/", "Style/", "Script/", "Images/", "Fonts/" };
        foreach (string s in urlfilter)
        {
            if (context.Request.CurrentExecutionFilePath.EndsWith(s))
            {
                response.Redirect("/MyBlog/Pages/index.aspx");
            }
        }     
    }
    public void Application_EndRequest(object sender, EventArgs e)
    {
        HttpApplication application = sender as HttpApplication;
        HttpContext context = application.Context;
        HttpResponse response = context.Response;
    }
}
