using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_AddAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "新建账户";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = TextName.Text;
        string pass = TextPass.Text;
        string email = TextEmail.Text;
        string question = TextQuestion.Text;
        string answer = TextAnswer.Text;
        if (name == "")
        {
            Literal1.Text = "账户名不能为空";
            return;
        }
        else if (pass == "")
        {
            Literal2.Text = "密码不能为空";
            return;
        }
        else if (email == "")
        {
            Literal3.Text = "邮箱不能为空";
            return;
        }
        else if (question == "")
        {
            Literal4.Text = "安全问题不能为空";
            return;
        }
        else if (answer == "")
        {
            Literal5.Text = "答案不能为空";
            return;
        }
        MembershipCreateStatus status;
        try
        {
            MembershipUser newUser = Membership.CreateUser(name, pass, email, question, answer, true, out status);
            if (newUser == null)
            {
                FailureText.Text = GetErrorMessage(status);
            }
            else
            {
                Roles.AddUserToRole(name, "Admin");
                SuccessText.Text = "新建成功";
            }          
        }
        catch (MembershipCreateUserException ee)
        {
            FailureText.Text = ee.Message;
        }
        catch (HttpException ee)
        {
            FailureText.Text = ee.Message;
        }
    }
    public string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "用户名已存在";

            case MembershipCreateStatus.DuplicateEmail:
                return "邮箱地址以存在";

            case MembershipCreateStatus.InvalidPassword:
                return "密码含有非法字符，请重新输入";

            case MembershipCreateStatus.InvalidEmail:
                return "邮箱含有非法字符，请重新输入";

            case MembershipCreateStatus.InvalidAnswer:
                return "安全问题答案含有非法字符，请重新输入";

            case MembershipCreateStatus.InvalidQuestion:
                return "安全问题含有非法字符，请重新输入";

            case MembershipCreateStatus.InvalidUserName:
                return "用户名含有非法字符，请重新输入";

            case MembershipCreateStatus.ProviderError:
                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            case MembershipCreateStatus.UserRejected:
                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            default:
                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
        }
    }
}