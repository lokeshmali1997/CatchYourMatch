    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<!DOCTYPE html>

<head runat="server">
    <title></title>
   
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
       
        /*Navigation bar css*/
        .row {
            margin: 0px;
        }
        .navbar {
            height: 100px;
            background: #8e44ad;
        }
        .navbar-nav {
            margin-top: 20px;
            margin-left: 0em;
        }
        .navbar-header {
            margin-top: 20px;
        }
        .navbar-nav li a {
            margin-left: 50px;
            color: #ddd;
            font-size: 16px;
        }
        .navbar-nav li a:hover {
                background: none;
        }
        .navbar-nav li a:focus {
                background: none;
                color: #fff;
        }
       

       
        /*User Profile module css*/
        .emp-profile {
            padding: 3%;
            margin-top: 3%;
            margin-bottom: 3%;
            border-radius: 0.5rem;
            background: #fff;
        }
        .profile-img {
            text-align: center;
        }
        .profile-img img {
                width: 70%;
                height: 100%;
        }
        .profile-img .file {
                position: relative;
                overflow: hidden;
                margin-top: -20%;
                width: 70%;
                border: none;
                border-radius: 0;
                font-size: 15px;
                background: #212529b8;
        }
        .profile-img .file input {
                    position: absolute;
                    opacity: 0;
                    right: 0;
                    top: 0;
        }
        .profile-head h5 {
            color: #333;
        }
        .profile-head h6 {
            color: #0062cc;
        }
        .profile-edit-btn {
            border: none;
            border-radius: 1.5rem;
            width: 70%;
            padding: 2%;
            font-weight: 600;
            color: #6c757d;
            cursor: pointer;
        }
        .proile-rating {
            font-size: 12px;
            color: #818182;
            margin-top: 5%;
        }
        .proile-rating span {
                color: #495057;
                font-size: 15px;
                font-weight: 600;
        }
        .profile-head .nav-tabs {
            margin-bottom: 5%;
        }
        .profile-head .nav-tabs .nav-link {
                font-weight: 600;
                border: none;
        }
        .profile-head .nav-tabs .nav-link.active {
                    border: none;
                    border-bottom: 2px solid #0062cc;
        }
        .profile-work {
            padding: 14%;
            margin-top: -15%;
        }
        .profile-work p {
                font-size: 12px;
                color: #818182;
                font-weight: 600;
                margin-top: 10%;
        }
        .profile-work a {
                text-decoration: none;
                color: #000000;
                font-size: 14px;
        }
        .profile-work ul {
                list-style: none;
        }

        .profile-tab label {
            font-weight: 600;
        }
        .profile-tab p {
            font-weight: 600;
            color: #0062cc;
        }
        .tab-content p {
            font-weight:700;
        }
        .tab-content label {    
            font-weight:500;
        }

        .modal-header {
           border-bottom:none;
        }
        .modal-footer {
            border-top:none;
        }
        .modal-dialog {
            width: 1000px;
        }
        hr{
            margin-top:0px;
        }
        

       

.header{
    text-align:center;
}

.header i{
    color: #a6f;
    font-size: 30px;
}

.header h2{
    color: #a6f;
    font-size: 30px;
    text-transform: uppercase;
}

.header p{
    color: #333;
    font-size: 18px;
}

.header p a{
    color: #a6f;
}

.form-group {
    position: relative;
    
}

.login-form {
        margin: 30px auto;
}

.form-label {
    position: absolute;
    left: 0;
    top: 10px;
    color: #999;
    background-color: #fff;
    z-index: 10;
    transition: font-size 150ms ease-out, -webkit-transform 150ms ease-out;
    transition: transform 150ms ease-out, font-size 150ms ease-out;
    transition: transform 150ms ease-out, font-size 150ms ease-out, -webkit-transform 150ms ease-out;
    border-bottom-color:forestgreen;

}

.form-input {
    position: relative;
    padding: 12px 0px 5px 0;
    width: 100%;
    outline: 0;
    border: 0;
    box-shadow: 0 1px 0 0 #818182;
    transition: box-shadow 150ms ease-out;
}
        .btn{
            color: #fff;
            background-color: #972cc3;
            border-color: #972cc3;
        }
        .btn:hover{
            color: #fff;
            background-color: #972cc3;
            border-color: #972cc3;
        }    
         
      
    </style>
    <script>
        function userValid() {
            var name, email, contact, status;
            name = document.getElementById("txtname").value;
            email = document.getElementById("txtemail").value;
            contact = document.getElementById("txtcontact").value;
            status = document.getElementById("txtMS").value;
            var valid = /^[A-Za-z]+$/;
            

            if (name != "") {
                if (valid.test(name) == true) {
                    document.getElementById('lblNameError').innerHTML = "";
                    if (email != "") {
                        if (validEmail()) {
                            document.getElementById('lblEmailError').innerHTML = "";
                            if (contact != "") {
                                if (!isNaN(contact)) {
                                    document.getElementById('lblcontactError').innerHTML = "";
                                    if (status != "") {
                                        if (isNaN(status)) {
                                            document.getElementById('lblStatusError').innerHTML = "";
                                            return true;
                                        }
                                        else {
                                            document.getElementById('lblStatusError').innerHTML = "Please enter only character!";
                                            return false;
                                        }
                                    }
                                    else {
                                        document.getElementById('lblStatusError').innerHTML = "Please enter value!";
                                        return false;
                                    }
                                }
                                else {
                                    document.getElementById('lblcontactError').innerHTML = "Please enter only number!";
                                    return false;
                                }
                            }
                            else {
                                document.getElementById('lblcontactError').innerHTML = "Please enter value!";
                                return false;
                            }
                        }
                        else {
                            document.getElementById('lblEmailError').innerHTML = "Invalid email!";
                            return false;
                        }
                    }
                    else {
                        document.getElementById('lblEmailError').innerHTML = "Please enter value!";
                        return false;
                    }
                }
                else {
                    document.getElementById('lblNameError').innerHTML = "number not allowed!";
                    return false;
                }
            }
            else {
                document.getElementById('lblNameError').innerHTML = "Please enter value!";
                return false;
            }
        }


        function validEmail() {
            var email = document.getElementById("txtemail").value;
            var atposition = email.indexOf("@");
            var dotposition = email.lastIndexOf(".");
            if(atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= email.length)
            {
                return false;
            }
            else{
                return true;
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        
        <!--Navigation bar module-->
        <div class="row">
                <nav class="navbar navbar-defualt  navbar-fixed-top">
                    <div class="col-md-3">

                        <div class="navbar-header">
                            <img src="logoimg/logo3.png" width="80%" height="60" />
                        </div>
                    </div>
                    <div class="col-md-7">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="home.aspx">Home</a></li>
                            <li><a href="match.aspx">Match</a></li>
                            <li><a href="search.aspx">Search</a></li>
                            <li><a href="about.aspx">About</a></li>
                            <li><a href="contact.aspx">Contact</a></li>
                        </ul>

                    </div>
                    <div class="col-md-2" style="">

                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <img src="img/usericon1.png" style="border-radius: 50%; height: 30px; width: 30px;"/><asp:Label ID="lblusername" runat="server" Text="loky kumar"></asp:Label><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="user.aspx">My Profile</a></li>
                                <li><asp:LinkButton ID="lnkogout" runat="server" OnClick="lnkogout_Click">Logout</asp:LinkButton></li>
                            </ul>
                        </div>

                    </div>

                </nav>
            </div>

        <!--Profile module-->
          <div class="container emp-profile" style="margin-top:120px; box-shadow:0 1px 5px 1px #818182;">
            <div class="row">
                <div class="col-md-4">
                    <div>
                        <asp:Image ID="Image1" runat="server" Width="80%" Height="148" style="box-shadow:0 1px 6px 1px #818182;border-radius:7px;" ImageUrl="~/img/usericon1.png"/>
                           
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-head">
                         <asp:Label ID="lblprofilename" runat="server" Text=""></asp:Label><br />
                        <span style="color:#0062cc">From <asp:Label ID="lblstate" runat="server" Text=""></asp:Label></span>
                        <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" aria-controls="home" aria-selected="true">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Basic Lifestyle</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="family-tab" data-toggle="tab" href="#Family" role="tab" aria-controls="family" aria-selected="false">Family details</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Making User profile updation module-->
                <div class="col-md-2">
                    <button type="button" class="profile-edit-btn" data-toggle="modal" data-target="#exampleModal">Edit Profile</button>
                    
                </div>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                               <h4 style="margin-left:60px;margin-top:0px;">Edit Profile</h4><hr />
                           </div>

                            <!--Model popup body-->
                            <div class="modal-body">
                               <div class="row">
                                   <div class="col-md-3">

                                   </div>
                                   <div class="col-md-6">
                                       <ul class="nav nav-tabs" id="myTab2" role="tablist" style="border-color:#972cc3">
                                           <li class="nav-item">
                                               <a class="nav-link active" id="home2-tab" data-toggle="tab" href="#home2" aria-controls="home" aria-selected="true" style="color:#972cc3;">Profile</a>
                                           </li>
                                           <li class="nav-item">
                                               <a class="nav-link" id="profile2-tab" data-toggle="tab" href="#profile2" role="tab" aria-controls="profile" aria-selected="false" style="color:#972cc3;">Basic Lifestyle</a>
                                           </li>
                                           <li class="nav-item">
                                               <a class="nav-link" id="family2-tab" data-toggle="tab" href="#Family2" role="tab" aria-controls="family" aria-selected="false" style="color:#972cc3;">Family details</a>
                                           </li>
                                            <li class="nav-item">
                                               <a class="nav-link" id="password-tab" data-toggle="tab" href="#Password" role="tab" aria-controls="Password" aria-selected="false" style="color:#972cc3;">Password</a>
                                           </li>
                                       </ul>
                                       <div class="tab-content">
                                         <div id="home2" class="tab-pane fade in active">
                                             <div class="login-form">
                                                 <div class="form-group">
                                                    
                                                        <asp:TextBox ID="txtname" runat="server" class="form-input" placeholder="Name" style="border-color:red;"></asp:TextBox>
                                                            <span id="lblNameError" class="errorClass"> </span> 
                                                          </div>
                                                     <div class="form-group">
                                                          
                                                          <asp:TextBox ID="txtemail" runat="server" class="form-input" placeholder="Email"></asp:TextBox>
                                                            <span id="lblEmailError" class="errorClass"> </span> 
                                                     </div>
                                                     <div class="form-group">
                                                         <asp:TextBox ID="txtcontact" runat="server" class="form-input" placeholder="Contact"></asp:TextBox>
                                                         <span id="lblcontactError" class="errorClass"> </span> 
                                                 </div>
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtMS" runat="server" class="form-input" placeholder="Marital Status"></asp:TextBox>
                                                     <span id="lblStatusError" class="errorClass"> </span> 
                                                 </div>
                                             </div>
                                       </div>
                                           <div id="profile2" class="tab-pane fade in">
                                             <div class="login-form">
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtmothertounge" runat="server" class="form-input" placeholder="Mother Tounge"></asp:TextBox>
                                                 </div>
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtage" runat="server" class="form-input" placeholder="Age"></asp:TextBox>
                                                 </div>
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtheight" runat="server" class="form-input" placeholder="Height"></asp:TextBox>
                                                 </div>
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtcaste" runat="server" class="form-input" placeholder="Caste"></asp:TextBox>
                                                 </div>
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtdrinksmoke" runat="server" class="form-input" placeholder="Drink/Smoke"></asp:TextBox>
                                                 </div>
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtdiet" runat="server" class="form-input" placeholder="Diet"></asp:TextBox>
                                                 </div>
                                             </div>
                                       </div>

                                           <div id="Password" class="tab-pane fade in">
                                             <div class="login-form">
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtpass" runat="server" class="form-input" placeholder="Password"></asp:TextBox>
                                                 </div>
                                                 <div class="form-group">
                                                         <asp:TextBox ID="txtcpass" runat="server" class="form-input" placeholder="Confirm Password"></asp:TextBox>
                                                 </div>
                                             </div>
                                       </div>
                                   </div>
                                   <div class="col-md-3">
                                    </div>
                               </div>                                 
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="UpdateUserDetails" runat="server" Text="Update" class="btn" OnClientClick="return userValid()" OnClick="UpdateUserDetails_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <!-- End of Making User profile updation module-->

            
            <div class="row">
                <div class="col-md-4">
                    <%--<div class="profile-work">
                            <p>Education & Career</p>
                            <table class="table_working_hours">
                        <tbody>
                            <tr class="opened_1">
                                <td class="day_label">Education :</td>
                                <td class="day_value">Engineering</td>
                            </tr>
                            <tr class="closed">
                                <td class="day_label">Education In:</td>
                                <td class="day_value closed"><span>Software Engineer</span></td>
                            </tr>
                             <tr class="closed">
                                <td class="day_label">Annual Income</td>
                                <td class="day_value closed"><span>Rs.5,00,000-6,00,000</span></td>
                            </tr>
                        </tbody>
                    </table>

                            <p>Others</p>
                            <a href="">Web Designer</a><br/>
                            <a href="">Web Developer</a><br/>
                            <a href="">WordPress</a><br/>
                            <a href="">WooCommerce</a><br/>
                            <a href="">PHP, .Net</a><br/>
                        </div>--%>
                </div>
                <div class="col-md-8">
                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-6">
                                    <p>User Id</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblid" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Name</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Email</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblemail" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Phone</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblcontact" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Marital Status</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblMS" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel">
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Mother Tounge</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblmothertounge" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Age</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblage" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Height</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblheight" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Caste</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblcaste" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Drink/Smoke</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblsmoke" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Diet</p>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lbldiet" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
              </div>
              </div>
    </form>
</body>
</html>
