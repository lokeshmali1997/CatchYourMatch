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

public partial class match : System.Web.UI.Page
{
    DataFunction objdf = new DataFunction();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        // if (!IsPostBack)
        //{
        if (Session["username"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
       // txtid.Text = Session["id"].ToString();

            lblusername.Text = "Hi" + " " + Session["username"];
         matchinguserdetails();
        //}

    }

    public void matchinguserdetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];

        ds = objdf.FillDsParam("usp_macthuserdetails", param);


        Repeater1.DataSource = ds;
        Repeater1.DataBind();

    }

    protected void lnkogout_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("loginpage.aspx");

    }

}