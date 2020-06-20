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
    DataSet ds2 = new DataSet();
    DataFunction objdf = new DataFunction();
   
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
            int count = 0;

            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Confrim ='"+ 0 + "' and _Delete ='" + 0 + "'");
            ds2 = objdf.FillDsS("Select Count_1 from Count_Master where Person_Id = '" + Session["id"] + "'");
            count = Convert.ToInt32(ds2.Tables[0].Rows[0]["Count_1"].ToString());
            if (ds.Tables[0].Rows.Count> count)
            {
                count = ds.Tables[0].Rows.Count - count;
                lblSentRequest.Text = count.ToString();
                count = ds.Tables[0].Rows.Count;

                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@userid", SqlDbType.Int);
                param[0].Value = Session["id"];
                param[1] = new SqlParameter("@Count_1", SqlDbType.Int);
                param[1].Value = count;
                int result = objdf.ExecuteQuery("usp_UpdateCount1", param);
                if (result > 0)
                {
                    Response.Write("<script>alert(' sent Count 1 Updated Successfully')</script>");
                }

            }
            else
            {

                if (ds.Tables[0].Rows.Count < count)
                {
                    count = ds.Tables[0].Rows.Count;
                    //lblSentRequest.Text = null;
                    SqlParameter[] param = new SqlParameter[2];
                    param[0] = new SqlParameter("@userid", SqlDbType.Int);
                    param[0].Value = Session["id"];
                    param[1] = new SqlParameter("@Count_1", SqlDbType.Int);
                    param[1].Value = count;
                    int result = objdf.ExecuteQuery("usp_UpdateCount1", param);
                    if (result > 0)
                    {
                        Response.Write("<script>alert('sent Count 2 Updated Successfully')</script>");
                    }
                    
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
        lblAccept.Text = null;
    }

    protected void lbtnInvitation_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "Invitation()", true);
        lblInvitation.Text = null;
    }

    protected void lbtnFriends_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "Friends()", true);
        lblFriends.Text = null;
    }

    protected void lbtnDelete_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "Delete()", true);
        lbldelete.Text = null;
        
    }

    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int count = 0;

            ds = objdf.FillDsS("select * from RequestMaster where Recevier_Id = '" + Session["id"] + "' and Confrim ='" + 0 + "' and _Delete ='" + 0 + "'");
            ds2 = objdf.FillDsS("Select Count_2 from Count_Master where Person_Id = '" + Session["id"] + "'");
            count = Convert.ToInt32(ds2.Tables[0].Rows[0]["Count_2"].ToString());
            if (ds.Tables[0].Rows.Count > count)
            {
                count = ds.Tables[0].Rows.Count - count;
                lblInvitation.Text = count.ToString();
                count = ds.Tables[0].Rows.Count;

                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@userid", SqlDbType.Int);
                param[0].Value = Session["id"];
                param[1] = new SqlParameter("@Count_2", SqlDbType.Int);
                param[1].Value = count;
                int result = objdf.ExecuteQuery("usp_UpdateCount2", param);
                if (result > 0)
                {
                    Response.Write("<script>alert(' Invitaion count 1  Updated Successfully')</script>");
                }

            }
            else
            {

                if (ds.Tables[0].Rows.Count < count)
                {
                    count = ds.Tables[0].Rows.Count;
                    SqlParameter[] param = new SqlParameter[2];
                    param[0] = new SqlParameter("@userid", SqlDbType.Int);
                    param[0].Value = Session["id"];
                    param[1] = new SqlParameter("@Count_2", SqlDbType.Int);
                    param[1].Value = count;
                    int result = objdf.ExecuteQuery("usp_UpdateCount2", param);
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Invitaion count 2  Updated Successfully')</script>");
                    }

                }
            }
        }
    }

    protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int count = 0;

            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Confrim ='" + 1 + "' and _Delete ='" + 0 + "'");
            ds2 = objdf.FillDsS("Select Count_3 from Count_Master where Person_Id = '" + Session["id"] + "'");
            count = Convert.ToInt32(ds2.Tables[0].Rows[0]["Count_3"].ToString());
            if (ds.Tables[0].Rows.Count > count)
            {
                count = ds.Tables[0].Rows.Count - count;
                lblAccept.Text = count.ToString();
                count = ds.Tables[0].Rows.Count;

                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@userid", SqlDbType.Int);
                param[0].Value = Session["id"];
                param[1] = new SqlParameter("@Count_3", SqlDbType.Int);
                param[1].Value = count;
                int result = objdf.ExecuteQuery("usp_UpdateCount3", param);
                if (result > 0)
                {
                    Response.Write("<script>alert(' Accept count 1  Updated Successfully')</script>");
                }

            }
            else
            {

                if (ds.Tables[0].Rows.Count < count)
                {
                    count = ds.Tables[0].Rows.Count;
                    SqlParameter[] param = new SqlParameter[2];
                    param[0] = new SqlParameter("@userid", SqlDbType.Int);
                    param[0].Value = Session["id"];
                    param[1] = new SqlParameter("@Count_3", SqlDbType.Int);
                    param[1].Value = count;
                    int result = objdf.ExecuteQuery("usp_UpdateCount3", param);
                    if (result > 0)
                    {
                        Response.Write("<script>alert(' Accept count 2  Updated Successfully')</script>");
                    }

                }
            }
        }
    }

    protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int count = 0;

            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Confrim ='" + 0 + "' and _Delete ='" + 1 + "'");
            ds2 = objdf.FillDsS("Select Count_5 from Count_Master where Person_Id = '" + Session["id"] + "'");
            count = Convert.ToInt32(ds2.Tables[0].Rows[0]["Count_5"].ToString());
            if (ds.Tables[0].Rows.Count > count)
            {
                count = ds.Tables[0].Rows.Count - count;
                lbldelete.Text = count.ToString();
                count = ds.Tables[0].Rows.Count;

                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@userid", SqlDbType.Int);
                param[0].Value = Session["id"];
                param[1] = new SqlParameter("@Count_5", SqlDbType.Int);
                param[1].Value = count;
                int result = objdf.ExecuteQuery("usp_UpdateCount5", param);
                if (result > 0)
                {
                    Response.Write("<script>alert(' delete count 1  Updated Successfully')</script>");
                }

            }
            else
            {

                if (ds.Tables[0].Rows.Count < count)
                {
                    count = ds.Tables[0].Rows.Count;
                    SqlParameter[] param = new SqlParameter[2];
                    param[0] = new SqlParameter("@userid", SqlDbType.Int);
                    param[0].Value = Session["id"];
                    param[1] = new SqlParameter("@Count_5", SqlDbType.Int);
                    param[1].Value = count;
                    int result = objdf.ExecuteQuery("usp_UpdateCount5", param);
                    if (result > 0)
                    {
                        Response.Write("<script>alert(' delete count 2  Updated Successfully')</script>");
                    }

                }
            }
        }
    }

    protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int count = 0;

            ds = objdf.FillDsS("select * from RequestMaster where Sender_Id = '" + Session["id"] + "' and Confrim ='" + 1 + "' and _Delete ='" + 0 + "' or Recevier_Id = '" + Session["id"] + "' and Confrim ='" + 1 + "' and _Delete ='" + 0 + "' ");
            ds2 = objdf.FillDsS("Select Count_4 from Count_Master where Person_Id = '" + Session["id"] + "'");
            count = Convert.ToInt32(ds2.Tables[0].Rows[0]["Count_4"].ToString());
            if (ds.Tables[0].Rows.Count > count)
            {
                count = ds.Tables[0].Rows.Count - count;
                lblFriends.Text = count.ToString();
                count = ds.Tables[0].Rows.Count;

                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@userid", SqlDbType.Int);
                param[0].Value = Session["id"];
                param[1] = new SqlParameter("@Count_4", SqlDbType.Int);
                param[1].Value = count;
                int result = objdf.ExecuteQuery("usp_UpdateCount4", param);
                if (result > 0)
                {
                    Response.Write("<script>alert(' Friends count 1  Updated Successfully')</script>");
                }

            }
            else
            {

                if (ds.Tables[0].Rows.Count < count)
                {
                    count = ds.Tables[0].Rows.Count;
                    SqlParameter[] param = new SqlParameter[2];
                    param[0] = new SqlParameter("@userid", SqlDbType.Int);
                    param[0].Value = Session["id"];
                    param[1] = new SqlParameter("@Count_4", SqlDbType.Int);
                    param[1].Value = count;
                    int result = objdf.ExecuteQuery("usp_UpdateCount4", param);
                    if (result > 0)
                    {
                        Response.Write("<script>alert(' Friends count 2  Updated Successfully')</script>");
                    }

                }
            }
        }
    }
}