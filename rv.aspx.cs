using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rv : System.Web.UI.Page
{
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
}