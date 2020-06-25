<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>

    <link href="css/Home.css" rel="stylesheet" />
    

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <asp:Label ID="txtid" runat="server" Text="" Visible="false"></asp:Label>
            <div class="row">
                <nav class="navbar navbar-defualt  navbar-fixed-top">
                    <div class="col-md-3">

                        <div class="navbar-header">
                            <img src="logoimg/logo3.png" height="60" />
                        </div>
                    </div>
                    <div class="col-md-7">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="home.aspx">Home</a></li>
                            <li><a href="match.aspx">Match</a></li>
                            <li><a href="search.aspx">Search</a></li>
                            <li><a href="Inbox.aspx">Inbox</a></li>
                            <li><a href="about.aspx">About</a></li>
                            <li><a href="contact.aspx">Contact</a></li>


                        </ul>

                    </div>
                    <div class="col-md-2" style="">

                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                   <asp:Image ID="Image2" runat="server" style="border-radius: 50%; height: 30px; width: 30px;" ImageUrl="~/img/usericon1.png" />
                                <asp:Label ID="lblusername" runat="server" Text="loky kumar"></asp:Label><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="user.aspx">My Profile</a></li>
                                <li><asp:LinkButton ID="lnkogout" runat="server" OnClick="lnkogout_Click">Logout</asp:LinkButton></li>
                            </ul>
                        </div>

                    </div>

                </nav>
            </div>

            <div class="row" style="margin-top:130px;">
                <div class="col-lg-1"></div>

                <div class="col-lg-4" style="background:none" >

                    <div class="profilebox" style=" height:auto;width:80%;">
                        <div class="profileimg">
                            <asp:Image ID="Image1" runat="server" CssClass="img" ImageUrl="~/img/usericon1.png" />
                            <h4 style="margin-top:20px">My Profile</h4>
                            <h5> </h5>
                            <ul>
                                <li style=" border-bottom:1px solid #eee;">My Bio : <asp:Label ID="lblabout" runat="server" Text=""></asp:Label></li>
                                <li style=" border-bottom:1px solid #eee;"><asp:Label ID="lblusername1" runat="server" Text="loky kumar"></asp:Label></li>
                                <li style=" border-bottom:1px solid #eee;"><asp:Label ID="lblemail" runat="server" Text=""></asp:Label></li>
                            </ul>
                        </div>


                    </div>

                </div>
               
                <div class="col-lg-6">

                    <div class="profilebox">

                        <div class="basicdetail profileimg">
                             <h4 style="border-bottom:1px solid #eee;padding-bottom:10px">Basic Details</h4>
                           
                            <div class="row">
                                <div class="col-lg-6">
                                     <ul>
                                <li>Living Status With Family :</li>
                                 <li>Marital Status           :</li>
                                 <li>Family Status            :</li>
                                 <li>Height</li>
                                 <li>Mother Tongue :</li>
                                 <li>Religion :</li>
                                 <li>Caste:</li>
                            </ul>
                                </div>
                                <div class="col-lg-6">
                                <ul>
                                 <li><asp:Label ID="lblliving" runat="server" Text="Yes"></asp:Label></li>
                                 <li> <asp:Label ID="lblmarital" runat="server" Text="Never Married"></asp:Label></li>
                                 <li><asp:Label ID="lblfamily" runat="server" Text="middle class"></asp:Label></li>
                                 <li>  <asp:Label ID="lblheight" runat="server" Text="4ft 6in / 137cms"></asp:Label></li>
                                 <li> <asp:Label ID="lblmt" runat="server" Text="Never Married"></asp:Label></li>
                                 <li><asp:Label ID="lblr" runat="server" Text="middle class"></asp:Label></li>
                                 <li> <asp:Label ID="lblc" runat="server" Text="4ft 6in / 137cms"></asp:Label></li>
                            </ul>
                                </div>
                                
                            </div>
                            
                        </div>

                    </div>

                    <div class="profilebox" style="margin-top:50px">

                        <div class=" profileimg">
                             <h4 style="border-bottom:1px solid #eee;padding-bottom:10px">Personal Details</h4>
                           
                            <div class="row">
                                <div class="col-lg-6">
                                     <ul>
                                <li>Age : </li>
                                 <li>Deit :</li>
                                 <li>Drinking / Smoking :</li>
                                 <li>Physical Status :</li>
                                 <li>Mother Tongue :</li>
                                 <li>Religion :</li>
                                 <li>Caste:</li>
                            </ul>
                                </div>
                                <div class="col-lg-6">
                                <ul>
                                 <li><asp:Label ID="lblage" runat="server" Text=""></asp:Label></li>
                                 <li> <asp:Label ID="lbldeit" runat="server" Text=""></asp:Label></li>
                                 <li> <asp:Label ID="lblds" runat="server" Text=""></asp:Label></li>
                                 <li> <asp:Label ID="lblps" runat="server" Text=""></asp:Label></li>
                                 <li> <asp:Label ID="Label5" runat="server" Text="Never Married"></asp:Label></li>
                                 <li><asp:Label ID="Label6" runat="server" Text="middle class"></asp:Label></li>
                                 <li> <asp:Label ID="Label7" runat="server" Text="4ft 6in / 137cms"></asp:Label></li>
                            </ul>
                                </div>
                                
                            </div>
                            
                        </div>

                    </div>

                    <div class="profilebox" style="margin-top:50px">

                        <div class=" profileimg">
                             <h4 style="border-bottom:1px solid #eee;padding-bottom:10px">Education / Career Details</h4>
                           
                            <div class="row">
                                <div class="col-lg-6">
                            <ul>
                                <li>Heighest Education : </li>
                                 <li>Employee In :</li>
                                 <li>Occupation :</li>
                                 <li>Annual Income :</li>
                                 
                            </ul>
                                </div>
                                <div class="col-lg-6">
                                <ul>
                                 <li><asp:Label ID="lblhe" runat="server" Text=""></asp:Label></li>
                                 <li> <asp:Label ID="lblei" runat="server" Text=""></asp:Label></li>
                                 <li> <asp:Label ID="lblocc" runat="server" Text=""></asp:Label></li>
                                 <li> <asp:Label ID="lblai" runat="server" Text=""></asp:Label></li>
                                
                            </ul>
                                </div>
                                
                            </div>
                            
                        </div>

                    </div>

                    <div class="profilebox" style="margin-top:50px">

                        <div class=" profileimg">
                             <h4 style="border-bottom:1px solid #eee;padding-bottom:10px">Location Details</h4>
                           
                            <div class="row">
                                <div class="col-lg-6">
                            <ul>
                                <li>City : </li>
                                 <li>State :</li>
                                 <li>Country :</li>
                                 
                                 
                            </ul>
                                </div>
                                <div class="col-lg-6">
                                <ul>
                                 <li><asp:Label ID="lblcity" runat="server" Text=""></asp:Label></li>
                                 <li><asp:Label ID="lblstate" runat="server" Text=""></asp:Label></li>
                                 <li><asp:Label ID="lblcon" runat="server" Text=""></asp:Label></li>
                            
                                
                            </ul>
                                </div>
                                
                            </div>
                            
                        </div>

                    </div>



                </div>
                <div class="col-lg-1"></div>
            </div>

          
                <div class="col-md-1">
                </div>
            </div>

       

        <div class="row" style="background: #ddd; margin-top: 50px">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <p style="text-align: center; margin-top: 0px">All rights reserved &copy;CatchYourMatch.com</p>
            </div>
            <div class="col-md-3"></div>
        </div>

    </form>
</body>
</html>
