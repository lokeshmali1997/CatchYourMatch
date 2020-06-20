<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

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


</style>
   
</head>
<body>
    <form id="form2" runat="server">
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
      <li><a href="search.aspx">Search</a></li>
      <li><a href="Inbox.aspx">Inbox</a></li>
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
            <div class="row" style="background:#ddd;"><h3> About</h3></div>
       v<div class="row" style="background:#ddd;margin-top:80px;text-align:center"><h3> About</h3></div>
             <div class="row" style="z-index:-1; height:700px;padding:0px;background:;margin-top:50px;">
            <div class="row" style="background:#ededed;padding:20px"> 
            <div class="col-md-4">
                 <asp:Image ID="Image1" runat="server" ImageUrl="~/img/c.jpg" style="height:200px;width:100%" />
             </div>
             <div class ="col-md-8">
                 <h3>Free Matrimonial Site</h3>
               <p style="font-size:18px;">
                   Welcome to CatchYourMatch.com, the first matrimonial site to offer a scientific approach to finding a compatible Life Partner. Exclusive to CatchYourMatch.com, our personality matching system will help ensure that your marriage is lasting and fulfilling. Established in 2019 and with thousands of registered members, we are the most experienced free marriage bureau operating today. Include us in your journey.
               </p>
                                         
             </div>
            </div> 
           
            <div class="row" style="background:#ededed;padding:20px;margin-top:15px;"> 
            
                <div class ="col-md-8">
                 <h3>No Payments Required</h3>

                                   <p style="font-size:18px;">
                  That's right, there are no fees, charges or payments required to use CatchYourMatch.com. Other matrimonial sites promise you a free sign up but then charge you to contact their members; CatchYourMatch.com allows you to communicate with as many prospects as you like, whenever you like, free of charge. Now that India has a premium, no cost matrimony service that is available to everyone, you no longer have an excuse to be single </p>
                                         
             </div>

                <div class="col-md-4">
                 <asp:Image ID="Image2" runat="server" ImageUrl="~/img/i.jpg" style="height:200px;width:100%" />
             </div>
             
            </div>

            <div class="row" style="background:#ededed;padding:20px;margin-top:15px;"> 
            <div class="col-md-4">
                 <asp:Image ID="Image3" runat="server" ImageUrl="~/img/d.jpg" style="height:200px;width:100%" />
             </div>
             <div class ="col-md-8">
                 <h3>Success Story</h3>
               <p style="font-size:18px;">
            My name is Khusi and my husband's name is Paresh Geghlot. I am now Khushi Gehlot thanks to the team at CatchYourMatch. I found Paresh on your matrimony site a month after I had created my profile. We began talking and organised a meeting with our families. We married here in Rajsthan one months later. God bless you and thank you very much CatchYourMatch.</p>
                                         
             </div>
            </div> 

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
