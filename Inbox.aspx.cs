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

public partial class Inbox : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataFunction objdf = new DataFunction();
    DataSet ds2 = new DataSet();
    static int count;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
            if (Session["username"] == null)
            {
                    Response.Redirect("loginpage.aspx");
            }
            
            
            lblusername.Text = "Hi" + " " + Session["username"];
            FetchingSentRequestDetails();
            FetchingInvitationRequestDetails();
            FetchingAcceptedRequestDetails();
            FetchingFriendsDetails();
            FetchingDeletedRequestDetails();

        }
    }
    public void FetchingSentRequestDetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];
        ds = objdf.FillDsParam("usp_FetchRequestDetails", param);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    a = new int[ds.Tables[0].Rows.Count];
        //    for (int loopcounter = 0; loopcounter < ds.Tables[0].Rows.Count; loopcounter++)
        //    {

        //        a[loopcounter] = Convert.ToInt32(ds.Tables[0].Rows[loopcounter]["Recevier_Id"]);
        //    }
        //    for (int loopcounter = 0; loopcounter < a.Length; loopcounter++)
        //    {

        //        Response.Write("<script>alert(" + a[loopcounter] + ")</script>");
        //    }

        //}
    }
    public void FetchingInvitationRequestDetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];
        ds = objdf.FillDsParam("usp_FetchInvitationDetails", param);
        Repeater2.DataSource = ds;
        Repeater2.DataBind();
       
    }
    public void FetchingAcceptedRequestDetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];
        ds = objdf.FillDsParam("usp_FetchAcceptedDetails", param);
        Repeater3.DataSource = ds;
        Repeater3.DataBind();
    }
    public void FetchingFriendsDetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];
        ds = objdf.FillDsParam("usp_FetchFriendsdDetails", param);
        Repeater4.DataSource = ds;
        Repeater4.DataBind();

    }
    public void FetchingDeletedRequestDetails()
    {

        SqlParameter[] param = new SqlParameter[1];

        param[0] = new SqlParameter("@userid", SqlDbType.Int);
        param[0].Value = Session["id"];
        ds = objdf.FillDsParam("usp_FetchDeletedDetails", param);
        Repeater5.DataSource = ds;
        Repeater5.DataBind();
    }

    protected void lnkogout_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("loginpage.aspx");
    }

    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Confirm")
        {
            int Sender_Id = Convert.ToInt32((e.Item.FindControl("hiddid") as HiddenField).Value);
            InsertConfirmDetails(Sender_Id);
        }
        if (e.CommandName == "Delete")
        {
            int Sender_Id = Convert.ToInt32((e.Item.FindControl("hiddid") as HiddenField).Value);
            DeleteRequestDetails(Sender_Id);
        }
    }
    public void InsertConfirmDetails(int Sender_Id)
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
        cmd.CommandText = "usp_InsertConfirmIntoRequest_Master";
        cmd.Parameters.AddWithValue("@UserId", Session["id"].ToString());
        cmd.Parameters.AddWithValue("@Sender_Id", Sender_Id);
        cmd.Parameters.AddWithValue("@Date", date);
        cmd.Parameters.AddWithValue("@Time", time);
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            Response.Write("<script>alert('Data inserted Successfully')</script>");

        }
        Response.Redirect(Request.RawUrl);
    }
    public void DeleteRequestDetails(int Sender_Id)
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
        cmd.CommandText = "usp_DeleteFromRequest_Master";
        cmd.Parameters.AddWithValue("@UserId", Session["id"].ToString());
        cmd.Parameters.AddWithValue("@Sender_Id", Sender_Id);
        cmd.Parameters.AddWithValue("@Date", date);
        cmd.Parameters.AddWithValue("@Time", time);
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            Response.Write("<script>alert('Data inserted Successfully')</script>");

        }
        Response.Redirect(Request.RawUrl);
    }


    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Confrim ='"+ 0 + "' and _Delete ='" + 0 + "'");

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblSentRequest.Text = null;
                count = ds.Tables[0].Rows.Count;

            }
            else
            {

                if (ds.Tables[0].Rows.Count > count)
                {
                    int i = 0, j = 0, k = 0;
                    i = ds.Tables[0].Rows.Count;
                    j = count;
                    k = i - j;
                    lblSentRequest.Text = k.ToString();
                    count += k;
                }
            }
        }
    }

    protected void lbtnSentRequest_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "SentRequest()", true);
        lblSentRequest.Text = null;
    }

    protected void lbtnAcceptRequest_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "AcceptRequest()", true);
    }

    protected void lbtnInvitation_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "Invitation()", true);
    }

    protected void lbtnFriends_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "Friends()", true);
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "Delete()", true);
        
    }
}