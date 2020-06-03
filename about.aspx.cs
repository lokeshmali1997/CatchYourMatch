using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about : System.Web.UI.Page
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
}