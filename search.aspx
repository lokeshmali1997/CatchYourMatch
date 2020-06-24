<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="Search.css" rel="stylesheet" />
    <style>
        .errorClass{
            color:red;
        }
        .editlabelsearch {
            display: block;
            position: relative;
            margin: 25px 0px;
            width:175px;
            float:left;
        }
        .label-txt {
            position: absolute;
            top: -1.6em;
            padding: 10px;
            font-family: sans-serif;
            font-size: .8em;
            letter-spacing: 1px;
            color: rgb(120,120,120);
            transition: ease .3s;
        }

        .input {
            width: 100%;
            padding: 10px;
            background: transparent;
            border: none;
            outline: none;
            color: rgb(120,120,120);
        }

        .line-box {
            position: relative;
            width: 100%;
            height: 2px;
            background: #BCBCBC;
        }

        .line {
            position: absolute;
            width: 0%;
            height: 2px;
            top: 0px;
            left: 50%;
            transform: translateX(-50%);
            background: #972cc3;
            transition: ease .6s;
        }

        .input:focus + .line-box .line {
            width: 100%;
        }

        .label-active {
            top: -3em;
        }

        .editsearchbtn {
            display: inline-block;
            padding: 12px 24px;
            background: #972cc3;
            font-weight: bold;
            color: rgb(120,120,120);
            border: none;
            outline: none;
            border-radius: 3px;
            width: 100%;
            transition: ease .3s;
            color: #ffffff;
        }

            .editsearchbtn:hover {
                box-shadow: 0 1px 10px 0 #818182;
            }

       

        /*tab and pills style */
        .nav-tabs {
            border-bottom: none;
        }

        .profile-head .nav-tabs .nav-link {
            margin-top: 10px;
            font-weight: 600;
            border: none;
        }

            .profile-head .nav-tabs .nav-link.active {
                border: none;
            }

        /*end of tab and pills style */


        /* Scroll bar css*/
                .scrollbar {
                
margin-left: 10px;
float: left;
height: 600px;
background: #fff;
overflow-y: scroll;
width:700px;
direction:rtl;
}


.scrollbar-primary::-webkit-scrollbar {
width: 2px;
background-color: #F5F5F5; }

.scrollbar-primary::-webkit-scrollbar-thumb {
border-radius: 10px;
background-color: #972cc3;

}
        /*end of Scroll bar css*/

    </style>
    <script>
        $(document).ready(function () {

            $('.input').focus(function () {
                $(this).parent().find(".label-txt").addClass('label-active');
            });

            $(".input").focusout(function () {
                if ($(this).val() == '') {
                    $(this).parent().find(".label-txt").removeClass('label-active');
                };
            });

        });
        
    function searchValid()
    {
        var age,maxAge,religion,caste,motherTounge,city;
        age = document.getElementById("txtagemin").value;
        maxAge = document.getElementById("TextBox2").value;
        religion = document.getElementById("txtreligion").value;
        motherTounge = document.getElementById("txtmothertongue").value;
        city = document.getElementById("txtcity").value;
        caste = document.getElementById("txtcaste").value;



        if (age != "")
        {
            if(age>= 18 && age <60)
            {
                document.getElementById('lblAgeMinError').innerHTML = "";
                if(maxAge != "")
                {
                    if(maxAge<60)
                    {
                        document.getElementById('lblAgeMaxError').innerHTML = "";
                        if(religion != "")
                        {
                            document.getElementById('lblReligionError').innerHTML = "";
                            if (caste != "") {
                                document.getElementById('lblCasteError').innerHTML = "";
                                if (motherTounge != '') {
                                    document.getElementById('lblMotherToungeError').innerHTML = "";
                                    if (city != "") {
                                        document.getElementById('lblCityError').innerHTML = "";
                                        return true;
                                    }
                                    else {
                                        document.getElementById('lblCityError').innerHTML = "Please Enter Values";
                                        return false;
                                    }
                                }
                                else {
                                    document.getElementById('lblMotherToungeError').innerHTML = "Please Enter Values";
                                    return false;
                                }
                            }
                            else {
                                document.getElementById('lblCasteError').innerHTML = "Please Enter Caste!";
                                return false;
                            }
                        }
                        else {
                            document.getElementById('lblReligionError').innerHTML = "Please Enter Values";
                            return false;
                        }
                    }
                    else {
                        document.getElementById('lblAgeMaxError').innerHTML = "maxAge should be 60";
                        return false;
                    }
                }
                else {
                    document.getElementById('lblAgeMaxError').innerHTML = "Please Enter Values";
                    return false;
                }
            } else {
                document.getElementById('lblAgeMinError').innerHTML = "Age should be in between 18 and 60 ";
                return false;
            }
        }
        else {
            document.getElementById('lblAgeMinError').innerHTML = "Please Enter Values";
            return false;
        }
        
        
       
    }
    </script>
</head>

<body style="background: #ddd">
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
                            <li><a href="home.aspx">Home</a></li>
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
        </div>


        <!--Search Div-->
        <div class="container" style="background: white; margin-top: 10%;">
            <div class="row">
                <div class="col-md-6">
                    <div class="profile-head">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" aria-controls="home" aria-selected="true" style="color: #972cc3;">Search</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" style="color: #972cc3; border: none;">Search By Profile ID</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6"></div>
            </div>
            
            
            <div class="row" style="margin-bottom:60px;margin-top:20px;">
                <div class="col-md-4" style="margin-top: 30px;">

                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <label class="editlabelsearch">
                                <p class="label-txt">Age</p>
                                <asp:TextBox ID="txtagemin" class="form-control, input" runat="server" ></asp:TextBox>
                                
                                <div class="line-box">
                                    <div class="line"></div>
                                </div>
                                <span id="lblAgeMinError" class="errorClass"> </span> 

                            </label>
                            
                             <label class="editlabelsearch">
                                <p class="label-txt">Max Age</p>
                                <asp:TextBox ID="txtagemax" class="form-control, input" runat="server" ></asp:TextBox>
                                <div class="line-box">
                                    <div class="line"></div>
                                </div>
                                   <span id="lblAgeMaxError" class="errorClass"> </span> 
                            </label>
                            <label class="editlabelsearch" style="width:100%;">
                                <p class="label-txt">Religion</p>
                                <asp:TextBox ID="txtreligion" class="form-control, input" runat="server"></asp:TextBox>
                                <div class="line-box">
                                    <div class="line"></div>
                                </div>
                                 <span id="lblReligionError" class="errorClass"> </span>
                            </label>
                            <label class="editlabelsearch" style="width:100%;">
                                <p class="label-txt">Caste</p>
                                <asp:TextBox ID="txtcaste" class="form-control, input" runat="server"></asp:TextBox>
                                <div class="line-box">
                                    <div class="line"></div>
                                </div>
                                 <span id="lblCasteError" class="errorClass"> </span>
                            </label>
                            <label class="editlabelsearch" style="width:100%;">
                                <p class="label-txt">Mother Tounge</p>
                                <asp:TextBox ID="txtmothertongue" class="form-control, input" runat="server"></asp:TextBox>
                                <div class="line-box">
                                    <div class="line"></div>
                                </div>
                                  <span id="lblMotherToungeError" class="errorClass"> </span>
                            </label>
                            <label class="editlabelsearch" style="width:100%;">
                                <p class="label-txt">City</p>
                                <asp:TextBox ID="txtcity" class="form-control, input" runat="server"></asp:TextBox>
                                <div class="line-box">
                                    <div class="line"></div>
                                </div>
                                  <span id="lblCityError" class="errorClass"> </span>
                            </label>
                            <asp:Button ID="Button1" runat="server" class="editsearchbtn" OnClientClick="return searchValid()"  Text="Search" />
                        </div>

                        <div class="tab-pane fade" id="profile" role="tabpanel">
                            <label class="editlabelsearch" style="width:100%;">
                                <p class="label-txt">Profile ID</p>
                                <asp:TextBox ID="TextBox1" class="form-control, input" runat="server"></asp:TextBox>
                                <div class="line-box">
                                    <div class="line"></div>
                                </div>
                            </label>
                            <asp:Button ID="Button2" runat="server" class="editsearchbtn" Text="Search" />
                        </div>
                    </div>
                </div>
               
                 <div class="col-md-8">
                    <div class="scrollbar scrollbar-primary">
                        <div style="direction:ltr;">
                        <!--Repeater-->
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                            <ItemTemplate>
                                <div class="repeater">
                                    <div class="row" style="margin:0;">
                                        <div class="col-md-4">
                                             <ul>
                                       <li>
                                           <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("profileimage") %>' style="width:150px; height:150px;box-shadow:0 1px 6px 1px #818182;border-radius:7px;"/>
                                        </li>
                                                 </ul>
                                        </div>
                                        
                                        <div class="col-md-4" style="margin-top:-5px;">
                                              <ul>
                                                  <li>
                                                     <asp:Label ID="lblname" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                                      <div style="border-bottom:1px solid #ddd;width:219px;"></div>
                                                  </li>
                                               <li>
                                                    <asp:Label ID="lblage" runat="server" Text='<%# Bind("age") %>'></asp:Label>Years,
                                                </li>
                                                  <li>
                                                      <asp:Label ID="lblheight" runat="server" Text='<%# Bind("height") %>'></asp:Label>
                                            
                                                  </li>
                                                <li>
                                                    <asp:Label ID="lblcity" runat="server" Text='<%# Bind("city") %>'></asp:Label> /
                                                    <asp:Label ID="lblstate" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                                    
                                                </li>
                                                  <li>
                                                      <asp:Label ID="lblmt" runat="server" Text='<%# Bind("mothertongue") %>'></asp:Label> /
                                                      <asp:Label ID="lblcountry" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                                  </li>
                                                <li>
                                                    <asp:Label ID="lblreligion" runat="server" Text='<%# Bind("religion") %>'></asp:Label> /
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("caste") %>'></asp:Label>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-md-2" style="margin-top:15px;">
                                            <ul>
                                                  <li>
                                                    <div style="border-bottom:1px solid #ddd;width:150px;"></div>
                                                  </li>
                                                 <li>
                                                    <asp:HiddenField ID="hiddid" runat="server" Value='<%# Bind("id")%>' />
                                                </li>
                                               <li>
                                                    <asp:Label ID="lblHE" runat="server" Text='<%# Bind("heighesteducation") %>'></asp:Label>
                                                </li>
                                                  <li>
                                                      <asp:Label ID="lbloccupation" runat="server" Text='<%# Bind("occupation") %>'></asp:Label>
                                            
                                                  </li>
                                                <li>
                                                    <asp:Label ID="lblannualincome" runat="server" Text='<%# Bind("annualincome") %>'></asp:Label></li>
                                                <li>
                                                    <asp:Label ID="lblms" runat="server" Text='<%# Bind("maritalstatus") %>'></asp:Label>
                                                </li>
                                            </ul>
                                             
                                        </div>
                                        <div class="col-md-2" style="margin-top:15px;">
                                            <ul>
                                                  <li>
                                                    <div style="border-bottom:1px solid #ddd;width:50px;"></div>
                                                  </li>
                                                </ul>
                                             <asp:Button ID="btnrequest" runat="server" class="btn btn-primary" Text="Request" CommandName="Request"/>
                                             <asp:Button ID="btnprofile" runat="server" class="btn btn-primary" Text="View Profile" style="width:78px;height:30px;font-size:10px;" Visible="False" />
                                            
                                        </div>
                                    
                                  </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!--End Repeater-->
                        </div>
                    </div>
                </div>
              
       
               
            </div>
        </div>
        <!-- End of Search Div-->
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
