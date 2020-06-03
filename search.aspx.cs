using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
        lblusername.Text = "Hi" + " " + Session["username"];
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("match.aspx");
    }

    protected void lnkogout_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("loginpage.aspx");

    }

}