<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginpage.aspx.cs" Inherits="loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Catch Your Match</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="css/index.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class=" container-fluid" style="">
       <%-- <a href="loginpage.aspx">loginpage.aspx</a>--%>

        <div class="row" style="box-shadow:0px 1px 5px #ccc;">
            <div class="col-md-4" style="margin-top:20px;margin-bottom:5px;">
                <img src="logoimg/logo3.png" width="50%" height="50" /> </div>
            <div class="col-md-8">
                <asp:Label ID="lblid" runat="server" Text="" Visible="false"></asp:Label>
               
            </div>

        </div>

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="background: #f1f1f1;height: 500px;margin-top: 10px;">
                <div class="login-form" style="margin-top:0px;">
       <h1>Login</h1>
       <div class="txtb" style="margin-top:10px">
           <asp:TextBox ID="txtloginemail" runat="server"></asp:TextBox>
        <span data-placeholder="Username"></span>
     </div>
     <div id="loginemailerror" class="errormsg"></div>
     <div class="txtb">
          <asp:TextBox ID="txtloginpass" runat="server" TextMode="Password"></asp:TextBox>
       
       <span data-placeholder="password"></span>
     </div>
           <div id="loginpasserror" class="errormsg"></div>

      <asp:Button ID="btnlogin" class="btn-log" runat="server" OnClick="btnlogin_Click" OnClientClick="loginvalidate();" Text="Login" />
      
        <div class="bottom-text" style="margin:10px;text-align: left;  ">
         <a href="#">Forget password</a>
       </div>
       <div class="bottom-text">
         Don't have account? <a href="index.aspx" style="text-decoration:none; color:#000000">Sign Up</a>
       </div>

       </div>
                <script type="text/javascript">
     $(".txtb input").on("focus",function(){
       $(this).addClass("focus");
     });
     $(".txtb input").on("blur",function(){
      if($(this).val() == "")
       $(this).removeClass("focus");
     });
     
   </script>
            </div>
            <div class="col-md-2"></div>
        </div>

    
    </div>
    </form>
</body>
</html>
