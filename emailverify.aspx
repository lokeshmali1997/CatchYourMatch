<%@ Page Language="C#" AutoEventWireup="true" CodeFile="emailverify.aspx.cs" Inherits="emailverify" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="css/index.css" rel="stylesheet" />
    <script src="css/formvalidation.js"></script>
    <style>
        .row{
            margin:0px;
        }
        
      
        .errormsg{color:red;font-size:11px;}
        .formdetail{
            background:#fff;
            width:40%;
            position: absolute;
            margin-top: 30px;
            padding:30px;
	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
            
        }
         .ptxt{
             margin-top:10px;
            font-size:16px;
            color: #adadada6;
            text-align:center;
        }
        
        #txtverify{
            width:100%;
       
            border:none;
            outline:none;
            text-align:justify;
            color:#000;
            height:40px;
            margin-top:10px;
           border:1px solid #adadad;
           font-size:12px;
           padding:10px;
           margin-top:10px;
        }
        .btn-log{
            margin-top:30px;
            margin-bottom:20px;
        }
       
    </style>
    <script>    
    </script>


</head>
<body>
    <form id="form1" runat="server">
 <div class=" container-fluid" style=" padding:0px;">

        <div class="row" style="box-shadow:0px 1px 5px #ccc;">
            <div class="col-md-4" style="margin-top:20px;margin-bottom:5px;">
                <img src="logoimg/logo3.png" width="50%" height="60" />
            </div>
           <div class="col-md-8">
               <asp:Label ID="txtemail" Visible="false" runat="server" Text="Label"></asp:Label>
           </div>
            
</div>
        <div class="row" style="background: #f1f1f1;height: 500px;margin-top: 10px;">
            <div class="col-md-2">
                
               
            </div>      

            <div class="col-md-8 formdetail" id="formdetail4" style="background-color:#fff;">
                              
              
                
                
                  <div class="row">
                      <p class="ptxt">Welcome to CatchYourMacth.com!!</p>
                        <p style="font-size:18px;text-align:center;margin:0px">Please Verify Your Email</p>
                                   
                        <div class="">
                            <label style="font-weight:normal;color:#777777;font-size:14px;margin-top:80px;">Enter Six Digit Code</label>            
                            <asp:TextBox ID="txtverify" runat="server" placeholder="Enter Your Otp" ></asp:TextBox>   
                           </div>
                                <span id="ddleducationerrorr" class="errormsg"></span>
                                </div>

                <asp:Button ID="btnverify" runat="server" class="btn-log" OnClick="btnverify_Click" Text="VERIFY" />
               
                <asp:LinkButton ID="LinkButton1" runat="server" style="text-decoration:none" OnClick="LinkButton1_Click">Resend Code</asp:LinkButton>    
                
                
     </div>

            <div class="col-md-2"></div>
             </div>
            
        </div>

    
    
    </form>
</body>
</html>
