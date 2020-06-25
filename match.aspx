<%@ Page Language="C#" AutoEventWireup="true" CodeFile="match.aspx.cs" Inherits="match" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
    <style>
        .row{
            margin:0px;
        }



.navbar{
    height:100px;
    background:#8e44ad;
}
.navbar-nav{
    margin-top:10px;
    margin-left:0em;
    
}
.navbar-header{
    margin-top:20px;

}
.navbar-nav  li a {
   // margin-left:50px;
   padding:30px;
    color:#ddd;
    font-size:16px;
}
.navbar-nav  li a:hover{
    background:none;
    
}
.navbar-nav  li a:focus{
    background:none;
    color:#fff;
    
}
.dropdown{
    background:none; 
    margin-top:2em;
}
.dropdown a{
   
    color:#ddd;
    text-decoration:none;
   
}
.dropdown a .caret{
   
    color:#fff;
}
.dropdown .dropdown-menu a {
   padding:10px 20px;
   
}
.repeater{
    height:220px;
    margin-top:30px;
    box-shadow:1px 0px 5px #ddd;
}
.repeater ul{
    list-style-type:none;
    padding:20px;
}
.repeater ul li{
   
    padding:5px;
}
</style>
   
</head>
    <body>
    <form id="form1" runat="server">
        <div class="container-fluid">
        <asp:Label ID="txtid" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <nav class="navbar navbar-defualt  navbar-fixed-top">
  <div class="col-md-3">
            
    <div class="navbar-header">
      <img src="logoimg/logo3.png" width="80%" height="60" />
    </div>
</div>
            <div class="col-md-7">
    <ul class="nav navbar-nav">
      <li ><a href="home.aspx">Home</a></li>
      <li class="active"><a href="match.aspx">Match</a></li>
      <li><a href="search.aspx">Search</a></li>
      <li><a href="Inbox.aspx">Inbox</a></li>
      <li><a href="about.aspx">About</a></li>
      <li><a href="contact.aspx">Contact</a></li>
  
        
         </ul>
     
 </div>
            <div class="col-md-2" style="">
           
           <div  class="dropdown" ><a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <img src="img/usericon1.png" style="border-radius:50%;height:30px;width:30px;" /><asp:Label ID="lblusername" runat="server" Text="loky kumar"></asp:Label><span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="myprofile.aspx">My Profile</a></li>
          
          <li><asp:LinkButton ID="lnkogout" runat="server" OnClick="lnkogout_Click" >Logout</asp:LinkButton></li>
        </ul>
      </div>
              
            </div>

</nav>
      </div> 
        <div class="row" style="z-index:-1; height:700px;padding:0px;background:;margin-top:150px;">
             <div class="col-md-2"></div>
             <div class="col-md-8">

                 <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                     <ItemTemplate>
                  <div class="row repeater">
                       <div class="col-md-4">
                        
                           <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("profileimage") %>' style="width:150px; height:150px;padding:10px;" />
                            <ul>
                               <li>
                                   <b><asp:Label ID="lblusername" runat="server" Text='<%# Bind("username") %>' style="text-align:center;font-family:'Times New Roman', Times, serif;font-size:20px"></asp:Label></b>
                                   <asp:HiddenField ID="hiddid" runat="server" Value='<%# Bind("id")%>' />
                               </li>
                           </ul>
                       </div>
                       <div class="col-md-4">
                           
                           <ul>
                            <li><asp:Label ID="rpage" runat="server" Text='<%# Bind("age") %>' ></asp:Label>Years,
                                <asp:Label ID="rpheight" runat="server" Text= '<%# Bind("height") %>' ></asp:Label>
                            </li>
                           <li><asp:Label ID="rpcity" runat="server" Text='<%# Bind("city") %>'></asp:Label></li>
                             <li><asp:Label ID="rpreligion" runat="server" Text='<%# Bind("religion") %>'></asp:Label>
                                <asp:Label ID="rpcaste" runat="server" Text='<%# Bind("caste") %>'></asp:Label>
                            </li>
                           <li><asp:Label ID="rplang" runat="server" Text='<%# Bind("mothertongue") %>'></asp:Label></li>
                           </ul>
                       </div>
                      <div class="col-md-2">
                           <ul>
                            <li><asp:Label ID="rpeducation" runat="server" Text='<%# Bind("heighesteducation") %>'></asp:Label></li>
                           <li><asp:Label ID="rpoccupation" runat="server" Text='<%# Bind("occupation") %>'></asp:Label>
                           </li>
                             <li><asp:Label ID="rpincome" runat="server" Text='<%# Bind("annualincome") %>'></asp:Label></li>
                              <li>  <asp:Label ID="rpmarital" runat="server" Text='<%# Bind("maritalstatus") %>'></asp:Label>
                            </li>
                           
                           </ul>
                      </div>
                      <div class="col-md-2" style="margin-top:45px;">
                           <asp:Button ID="btnrequest" runat="server" class="btn" Text="Request" CommandName="Request" style="width:90px;height:32px;font-size:15px; background-color:#972cc3;color:white;"/>
                           <asp:Button ID="btnprofile" runat="server" class="btn" Text="View Profile" CommandName="ViewProfile" style="width:90px;height:32px;font-size:12px;background-color:#972cc3; color:white;" Visible="false" />
                      </div>
                  </div>
                        </ItemTemplate>
                     </asp:Repeater>
             </div>
             <div class="col-md-2"></div>
        </div>
        
</div>

        <div class="row" style="background:#ddd;margin-top:50px">
           <div class="col-md-3" ></div>
            <div class="col-md-6" ><p style="text-align:center;margin-top:0px">All rights reserved &copy;CatchYourMatch.com</p></div>
            <div class="col-md-3" ></div>
        </div>

    </form>
</body>
</html>
