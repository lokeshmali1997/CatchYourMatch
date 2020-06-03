using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    string sendtomail;
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblMin.Text = "18";
        //lblMax.Text = "40";
    }
    protected void GenerateOTP(object sender, EventArgs e)
    {
        sendtomail = txtsendmail.Text;
        string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "1234567890";

        string characters = numbers;
        characters += alphabets + small_alphabets + numbers;

        int length = 6;
        string otp = string.Empty;
        for (int i = 0; i < length; i++)
        {
            string character = string.Empty;
            do
            {
                int index = new Random().Next(0, characters.Length);
                character = characters.ToCharArray()[index].ToString();
            } while (otp.IndexOf(character) != -1);
            otp += character;
        }
       // lblOTP.Text = otp;
        //Random rnd = new Random();
        //int otp = rnd.Next(1000, 9999);
        ViewState["msgotp"] = otp;
        string msg = "your otp from catchyourmatch.com is " + otp;
        bool f = SendOTP("lokeshmali1997@gmail.com", sendtomail, "Verification Your Email", msg);
        if (f)
        {
            Response.Write("<script>alert('otp sent successfully')</script>");
        }
        else
        {
            Response.Write("<script>alert('otp not sent')</script>");
        }




    }

  
/////below method is for sending mail just put an smtp according to your mail server  
public bool SendOTP(string from, string to, string subject, string body)
    {
        bool f = false;
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(to);
            mailMessage.From = new MailAddress(from);
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


    protected void btnverify_Click(object sender, EventArgs e)
    {
        if (textBox3.Text == ViewState["msgotp"].ToString())
        {
            Response.Write("<script>alert('otp verifyed')</script>");
        }
        else
        {
            Response.Write("<script>alert('otp not verifyed')</script>");
            //// user entered wrong otp  
        }
    }
}