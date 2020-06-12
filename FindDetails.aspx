<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindDetails.aspx.cs" Inherits="FindDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
    <style>
        .scrollbar {
margin-left: 30px;
float: left;
height: 300px;
background: #fff;
overflow-y: scroll;
margin-bottom: 25px;
width:700px;
direction:rtl;
}


.scrollbar-primary::-webkit-scrollbar {
width: 2px;
background-color: #F5F5F5; }

.scrollbar-primary::-webkit-scrollbar-thumb {
border-radius: 10px;
background-color: #ff0000;

}
</style>
</head>
<body style="background-color: #f4f5fa;">
    <form id="form1" runat="server">
    <div>
  <div class="scrollbar scrollbar-primary" style="margin-top:100px;">
  


<!--Dummy sections with IDs coressponding with the links above-->
<div id="test1" style="direction:ltr;">
  <h3>Section 1</h3>
  <hr>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
</div>


<div id="test2" style="direction:ltr;">
  <h3>Section 2</h3>
  <hr>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
  <h5>Smooth Scroll Example</h5>
</div>
      </div>

    </div>
    </form>
</body>
</html>
