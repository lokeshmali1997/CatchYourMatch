using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user : System.Web.UI.Page
{

    DataFunction objdf = new DataFunction();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                ds = objdf.FillDsS("select * from UserMaster um where um.id = '" + Session["id"] + "'");
                Session["username"] = ds.Tables[0].Rows[0]["username"].ToString();
                lblusername.Text = "Hi" + " " + Session["username"];
                Userprofiledetails();

            }
        }
        

    }
    public void Userprofiledetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];
        ds = objdf.FillDsParam("usp_filluserdetails", param);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblprofilename.Text = ds.Tables[0].Rows[0]["username"].ToString();
            lblstate.Text = ds.Tables[0].Rows[0]["state"].ToString();

            Image1.ImageUrl = ds.Tables[0].Rows[0]["profileimage"].ToString();
            lblname.Text = ds.Tables[0].Rows[0]["username"].ToString();
            lblemail.Text = ds.Tables[0].Rows[0]["useremail"].ToString();
            lblcontact.Text = ds.Tables[0].Rows[0]["usermobilenumber"].ToString();
            lblMS.Text = ds.Tables[0].Rows[0]["maritalstatus"].ToString();


            lblmothertounge.Text = ds.Tables[0].Rows[0]["mothertongue"].ToString();
            lblage.Text = ds.Tables[0].Rows[0]["age"].ToString();
            lblheight.Text = ds.Tables[0].Rows[0]["height"].ToString();
            lblcaste.Text = ds.Tables[0].Rows[0]["caste"].ToString();
            lbldiet.Text = ds.Tables[0].Rows[0]["deit"].ToString();
            lblsmoke.Text = ds.Tables[0].Rows[0]["hobbies"].ToString();


            txtname.Text = ds.Tables[0].Rows[0]["username"].ToString();
            
            txtemail.Text = ds.Tables[0].Rows[0]["useremail"].ToString();
            txtcontact.Text = ds.Tables[0].Rows[0]["usermobilenumber"].ToString();
            txtMS.Text = ds.Tables[0].Rows[0]["maritalstatus"].ToString();


            txtmothertounge.Text = ds.Tables[0].Rows[0]["mothertongue"].ToString();
            txtage.Text = ds.Tables[0].Rows[0]["age"].ToString();
            txtheight.Text = ds.Tables[0].Rows[0]["height"].ToString();
            txtcaste.Text = ds.Tables[0].Rows[0]["caste"].ToString();
            txtdiet.Text = ds.Tables[0].Rows[0]["deit"].ToString();
            txtdrinksmoke.Text = ds.Tables[0].Rows[0]["hobbies"].ToString();

            txtpass.Text = ds.Tables[0].Rows[0]["userpassword"].ToString();

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


    protected void UpdateUserDetails_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "usp_updateuserdetails";

        cmd.Parameters.AddWithValue("@UserId", Session["id"].ToString());
        cmd.Parameters.AddWithValue("@YourName",txtname.Text);
        cmd.Parameters.AddWithValue("@number",Convert.ToInt64(txtcontact.Text));
        cmd.Parameters.AddWithValue("@password", txtpass.Text);
        cmd.Parameters.AddWithValue("@Email", txtemail.Text);

        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            Response.Write("<script>alert('Update Successfully')</script>");
            
        }
        txtname.Text = "";
        txtcontact.Text = "";
        txtpass.Text = "";
        txtemail.Text = "";
        Userprofiledetails();
        con.Close();
    }
}