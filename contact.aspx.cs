using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
        lblusername.Text = "Hi" + " " + Session["username"];
    }


    protected void lnkogout_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("loginpage.aspx");

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        email();
    }


    public void email()
    {

        string sendtomail = txtemail.Text;
      

              string msg = "This Message from catchyourmatch.com is " + txtmsg;
       // string name = txtname.Text;
        bool f = SendOTP(sendtomail,  "lokeshmali1997@gmail.com", "Message from catchyourmatch.com", msg);
        if (f)
        {
            Response.Write("<script>alert('sent successfully')</script>");
        }
        else
        {
            Response.Write("<script>alert(' not sent')</script>");
        }





    }

    public bool SendOTP(string to, string from, string subject, string body)
    {
        bool f = false;
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(from);
            mailMessage.From = new MailAddress(to);
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("lokeshmali1997@gmail.com", "lokesh#7412359");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.Send(mailMessage);
            f = true;
        }
        catch (Exception ex)
        {
            f = false;
        }
        return f;
    }




}