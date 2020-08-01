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
         if (!IsPostBack)
        {
        if (Session["username"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
       
            lblusername.Text = "Hi" + " " + Session["username"];
         matchinguserdetails();
       }

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


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Request")
        {
            int R_Id = Convert.ToInt32((e.Item.FindControl("hiddid") as HiddenField).Value);
            string username = (e.Item.FindControl("lblusername") as Label).Text;
            FillRequestData(R_Id, username);
            Button btn = (e.Item.FindControl("btnrequest") as Button);
           
            btn.Enabled = false;
        }
        if (e.CommandName == "ViewProfile")
        {
            int R_Id = Convert.ToInt32((e.Item.FindControl("hiddid") as HiddenField).Value);
            Response.Redirect("~/ViewProfile.aspx?R_id=" + R_Id + "");
        }
    }
    public void FillRequestData(int R_Id, string username)
    {
        DateTime dt = DateTime.Now;
        var date = dt.ToString("dd/MMMM/yyyy");
        var time = dt.ToString("hh:mm tt");
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "usp_InsertDataintoRequest_Master";
        cmd.Parameters.AddWithValue("@UserId", Session["id"].ToString());
        cmd.Parameters.AddWithValue("@Recever_Id", R_Id);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@Date", date);
        cmd.Parameters.AddWithValue("@Time", time);
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            //Response.Write("<script>alert('Data inserted Successfully')</script>");


        }

    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Button request = e.Item.FindControl("btnrequest") as Button;
            Button ViewProfile = e.Item.FindControl("btnprofile") as Button;
            HiddenField hId = e.Item.FindControl("hiddid") as HiddenField;
            int confrim = 0;
            int delete = 0;
            int equal = 0;
            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Recevier_Id = '" + hId.Value + "' or Recevier_Id = '" + Session["id"] + "' and Sender_Id = '" + hId.Value + "'");
            equal = ds.Tables[0].Rows.Count;

            if (ds.Tables[0].Rows.Count > 0)
            {
                request.Enabled = false;


            }
            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Recevier_Id = '" + hId.Value + "' and  Confrim = '" + 1 + "' or Recevier_Id = '" + Session["id"] + "' and Sender_Id = '" + hId.Value + "'and  Confrim = '" + 1 + "'");
            confrim = ds.Tables[0].Rows.Count;
            if (confrim == 1)
            {
                ViewProfile.Visible = true;
                request.Visible = false;
            }
            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Recevier_Id = '" + hId.Value + "' and  _Delete = '" + 1 + "' or Recevier_Id = '" + Session["id"] + "' and Sender_Id = '" + hId.Value + "'and  _Delete = '" + 1 + "'");
            delete = ds.Tables[0].Rows.Count;
            if (delete == equal)
            {
                ViewProfile.Visible = false;
                request.Enabled = true;
            }
        }
    }
}