<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

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
.form-control{
    outline:none;

}
.form-group > .form-control:focus{
    outline:none;
}

.navbar{
    height:100px;
    background:#8e44ad;
}
.navbar-nav{
    margin-top:20px;
    margin-left:0em;
    
}
.navbar-header{
    margin-top:20px;

}
.navbar-nav  li a {
    margin-left:50px;
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

.txtbox{
    width:80%;
    height:30px;
    border:none;
    border-bottom:1px solid #ddd;
    outline:none;
    padding:10px;
    font-size:14px;
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
      <li><a href="match.aspx">Match</a></li>
      <li class="active"><a href="search.aspx">Search</a></li>
      <li><a href="about.aspx">About</a></li>
      <li><a href="contact.aspx">Contact</a></li>
  
        
         </ul>
     
 </div>
            <div class="col-md-2" style="">
           
           <div  class="dropdown" ><a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <img src="img/usericon1.png" style="border-radius:50%;height:30px;width:30px;" /><asp:Label ID="lblusername" runat="server" Text=""></asp:Label><span class="caret"></span></a>
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
             <div class ="col-md-8">
                 <div class="row" style="margin-top:20px;">
                 <div class="col-md-3" style="text-align:right;">Age :</div>
            <div class="form-group col-md-4">
          <asp:TextBox ID="txtagemin" class="form-control" runat="server" placeholder="Enter email"></asp:TextBox>
         </div>
                  <div class="col-md-1">To</div>

    <div class="form-group col-md-4">
     
      <asp:TextBox ID="txtagemax" class="form-control" runat="server" placeholder="Enter email"></asp:TextBox>
    </div>
                 <div class="col-md-2"></div>
                     </div>
                 
                     <div class="row" style="margin-top:20px;">
                 <div class="col-md-3" style="text-align:right;">Religion</div>
            <div class="form-group col-md-9">
          <asp:TextBox ID="txtreligion" class="form-control" runat="server" placeholder="Enter email"></asp:TextBox>
         </div>
                 <div class="col-md-2"></div>
                     </div>
                         <div class="row" style="margin-top:20px;">
                 <div class="col-md-3" style="text-align:right;">Caste</div>
            <div class="form-group col-md-9">
          <asp:TextBox ID="txtcaste" class="form-control" runat="server" placeholder="Enter email"></asp:TextBox>
         </div>
                 <div class="col-md-2"></div>
                     </div>
                         <div class="row" style="margin-top:20px;">
                 <div class="col-md-3" style="text-align:right;">Mother Tongue :</div>
            <div class="form-group col-md-9">
          <asp:TextBox ID="txtmothertongue" class="form-control" runat="server" placeholder="Enter email"></asp:TextBox>
         </div>
                 <div class="col-md-2"></div>
                     </div>
                         <div class="row" style="margin-top:20px;">
                 <div class="col-md-3" style="text-align:right;">City :</div>
            <div class="form-group col-md-9">
          <asp:TextBox ID="txtcity" class="form-control" runat="server" placeholder="Enter email"></asp:TextBox>
         </div>
                 <div class="col-md-2"></div>
                     </div>
                         <div class="row" style="margin-top:20px;">
                 <div class="col-md-6" ></div>
            <div class="form-group col-md-1">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" OnClick="Button1_Click" Text="Search" />
         </div>
                 <div class="col-md-5"></div>
                     </div>
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
