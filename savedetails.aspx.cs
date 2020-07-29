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
using ImagerLib;

public partial class savedetails : System.Web.UI.Page
{
    DataFunction objdf = new DataFunction();
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!IsPostBack)
        {
                   lblname.Text = Request.QueryString["name"];
                   lblemail.Text = Request.QueryString["email"];
            lblpass.Text = Request.QueryString["pass"];
            lbldob.Text = Request.QueryString["dob"];
            lblgender.Text = Request.QueryString["gender"];
            lblmothert.Text = Request.QueryString["mother"];
            lblreligion.Text = Request.QueryString["religion"];
            lblcaste.Text = Request.QueryString["caste"];
            lblcountry.Text = Request.QueryString["country"];
            lblstate.Text = Request.QueryString["state"];
            lblcity.Text = Request.QueryString["city"];
            lblnumber.Text = Request.QueryString["number"];
            lblprofile.Text = Request.QueryString["profile"];

            FilllLiving();
            FillMarital();
            FillFamily();
            FillHeight();
            FillDeit();
            FillHobbies();
            FillPhysical();
            FillEmployeein();

        }


        

    }


    public void FilllLiving()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from LivingStatus");

        ddlfamily.DataSource = ds;
        ddlfamily.DataTextField = "livingstatus";
        ddlfamily.DataValueField = "id";
        ddlfamily.DataBind();
        ddlfamily.Items.Insert(0, new ListItem("You live with youe family?", "0"));
    }

    public void FillMarital()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from MaritalStatus");

        ddlmaritalstatus.DataSource = ds;
        ddlmaritalstatus.DataTextField = "maritalstatus";
        ddlmaritalstatus.DataValueField = "id";
        ddlmaritalstatus.DataBind();
        ddlmaritalstatus.Items.Insert(0, new ListItem("Marital Status*", "0"));
    }

    public void FillFamily()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from FamilyStatus");

         ddlfamilystatus.DataSource = ds;
        ddlfamilystatus.DataTextField = "familystatus";
        ddlfamilystatus.DataValueField = "id";
        ddlfamilystatus.DataBind();
        ddlfamilystatus.Items.Insert(0, new ListItem("Family Status*", "0"));
    }

    public void FillHeight()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from Height");

        ddlheight.DataSource = ds;
        ddlheight.DataTextField = "height";
        ddlheight.DataValueField = "id";
        ddlheight.DataBind();
        ddlheight.Items.Insert(0, new ListItem("Height*", "0"));
    }
    public void FillDeit()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from Deit");

        ddldeit.DataSource = ds;
        ddldeit.DataTextField = "deit";
        ddldeit.DataValueField = "id";
        ddldeit.DataBind();
        ddldeit.Items.Insert(0, new ListItem("Deit*", "0"));
    }
    public void FillHobbies()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from Hobbies");

        ddldrinking.DataSource = ds;
        ddldrinking.DataTextField = "hobbies";
        ddldrinking.DataValueField = "id";
        ddldrinking.DataBind();
        ddldrinking.Items.Insert(0, new ListItem("Drinking / Smoking*", "0"));
    }
    public void FillPhysical()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from PhysicalStatus");

        ddlphysicalstatus.DataSource = ds;
        ddlphysicalstatus.DataTextField = "physicalstatus";
        ddlphysicalstatus.DataValueField = "id";
        ddlphysicalstatus.DataBind();
        ddlphysicalstatus.Items.Insert(0, new ListItem("Physical Status*", "0"));
    }
    public void FillEmployeein()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from EmployeeIn");

        ddlemployee.DataSource = ds;
        ddlemployee.DataTextField = "employeein";
        ddlemployee.DataValueField = "id";
        ddlemployee.DataBind();
        ddlemployee.Items.Insert(0, new ListItem("Employee In*", "0"));
    }

    protected void btnsavedetails_Click(object sender, EventArgs e)
    {



        SqlParameter[] param = new SqlParameter[27];

        param[0] = new SqlParameter("@username", SqlDbType.VarChar);
        param[0].Value = lblname.Text;

        param[1] = new SqlParameter("@useremail", SqlDbType.VarChar);
        param[1].Value = lblemail.Text;

        param[2] = new SqlParameter("@userpass", SqlDbType.VarChar);
        param[2].Value = lblpass.Text;

        param[3] = new SqlParameter("@dob", SqlDbType.VarChar);
        param[3].Value = lbldob.Text;

        param[4] = new SqlParameter("@gender", SqlDbType.Int);
        param[4].Value = lblgender.Text;

        param[5] = new SqlParameter("@mothertongue", SqlDbType.Int);
        param[5].Value = lblmothert.Text;

        param[6] = new SqlParameter("@religion", SqlDbType.Int);
        param[6].Value = lblreligion.Text;

        param[7] = new SqlParameter("@caste", SqlDbType.VarChar);
        param[7].Value = lblcaste.Text;

        param[8] = new SqlParameter("@country", SqlDbType.Int);
        param[8].Value = lblcountry.Text;

        param[9] = new SqlParameter("@state", SqlDbType.Int);
        param[9].Value = lblstate.Text;

        param[10] = new SqlParameter("@city", SqlDbType.Int);
        param[10].Value = lblcity.Text;

        param[11] = new SqlParameter("@usernumber", SqlDbType.BigInt);
        param[11].Value = lblnumber.Text;

        param[12] = new SqlParameter("@profile", SqlDbType.Int);
        param[12].Value = lblprofile.Text;

        param[13] = new SqlParameter("@livingstatus", SqlDbType.Int);
        param[13].Value = ddlfamily.SelectedValue;

        param[14] = new SqlParameter("@maritalstatus", SqlDbType.Int);
        param[14].Value = ddlmaritalstatus.SelectedValue;

        param[15] = new SqlParameter("@familystatus", SqlDbType.Int);
        param[15].Value = ddlfamilystatus.SelectedValue;

        param[16] = new SqlParameter("@height", SqlDbType.Int);
        param[16].Value = ddlheight.SelectedValue;

        param[17] = new SqlParameter("@age", SqlDbType.Int);
        param[17].Value = txtage.Text;

        param[18] = new SqlParameter("@deit", SqlDbType.Int);
        param[18].Value = ddldeit.SelectedValue;

        param[19] = new SqlParameter("@hobbies", SqlDbType.Int);
        param[19].Value = ddldrinking.SelectedValue;

        param[20] = new SqlParameter("@physicalstatus", SqlDbType.Int);
        param[20].Value = ddlphysicalstatus.SelectedValue;

        param[21] = new SqlParameter("@education", SqlDbType.VarChar);
        param[21].Value = txteducation.Text;

        param[22] = new SqlParameter("@employeein", SqlDbType.Int);
        param[22].Value = ddlemployee.SelectedValue;

        param[23] = new SqlParameter("@occupation", SqlDbType.VarChar);
        param[23].Value = txtoccupation.Text;

        param[24] = new SqlParameter("@income", SqlDbType.BigInt);
        param[24].Value = txtincome.Text;

        if (FileUpload1.HasFile)
        {
            if (checkextension(FileUpload1.FileName))
            {
                //if (FileUpload1.PostedFile.ContentLength < 1000000)
                //{
                //    string path = Server.MapPath("ProfileImage");
                //    path = path + "\\" + FileUpload1.FileName;

                //    FileUpload1.SaveAs(path);
                //    param[25] = new SqlParameter("@profileimage", SqlDbType.VarChar);
                //    param[25].Value = "~\\ProfileImage\\" + FileUpload1.FileName;
                //}
                //else
                //{
                //    Response.Write("<script>alert('Image Size Minimum 1MB Only ')</script>");
                //}

                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);

                string imgPath = "D:/img/";

                string img = Imager.PerformImageResizeAndPutOnCanvas(imgPath, filename, 1500, 1500);
                param[25] = new SqlParameter("@profileimage", SqlDbType.VarChar);
                param[25].Value = "~\\ProfileImage\\" + filename;
            }
            else
            {
                Response.Write("<script>alert('Image Extension Not Valid ')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Image Not Found ')</script>");
        }


        param[26] = new SqlParameter("@aboutyourself", SqlDbType.VarChar);
                    param[26].Value = txtabout.Text;


        int result = objdf.ExecuteQuery("usp_insert_usermaster", param);


        if (result > 0)
        {
            Response.Write("<script>alert('Registeration Successfilly')</script>");
            Response.Redirect("emailverify.aspx?eid=" + lblemail.Text);
            //Response.Redirect("savedetails.aspx");
        }
        else
        {
            Response.Write("<script>alert('Registeration Not Successfilly!! Try Again')</script>");
        }

      

    }


  

    private bool checkextension(string filename)
    {

        string ex = Path.GetExtension(filename).ToLower();
        switch (ex)
        {
            case ".jpg": return true;
            case ".jpeg": return true;
            case ".png": return true;
            default: return false;



        }


    }
}