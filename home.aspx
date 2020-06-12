<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    <style>
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

        .dropdown {
            background: none;
            margin-top: 2em;
        }

            .dropdown a {
                color: #ddd;
                text-decoration: none;
            }

                .dropdown a .caret {
                    color: #fff;
                }

            .dropdown .dropdown-menu a {
                padding: 10px 20px;
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
                            <img src="logoimg/logo3.png" height="60" />
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
                                <img src="img/usericon1.png" style="border-radius: 50%; height: 30px; width: 30px;" /><asp:Label ID="lblusername" runat="server" Text="loky kumar"></asp:Label><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="user.aspx">My Profile</a></li>

                                <li>
                                    <asp:LinkButton ID="lnkogout" runat="server" OnClick="lnkogout_Click">Logout</asp:LinkButton></li>
                            </ul>
                        </div>

                    </div>

                </nav>
            </div>
            <div class="row" style="z-index: -1; height: 700px; padding: 0px; background: ; margin-top: 150px;">
                <div class="col-md-1">
                </div>
                <div class="col-md-4">
                    <asp:Image ID="Image1" runat="server" Width="80%" Height="300" ImageUrl="~/img/usericon1.png" />
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <h3>Basic Details</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Living Status With Family :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblliving" runat="server" Text="Yes"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Marital Status :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblmarital" runat="server" Text="Never Married"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Family Status :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblfamily" runat="server" Text="middle class"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Height</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblheight" runat="server" Text="4ft 6in / 137cms"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mother Tongue :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblmt" runat="server" Text="Never Married"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Religion :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblr" runat="server" Text="middle class"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Caste</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblc" runat="server" Text="4ft 6in / 137cms"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <h3>Personal Details</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Age :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblage" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Deit :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lbldeit" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Drinking / Smoking :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblds" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Physical Status :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblps" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <h3>Education / Career Details</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Heighest Education :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblhe" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Employee In :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblei" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Occupation :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblocc" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Annual Income :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblai" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <h3>About YourSelf</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <label>About me :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblabout" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <h3>Location Details</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <label>City :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblcity" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>State :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblstate" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Country :</label>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblcon" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="col-md-1">
                </div>
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
