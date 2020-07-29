<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rv.aspx.cs" Inherits="rv" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>

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
         .num {
            width:15px;
            border-radius:3px;
            position: absolute;
            margin-left:95px;
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
    </script>
</head>
<body>
    <form id="form1" runat="server">
       
        <div>  
      
        <br />  
        <br />  
        <br />  
        <br />  
        <asp:FileUpload ID="FileUpload1" runat="server" />  
        <br />  
        <br />  
        Width :<asp:TextBox ID="txtWidth" runat="server"></asp:TextBox>  
        <br />  
        <br />  
        Height :<asp:TextBox ID="txtHeight" runat="server"></asp:TextBox>  
        <br />  
        <br />  
        Output File Name :<asp:TextBox ID="txtOutputFileName" runat="server"></asp:TextBox>  
        <asp:Button ID="btnSubmit" runat="server" Text="Upload" OnClick="btnSubmit_Click"/>  
      
    </div>

        <div class="container" style="margin-top: 8%; width: 50%;">
            <div class="row">
                <div class="col-md-12">
                    <div class="profile-head">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <asp:LinkButton ID="lbtnSentRequest" class="nav-link" runat="server" style="color: #972cc3; position: relative;"
                                      OnClick="lbtnSentRequest_Click">
                            <img src="img/icons8-email-send-24.png" style="width: 20px; height: 20px; margin-top: -4px" />
                                    <asp:Label ID="lblSentRequest" runat="server" Text="" class="num"></asp:Label>
                                    Sent Request</asp:LinkButton>
                            </li>

                            <li class="nav-item" style="margin-left: 50px;">
                                 <asp:LinkButton ID="lbtnAcceptRequest" runat="server" class="nav-link" style="color: #972cc3; border: none;"
                                     OnClick="lbtnAcceptRequest_Click">
                                    <img src="img/icons8-checked-user-male-60.png" style="width: 20px; height: 20px; margin-top: -4px" />
                                    Accept</asp:LinkButton>
                            </li>

                            <li class="nav-item" style="margin-left: 50px;">
                                 <asp:LinkButton ID="lbtnInvitation" runat="server" class="nav-link" style="color: #972cc3; border: none;"
                                      OnClick="lbtnInvitation_Click">
                                    <img src="img/icons8-checked-user-male-60.png" style="width: 22px; height: 23px; margin-top: -4px" />
                                    Invitation</asp:LinkButton>
                            </li>

                            <li class="nav-item" style="margin-left: 50px;">
                                <asp:LinkButton ID="lbtnFriends" runat="server" class="nav-link" style="color: #972cc3; border: none;"
                                    OnClick="lbtnFriends_Click">
                                    <img src="img/icons8-checked-user-male-60.png" style="width: 22px; height: 23px; margin-top: -5px" />
                                    Friends</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-content">
            <div id="SentRequest" class="tab-pane fade in">
                <span>Hitesh 1</span>
            </div>
             <div id="AcceptRequest" class="tab-pane fade in ">
                <span>Hitesh 2</span>
            </div>
             <div id="Invitation" class="tab-pane fade in ">
                <span>Hitesh 3</span>
            </div>
            <div id="Friends" class="tab-pane fade in">
                <span>Hitesh 4</span>
            </div>
        </div>



    </form>
</body>
</html>
