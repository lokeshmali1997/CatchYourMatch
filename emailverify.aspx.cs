using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class emailverify : System.Web.UI.Page
{
    DataFunction objdf = new DataFunction();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            txtemail.Text = Request.QueryString["eid"];

            email();
            selectuserid();
        }
    }



    public void email()
    {

        string sendtomail = txtemail.Text;
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
            //Response.Write("<script>alert('otp sent successfully')</script>");
        }
        else
        {
            //Response.Write("<script>alert('otp not sent')</script>");
        }





    }

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

    public void selectuserid()
    {
       
    }

    protected void btnverify_Click(object sender, EventArgs e)
    {
        if (txtverify.Text == ViewState["msgotp"].ToString())
        {

            Response.Write("<script>alert('otp verifyed')</script>");

            ds = objdf.FillDsS("select * from UserMaster where useremail ='" + txtemail.Text + "'");


           if(ds.Tables[0].Rows.Count > 0)
            {
                Session["username"] = ds.Tables[0].Rows[0]["username"];
                int id = Int32.Parse(ds.Tables[0].Rows[0]["id"].ToString());

                Response.Redirect("home.aspx?id=" + id);

            }
               
        }
        else
        {
            Response.Write("<script>alert('otp not verifyed')</script>");
        }
        txtverify.Text = "";



    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        email();
    }
}