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


public partial class _Default : System.Web.UI.Page
{
    DataFunction objdf = new DataFunction();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
            lblusername.Text = "Hi" + " " + Session["username"];
            selectuserdetails();
        
        

    }

    public void selectuserdetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];
        
        ds = objdf.FillDsParam("usp_filluserdetails",param);


        if (ds.Tables[0].Rows.Count > 0)
        {
           lblusername1.Text = ds.Tables[0].Rows[0]["username"].ToString();
            lblemail.Text = ds.Tables[0].Rows[0]["useremail"].ToString();
            Image1.ImageUrl = ds.Tables[0].Rows[0]["profileimage"].ToString();
            Image2.ImageUrl = ds.Tables[0].Rows[0]["profileimage"].ToString();
            lblliving.Text  = ds.Tables[0].Rows[0]["livingstatus"].ToString();
            lblmarital.Text = ds.Tables[0].Rows[0]["maritalstatus"].ToString();
            lblfamily.Text = ds.Tables[0].Rows[0]["familystatus"].ToString();
            lblheight.Text = ds.Tables[0].Rows[0]["height"].ToString();
            lblmt.Text = ds.Tables[0].Rows[0]["mothertongue"].ToString();
            lblr.Text = ds.Tables[0].Rows[0]["religion"].ToString();
            lblc.Text = ds.Tables[0].Rows[0]["caste"].ToString();
          

            lblage.Text = ds.Tables[0].Rows[0]["age"].ToString();
            lbldeit.Text = ds.Tables[0].Rows[0]["deit"].ToString();
            lblds.Text = ds.Tables[0].Rows[0]["hobbies"].ToString();
            lblps.Text = ds.Tables[0].Rows[0]["physicalstatus"].ToString();

            lblhe.Text = ds.Tables[0].Rows[0]["heighesteducation"].ToString();
            lblei.Text = ds.Tables[0].Rows[0]["employeein"].ToString();
            lblocc.Text = ds.Tables[0].Rows[0]["occupation"].ToString();
            lblai.Text = ds.Tables[0].Rows[0]["annualincome"].ToString();
            lblabout.Text = ds.Tables[0].Rows[0]["aboutyourself"].ToString();

            lblcity.Text = ds.Tables[0].Rows[0]["city"].ToString();
            lblstate.Text = ds.Tables[0].Rows[0]["state"].ToString();
            lblcon.Text = ds.Tables[0].Rows[0]["country"].ToString();
            //lblabout.Text = ds.Tables[0].Rows[0]["aboutyourself"].ToString();



        }
        else
        {
            Response.Write("<script>alert('data not fill')</script>");
        }
    }



    protected void lnkogout_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("loginpage.aspx");

    }
}