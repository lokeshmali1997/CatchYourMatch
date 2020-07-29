using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ImagerLib;

public partial class rv : System.Web.UI.Page
{

    DataFunction objdf = new DataFunction();
    protected void Page_Load(object sender, EventArgs e)
    {
  
    }
    
    protected void lbtnSentRequest_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hitesh", "SentRequest()", true);
        lblSentRequest.Text = null ;
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {



        SqlParameter[] param = new SqlParameter[1];
        if (FileUpload1.HasFile)
        {
            if (checkextension(FileUpload1.FileName))
            {

                //string path = Server.MapPath("ProfileImage");
                //path = path + "\\" + FileUpload1.FileName;
                //FileUpload1.SaveAs(path);


                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                //string str = filename;
                string imgPath = "D:/Hitesh Gehlot/Shop data/photos/collage/home frnds/";

                string img = Imager.PerformImageResizeAndPutOnCanvas(imgPath, filename, 1000, 1000);


                param[0] = new SqlParameter("@profileimage", SqlDbType.VarChar);
                param[0].Value = "~\\ProfileImage\\" + filename;

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

        int result = objdf.ExecuteQuery("usp_Temp", param);

        if (result > 0)
        {
            Response.Write("<script>alert('Image upload ho gai')</script>");
        }

        //string str = DateTime.Now.ToString("hhmmssffffff") + filename;  

        //fuImage.SaveAs(Server.MapPath("ImgDir/" + str));


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