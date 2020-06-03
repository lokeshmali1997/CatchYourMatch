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

public partial class index : System.Web.UI.Page
{
    DataFunction objdf = new DataFunction();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDataddl();
        }
    }

    public void FillDataddl()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from Country");

        ddlcountry.DataSource = ds;
        ddlcountry.DataTextField = "country";
        ddlcountry.DataValueField = "id";
        ddlcountry.DataBind();

        ddlcountry.Items.Insert(0, new ListItem("Select Country*", "0"));
        ddlstate.Items.Insert(0, new ListItem("Select State*", "0"));
        ddlcity.Items.Insert(0, new ListItem("Select City*", "0"));
        
        FillGender();
        ddlgender.Items.Insert(0, new ListItem("Select Gender*", "0"));
        FillMotherTongue();
        ddlmothertongue.Items.Insert(0, new ListItem("Select MotherTongue*", "0"));
        FillReligion();
        ddlreligion.Items.Insert(0, new ListItem("Select Religion*", "0"));
        FillProfileFor();
        ddlprofilefor.Items.Insert(0, new ListItem("Select ProfileFor*", "0"));
    }

    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataFunction objdf = new DataFunction();

        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from StateMaster where countryid=" + ddlcountry.SelectedIndex);



        ddlstate.DataSource = ds;

        ddlstate.DataTextField = "state";
        ddlstate.DataValueField = "id";

        ddlstate.DataBind();

        ddlstate.Items.Insert(0, new ListItem("Select State*", "0"));


    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from CityMaster where stateid =" + ddlstate.SelectedValue);

        ddlcity.DataSource = ds;

        ddlcity.DataTextField = "city";
        ddlcity.DataValueField = "id";
        ddlcity.DataBind();
        ddlcity.Items.Insert(0, new ListItem("Select City*", "0"));

       
    }

    public void FillGender()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from Gender");

        ddlgender.DataSource = ds;
        ddlgender.DataTextField = "gender";
        ddlgender.DataValueField = "id";
        ddlgender.DataBind(); 
    }

    public void FillMotherTongue()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from MotherTongue");

        ddlmothertongue.DataSource = ds;
        ddlmothertongue.DataTextField = "mothertongue";
        ddlmothertongue.DataValueField = "id";
        ddlmothertongue.DataBind();
    }

    public void FillReligion()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from Religion");

        ddlreligion.DataSource = ds;
        ddlreligion.DataTextField = "religion";
        ddlreligion.DataValueField = "id";
        ddlreligion.DataBind();
    }
    
    public void FillProfileFor()
    {
        DataFunction objdf = new DataFunction();
        DataSet ds = new DataSet();

        ds = objdf.FillDsS("select * from ProfileFor");

        ddlprofilefor.DataSource = ds;
        ddlprofilefor.DataTextField = "profilefor";
        ddlprofilefor.DataValueField = "id";
        ddlprofilefor.DataBind();
    }




    protected void btnsignup_Click(object sender, EventArgs e)
    {

        

        string name = txtusernname.Text;
        string email = txtsignemail.Text;
        string pass = txtsignpass.Text;
        string date  = txtdate.Text;
        int gender = Int32.Parse(ddlgender.SelectedValue);
        int mothertongue = Int32.Parse(ddlmothertongue.SelectedValue);
        int religion = Int32.Parse(ddlreligion.SelectedValue);
        string caste = txtcaste.Text; 
        int country = Int32.Parse(ddlcountry.SelectedValue);
        int state = Int32.Parse(ddlstate.SelectedValue);
        int city = Int32.Parse(ddlcity.SelectedValue);
        string number = txtsignnumber.Text;
        int profile = Int32.Parse(ddlprofilefor.SelectedValue);

        Response.Redirect("savedetails.aspx?name=" + name + "&email=" + email + "&pass=" + pass + "&dob=" + date
            + "&gender=" + gender + "&mother=" + mothertongue + "&religion=" + religion + "&caste=" + caste + "&country=" + country
            + "&state=" + state + "&city=" + city + "&number=" + number + "&profile=" + profile);




    }
}