﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="ViewProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <style>
        .row {
            margin: 0px;
        }

        .navbar {
            height: 100px;
            background: #8e44ad;
        }

        .navbar-nav {
            margin-top: 10px;
            margin-left: 0em;
        }

        .navbar-header {
            margin-top: 20px;
        }

        .navbar-nav li a {
            padding: 30px;
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

        .profilebox {
            background: white;
            border-radius: 10px;
            margin: 20px;
            padding: 20px 20px 20px 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .profileimg img {
            Width: 100%;
            Height: 200px;
            border-radius: 10px;
        }

        .profileimg ul {
            padding-left: 0px;
            list-style-type: none;
            color: rgba(0, 0, 0,0.6);
            font-size: 12px;
            font-family: Verdana;
        }

            .profileimg ul li {
                padding: 5px;
                margin-top: 5px;
            }

        .pprofileimg h4 {
            font-family: 'Arial Rounded MT';
            font-weight: 600;
            font-size: 16px;
        }

        .basicdetail {
            Width: 100%;
            Height: 250px;
            border-radius: 10px;
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
                            <li><a href="Inbox.aspx">Inbox</a></li>
                            <li><a href="about.aspx">About</a></li>
                            <li><a href="contact.aspx">Contact</a></li>


                        </ul>
                    </div>

                    <div class="col-md-2" style="">
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <asp:Image ID="Image2" runat="server" Style="border-radius: 50%; height: 30px; width: 30px;" ImageUrl="~/img/usericon1.png" />
                                <asp:Label ID="lblusername" runat="server" Text="loky kumar"></asp:Label><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="user.aspx">My Profile</a></li>
                                <li>
                                    <asp:LinkButton ID="lnkogout" runat="server" OnClick="lnkogout_Click">Logout</asp:LinkButton></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>

            <div class="row" style="margin-top: 150px;">
                <div class="col-lg-1"></div>

                <div class="col-lg-4" style="background: none">
                    <div class="profilebox" style="width: 80%;">
                        <div class="profileimg">
                            <asp:Image ID="Image1" runat="server" CssClass="img" ImageUrl="~/img/usericon1.png" />
                            <h4 style="margin-top: 20px">My Profile</h4>
                            <h5></h5>
                            <ul>
                                <li style="border-bottom: 1px solid #eee;">My Bio :
                                    <asp:Label ID="lblabout" runat="server" Text=""></asp:Label></li>
                                <li style="border-bottom: 1px solid #eee;">
                                    <asp:Label ID="lblusername1" runat="server" Text="loky kumar"></asp:Label></li>
                                <li style="border-bottom: 1px solid #eee;">
                                    <asp:Label ID="lblemail" runat="server" Text=""></asp:Label></li>
                                <li style="border-bottom: 1px solid #eee;">Contact :
                                    <asp:Label ID="lblContact" runat="server" Text=""></asp:Label></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="profilebox">
                        <div class="basicdetail profileimg">
                            <h4 style="border-bottom: 1px solid #eee; padding-bottom: 10px">Basic Details</h4>
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
                                        <li>
                                            <asp:Label ID="lblliving" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblmarital" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblfamily" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblheight" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblmt" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblr" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblc" runat="server" Text=""></asp:Label></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="profilebox" style="margin-top: 50px">
                        <div class=" profileimg">
                            <h4 style="border-bottom: 1px solid #eee; padding-bottom: 10px">Personal Details</h4>

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
                                        <li>
                                            <asp:Label ID="lblage" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lbldeit" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblds" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblps" runat="server" Text=""></asp:Label></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="profilebox" style="margin-top: 50px">
                        <div class=" profileimg">
                            <h4 style="border-bottom: 1px solid #eee; padding-bottom: 10px">Education / Career Details</h4>

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
                                        <li>
                                            <asp:Label ID="lblhe" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblei" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblocc" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblai" runat="server" Text=""></asp:Label></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="profilebox" style="margin-top: 50px">
                        <div class=" profileimg">
                            <h4 style="border-bottom: 1px solid #eee; padding-bottom: 10px">Location Details</h4>

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
                                        <li>
                                            <asp:Label ID="lblcity" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblstate" runat="server" Text=""></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblcon" runat="server" Text=""></asp:Label></li>
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
