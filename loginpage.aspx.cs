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

public partial class loginpage : System.Web.UI.Page
{
    DataFunction objdf = new DataFunction();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }



    protected void btnlogin_Click(object sender, EventArgs e)
    {
        ds = objdf.FillDsS("select * from UserMaster where useremail ='"+txtloginemail.Text+"' AND userpassword ='"+txtloginpass.Text+"'");


        if(ds.Tables[0].Rows.Count > 0)
        {
            int id = Int32.Parse(ds.Tables[0].Rows[0]["id"].ToString());
            Session["username"] = ds.Tables[0].Rows[0]["username"];
            Session["id"] = ds.Tables[0].Rows[0]["id"];
            Response.Redirect("home.aspx?id="+id);

        }
        else
        {
            Response.Write("<script>alert('username and passwors are wrong')</script>");
        }

    }
}