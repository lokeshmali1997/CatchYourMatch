<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Inbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
        
        /*tab and pills style */
        .nav-tabs {
            border-bottom: none;
        }

        .profile-head .nav-tabs .nav-link {
            margin-top: 10px;
            font-weight: 600;
            border: none;
        }
        .profile-head .nav-tabs .nav-link:hover{
            background-color:none;
        }
        .profile-head .nav-tabs .nav-link.active {
                border: none;
                border-bottom:1px solid #972cc3;
        }

        /*end of tab and pills style */

        /* Scroll bar css*/
        .scrollbar{
            margin-left: 10px;
            height: 270px;
            background: #fff;
            overflow-y: scroll;
            direction:rtl;
        }
        .scrollbar-primary::-webkit-scrollbar {
            width: 2px;
            background-color: #F5F5F5;
        }

        .scrollbar-primary::-webkit-scrollbar-thumb {
            border-radius: 10px;
            background-color: #972cc3;
        }
        /*end of Scroll bar css*/
    
        /* ul & li of repeater 1*/
        .repeater{
            margin-top:15px;
            margin-left:20px; 
            box-shadow:1px 1px 6px #808080;
            border:1px solid #ddd;
            width:360px;
        }
        .repeater ul{
            list-style-type:none;
            font-size:12px;
            padding:0;
        }
        /* ul & li of repeater 1*/
        
        /* ul & li of repeater 2*/
        .repeater2{
            margin-top:15px;
            margin-left:20px; 
            box-shadow:1px 1px 6px #808080;
            border:1px solid #ddd;
            width:440px;
        }
        .repeater2 ul{
            list-style-type:none;
            font-size:12px;
            padding:0;
        }
        /* ul & li of repeater 2*/

        .btnconfirm{
             margin-top:15px;
             width:70px;
             height:30px;
             border:none;
             box-shadow:1px 1px 1px #808080;
             color:white;
             font-size:12px;
             background-color:#972cc3;
             font-weight:600;
             border-radius:2px; 
        }
        .btndelete{
             margin-top:15px;
             width:70px;
             height:30px;
             border:none;
             font-size:12px;
             font-weight:600;
             border-radius:2px; 
       }
        .btnFriends{
             margin-top:12px;
             width:70px;
             height:30px;
             border:none;
             box-shadow:1px 1px 1px #808080;
             color:white;
             font-size:12px;
             background-color:#972cc3;
             font-weight:600;
             border-radius:2px; 
        }
        .num {
            width:15px;
            border-radius:3px;
            position: absolute;
            padding-left:4px;
            top: -9px;
            color:#ddd;
            font-weight:600;
            background-color:#c62828;
        }
        </style>
    <script>
        function SentRequest() {
            document.getElementById('SentRequest').style.display = "block";
        }
        function AcceptRequest() {
            document.getElementById('AcceptRequest').style.display = "block";
            
        }
        function Invitation() {
            document.getElementById('Invitation').style.display = "block";
        }
        function Friends() {
            document.getElementById('Friends').style.display = "block";
        }
        function Delete() {
            document.getElementById('Delete').style.display = "block";
        }
    </script>
</head>

<body style="background: #e9ebee">
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
                                <li class="active"><a href="search.aspx">Search</a></li>
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

        <div class="container" style="margin-top: 8%; width: 50%;">
            <div class="row">
                <div class="col-md-12">
                    <div class="profile-head">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <asp:LinkButton ID="lbtnSentRequest" class="nav-link" runat="server" Style="color: #972cc3; position: relative;"
                                    OnClick="lbtnSentRequest_Click">
                                    <img src="img/icons8-email-send-24.png" style="width: 20px; height: 20px; margin-top: -4px" />
                                    <asp:Label ID="lblSentRequest" runat="server" Text="" class="num" style="margin-left:90px;"></asp:Label>
                                    Sent Request
                                </asp:LinkButton>
                            </li>

                            <li class="nav-item" style="margin-left: 35px;">
                                <asp:LinkButton ID="lbtnAcceptRequest" runat="server" class="nav-link" Style="color: #972cc3; border: none;"
                                    OnClick="lbtnAcceptRequest_Click">
                                    <img src="img/icons8-checkmark-64.png" style="width: 20px; height: 20px; margin-top: -4px" />
                                    <asp:Label ID="lblAccept" runat="server" Text="" class="num" style="margin-left:49px;"></asp:Label>
                                    Accept</asp:LinkButton>
                            </li>

                            <li class="nav-item" style="margin-left: 35px;">
                                <asp:LinkButton ID="lbtnInvitation" runat="server" class="nav-link" Style="color: #972cc3; border: none;"
                                    OnClick="lbtnInvitation_Click">
                                    <img src="img/icons8-team-30.png" style="width: 22px; height: 23px; margin-top: -4px" />
                                     <asp:Label ID="lblInvitation" runat="server" Text="" class="num" style="margin-left:62px;"></asp:Label>
                                    Invitation</asp:LinkButton>
                            </li>

                            <li class="nav-item" style="margin-left: 30px;">
                                <asp:LinkButton ID="lbtnFriends" runat="server" class="nav-link" Style="color: #972cc3; border: none;"
                                    OnClick="lbtnFriends_Click">
                                    <img src="img/icons8-checked-user-male-60.png" style="width: 22px; height: 23px; margin-top: -5px" />
                                    <asp:Label ID="lblFriends" runat="server" Text="" class="num" style="margin-left:50px;"></asp:Label>
                                    Friends</asp:LinkButton>
                            </li>
                             <li class="nav-item" style="margin-left: 20px;">
                                <asp:LinkButton ID="lbtnDelete" runat="server" class="nav-link" Style="color: #972cc3; border: none;"
                                     OnClick="lbtnDelete_Click">
                                    <img src="img/icons8-delete-bin-50.png" style="width: 22px; height: 23px; margin-top: -5px" />
                                    <asp:Label ID="lbldelete" runat="server" Text="" class="num" style="margin-left:45px;"></asp:Label>
                                    Delete</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

                <div class="container" style="background: white; margin-top: 1%; width:50%;  box-shadow:1px 1px 6px #808080;">
                 <!--Tab Content Row-->
                <div class="row" >
                    <div class="col-md-9">
                        <div class="tab-content">
                             <div id="SentRequest" class="tab-pane fade in">
                                <div class="scrollbar scrollbar-primary">
                                    <div style="direction: ltr;">
                                        <!--Repeater 1-->
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <div class="repeater">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <ul style="padding-top:4px;">
                                                                <li>
                                                                    <asp:Image ID="imgrequest" runat="server" ImageUrl='<%# Bind("profileimage") %>' Style="width:45px; height:45px; box-shadow: 0 1px 6px 1px #818182; border-radius: 20px;" />
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-10">
                                                              <ul style="padding-top:15px;">
                                                                <li>
                                                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("User_Name") %>' style="font-weight:600;"></asp:Label>
                                                                    <asp:Label ID="lblreligion" runat="server" Text='<%# Bind("Request_Date") %>'></asp:Label>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Request_Time") %>'></asp:Label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <!--End Repeater-->
                                    </div>
                                </div>
                            </div>

                                    <div id="AcceptRequest" class="tab-pane fade in ">
                                       <div class="scrollbar scrollbar-primary">
                                    <div style="direction: ltr;">
                                        <!--Repeater 1-->
                                        <asp:Repeater ID="Repeater3" runat="server">
                                            <ItemTemplate>
                                                <div class="repeater">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <ul style="padding-top:4px;">
                                                                <li>
                                                                    <asp:Image ID="imgrequest" runat="server" ImageUrl='<%# Bind("profileimage") %>' Style="width:45px; height:45px; box-shadow: 0 1px 6px 1px #818182; border-radius: 20px;" />
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-10">
                                                              <ul style="padding-top:12px;">
                                                                <li>
                                                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("User_Name") %>' style="font-weight:600;"></asp:Label>
                                                                    <asp:Label ID="Label3" runat="server" Text="has Accepted your Request"></asp:Label>
                                                                    
                                                                </li>
                                                                <li>
                                                                     <asp:Label ID="lblreligion" runat="server" Text='<%# Bind("Accept_Date") %>'></asp:Label>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Accept_Time") %>'></asp:Label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <!--End Repeater-->
                                    </div>
                                </div>
                            </div>

                           <div id="Invitation" class="tab-pane fade in ">
                                 <div class="scrollbar scrollbar-primary">
                                    <div style="direction: ltr;">
                                        <!--Repeater 1-->
                                        <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand">
                                            <ItemTemplate>
                                                <div class="repeater2">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <ul style="padding-top:5px;">
                                                                <li>
                                                                    <asp:Image ID="imgrequest" runat="server" ImageUrl='<%# Bind("profileimage") %>' Style="width:45px; height:45px; box-shadow: 0 1px 6px 1px #818182; border-radius: 20px;" />
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-5">
                                                              <ul style="padding-top:10px;">
                                                                <li style="font-weight:600;">
                                                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("username") %>'></asp:Label><asp:Label ID="lblreligion" runat="server" Text='<%# Bind("caste") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hiddid" runat="server" Value='<%# Bind("Sender_Id")%>' />
                                                                </li>
                                                                <li>
                                                                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("Request_Date") %>'></asp:Label>
                                                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("Request_Time") %>'></asp:Label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-5">
                                                             <asp:Button ID="btnconfirm" runat="server" class="btnconfirm" Text="Confirm" CommandName="Confirm"/>
                                                             <asp:Button ID="btncancel" runat="server" class="btndelete" Text="Delete" CommandName="Delete"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <!--End Repeater-->
                                    </div>
                                </div>
                            </div>

                          <div id="Friends" class="tab-pane fade in">
                                 <div class="scrollbar scrollbar-primary">
                                    <div style="direction: ltr;">
                                        <!--Repeater 1-->
                                        <asp:Repeater ID="Repeater4" runat="server">
                                            <ItemTemplate>
                                                <div class="repeater2" style="width:360px;">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <ul style="padding-top:5px;">
                                                                <li>
                                                                    <asp:Image ID="imgrequest" runat="server" ImageUrl='<%# Bind("profileimage") %>' Style="width:45px; height:45px; box-shadow: 0 1px 6px 1px #818182; border-radius: 20px;" />
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-5">
                                                              <ul style="padding-top:17px;">
                                                                <li style="font-weight:600;">
                                                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("username") %>'></asp:Label><asp:Label ID="lblreligion" runat="server" Text='<%# Bind("caste") %>'></asp:Label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-5">
                                                             <asp:Button ID="btnconfirm" runat="server" class="btnFriends" Text=" Friends" style="margin-left:40px;"></asp:Button >
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <!--End Repeater-->
                                    </div>
                                </div>
                            </div>
                               <div id="Delete" class="tab-pane fade in ">
                                       <div class="scrollbar scrollbar-primary">
                                    <div style="direction: ltr;">
                                        <!--Repeater 1-->
                                        <asp:Repeater ID="Repeater5" runat="server">
                                            <ItemTemplate>
                                                <div class="repeater">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <ul style="padding-top:4px;">
                                                                <li>
                                                                    <asp:Image ID="imgrequest" runat="server" ImageUrl='<%# Bind("profileimage") %>' Style="width:45px; height:45px; box-shadow: 0 1px 6px 1px #818182; border-radius: 20px;" />
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-10">
                                                              <ul style="padding-top:12px;">
                                                                <li>
                                                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("User_Name") %>' style="font-weight:600;"></asp:Label>
                                                                    <asp:Label ID="Label3" runat="server" Text="has Declined your Request"></asp:Label>
                                                                    
                                                                </li>
                                                                <li>
                                                                    <asp:Label ID="lblreligion" runat="server" Text='<%# Bind("Accept_Date") %>'></asp:Label>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Accept_Time") %>'></asp:Label>
                                                                </li>
                                                            </ul>
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
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                    </div>
                </div>
                <!--End of Tab Content Row-->
            </div>
        
    </form>
</body>
</html>
