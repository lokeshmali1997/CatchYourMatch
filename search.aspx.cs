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
    DataFunction objdf = new DataFunction();
    DataSet ds = new DataSet();
   
    int[] a;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("loginpage.aspx");
        }
        lblusername.Text = "Hi" + " " + Session["username"];
       
    }
    

   public void FillJobsRepeater()
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "usp_FetchUserdetailsbysearch";
        cmd.Parameters.AddWithValue("@UserId", Session["id"].ToString());
        cmd.Parameters.AddWithValue("@age", txtagemin.Text);
        cmd.Parameters.AddWithValue("@agemax",txtagemax.Text);
        cmd.Parameters.AddWithValue("@city", txtcity.Text);
        cmd.Parameters.AddWithValue("@caste", txtcaste.Text);
        cmd.Parameters.AddWithValue("@mt", txtmothertongue.Text);
        cmd.Parameters.AddWithValue("@religion", txtreligion.Text);


        SqlDataAdapter adpt = new SqlDataAdapter();
        adpt.SelectCommand = cmd;

        DataSet table = new DataSet();
        adpt.Fill(table);
        //if (table.Tables[0].Rows.Count > 0)
        //{

        //    for (int lr = 0; lr < a.Length; lr++)
        //    {
        //        if (a[lr] == Convert.ToInt32(table.Tables[0].Rows[0]["id"]))
        //        {?

        //            Response.Write("<script>alert("+ a[lr] +")</script>");
        //            Button btnrq = Repeater1.FindControl("btnrequest") as Button;
        //            btnrq.Enabled = false;
        //        }
        //    }

        //}
        Repeater1.DataSource = table;
        Repeater1.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName== "Request")
        {
            int R_Id = Convert.ToInt32((e.Item.FindControl("hiddid") as HiddenField).Value);
            string username = (e.Item.FindControl("lblname") as Label).Text;
            FillRequestData(R_Id, username);
            Button btn = (e.Item.FindControl("btnrequest") as Button);
            btn.Enabled = false;
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
            Response.Write("<script>alert('Data inserted Successfully')</script>");
            
            
        }
       
    }
    protected void lnkogout_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("loginpage.aspx");

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
            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Recevier_Id = '" + hId.Value + "' and  _Delete = '"+ 1 +"' or Recevier_Id = '" + Session["id"] + "' and Sender_Id = '" + hId.Value + "'and  _Delete = '" + 1 + "'");
            delete = ds.Tables[0].Rows.Count;
            if (delete == equal)
            {
                ViewProfile.Visible = false;
                request.Enabled = true;
            }
        }
        
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        FillJobsRepeater();
    }
}