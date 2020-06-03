<%@ Page Language="C#" AutoEventWireup="true" CodeFile="savedetails.aspx.cs" Inherits="savedetails" %>

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
        .ddl{
            border-bottom:1px solid #adadad;
        }
        .mydropdownlist
           {
          outline:none;
          border:none;
          font-family: Calibri;
          font-size: 15px;
	      color: #777777;
	      width: 100%;
	      font-weight:normal;
	      padding: 10px 5px;
          margin-top:25px;
          width:100%;
          

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
        .formdetail a{
           font-size:16px;
           text-align:center;
           text-decoration:none;
           color:#fff;
           padding-top:10px;
           font-weight:500;
	       }
        .ptxt{
            font-size:16px;
            color: #adadada6;
            text-align:center;
        }
        #txtabout{
            width:100%;
            resize:none;
            border:none;
            outline:none;
            text-align:justify;
            color:#000;
            margin-top:10px;
           border-bottom:1px solid #adadad;
           font-size:12px;

        }
       
    </style>
    <script>

        $(document).ready(function () {
            $("#btnnext1").click(function () {
                
                if (formvalidate1())
                {
                    $("#formdetail2").css("display", "block");
                }
                


            });
            $("#btnnext2").click(function () {

                if (formvalidate2()) {
                    $("#formdetail3").css("display", "block");
                }



            });
            $("#btnnext3").click(function () {

                
                if(formvalidate3()) {
                    $("#formdetail4").css("display", "block");
                }



            });
        });
        
    </script>


</head>
<body>
    <form id="form1" runat="server">
 <div class=" container-fluid" style=" padding:0px;">

        <div class="row" style="box-shadow:0px 1px 5px #ccc;">
            <div class="col-md-4" style="margin-top:20px;margin-bottom:5px;">
                <img src="logoimg/logo3.png" width="50%" height="60" />
            </div>
           <div class="col-md-6">
              

           </div>
             <div class="col-md-2" style="margin-top:30px">
                <%--<asp:Label ID="lblusername" runat="server" Text="label"></asp:Label>--%>
            </div>

        </div>

        <div class="row" style="background: #f1f1f1;height: 500px;margin-top: 10px;">
            <div class="col-md-2">
                 <asp:Label ID="lblname" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblemail" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblpass" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lbldob" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblgender" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblmothert" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblreligion" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblcaste" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblcountry" Visible="false" runat="server" Text="Label"></asp:Label>
                 <asp:Label ID="lblstate" Visible="false" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblcity" Visible="false" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblnumber" Visible="false" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblprofile" Visible="false" runat="server" Text="Label"></asp:Label>
               
            </div>

            

                <div class="col-md-8 formdetail" id="formdetail1" style="background-color:#fff;display:;">
                                <div class="row">
                                    <p class="ptxt">Welcome to CatchYourMacth.com!!</p>
                                    <p style="font-size:18px;text-align:center;margin:0px">Create Your Profile</p>
                                    <div class="ddl">
                                        
                                          <asp:DropDownList ID="ddlfamily" CssClass="mydropdownlist" runat="server">
                                          
                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddlfamilyerror" class="errormsg"></span>
                                </div>
                                <div class="row">
                                    <div class="ddl">
                                       
                                         <asp:DropDownList ID="ddlmaritalstatus" CssClass="mydropdownlist" runat="server">
                                             
                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddlmaritalstatuserror" class="errormsg"></span>
                                </div>
                                 <div class="row">
                                    <div class="ddl">
                                     <asp:DropDownList ID="ddlfamilystatus" CssClass="mydropdownlist" runat="server">
              
                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddlfamilystatuserror" class="errormsg"></span>
                                </div>
                                    <div class="row">
                                    <div class="ddl">
                                       
                                         <asp:DropDownList ID="ddlheight" CssClass="mydropdownlist" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddlheighterror" class="errormsg"></span>
                                </div>

                  
                     <a href="#" id="btnnext1" class="btn-log"  >NEXT</a>
          </div>

            

            <div class="col-md-8 formdetail" id="formdetail2" style="background-color:#fff;display:none">
                                <div class="row">
                                    <p class="ptxt">Welcome to CatchYourMacth.com!</p>
                                    <p style="font-size:18px;text-align:center;margin:0px">Create Your Personal Details</p>
                                    <div class="ddl">
                                        
                                        <asp:TextBox ID="txtage" runat="server" Width="100%" class="mydropdownlist" placeholder="Age*"></asp:TextBox>
                                    </div>
                                    <span id="txtageerror" class="errormsg"></span>
                                </div>
                                <div class="row">
                                    <div class="ddl">
                                       
                                         <asp:DropDownList ID="ddldeit" CssClass="mydropdownlist" runat="server">

                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddldeiterror" class="errormsg"></span>
                                </div>
                                 <div class="row">
                                    <div class="ddl">
                                        <asp:DropDownList ID="ddldrinking" CssClass="mydropdownlist" runat="server">
                                           
                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddldrinkingerror" class="errormsg"></span>
                                </div>
                                    <div class="row">
                                    <div class="ddl">
                                       
                                         <asp:DropDownList ID="ddlphysicalstatus" CssClass="mydropdownlist" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddlphysicalstatuserror" class="errormsg"></span>
                                </div>


               
               <a href="#" id="btnnext2" class="btn-log" >NEXT</a>
                                
                
                
     </div>
           
            <div class="col-md-8 formdetail" id="formdetail3" style="background-color:#fff;display:none">
                                <div class="row">
                                    <p class="ptxt">Welcome to CatchYourMacth.com!</p>
                                    <p style="font-size:18px;text-align:center;margin:0px">Professional & Career Details</p>
                                    <div class="ddl">
                                        
                                        <asp:TextBox ID="txteducation" runat="server" CssClass="mydropdownlist" placeholder="Heighest Education*"></asp:TextBox>
                                    </div>
                                    <span id="ddleducationerror" class="errormsg"></span>
                                </div>
                                <div class="row">
                                    <div class="ddl">
                                       
                                         <asp:DropDownList ID="ddlemployee" CssClass="mydropdownlist" runat="server">
                                             
                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddlemployeeerror" class="errormsg"></span>
                                </div>
                                 <div class="row">
                                    <div class="ddl">
                                        <asp:TextBox ID="txtoccupation" runat="server" CssClass="mydropdownlist" placeholder="Occupation*"></asp:TextBox>                                        </asp:DropDownList>
                                    </div>
                                    <span id="ddloccupationerror" class="errormsg"></span>
                                </div>
                                    <div class="row">
                                    <div class="ddl">
                                       
                                         <asp:TextBox ID="txtincome" runat="server" CssClass="mydropdownlist" placeholder="Annual Income*"></asp:TextBox>
                                    </div>
                                    <span id="ddlannualincomeerror" class="errormsg"></span>
                                </div>


               
               <a href="#" id="btnnext3" class="btn-log" >NEXT</a>
                                
                
                
     </div>

            <div class="col-md-8 formdetail" id="formdetail4" style="background-color:#fff;display:none">
                              
                <div class="row">
                                   <p class="ptxt">Welcome to CatchYourMacth.com!</p>
                                    <p style="font-size:18px;text-align:center;margin:0px">Upload Your Profile Picture</p>
                                    
                                    <div class="row">
                            <label style="font-weight:normal;color:#ccc;font-size:12px"></label>            
                                        <img src="img/edit-profile-vector-icon.jpg" width="100" height="100" style="margin:10px 10px 10px 160px"/>
            
                                        <asp:FileUpload ID="FileUpload1" runat="server" style="margin-left:170px;" />
                                    </div>
                                    <span id="ddleducationerrorrr" class="errormsg"></span>
                                </div>
                
                
                  <div class="row">
                                    <div class="">
                            <label style="font-weight:normal;color:#ccc;font-size:12px;margin-top:30px;">About yourSelf</label>            
                           <asp:TextBox ID="txtabout" runat="server" TextMode="MultiLine" Rows="4"
                               placeholder="Example: I am a successful professional working with a well knows company.We are a close-knit family with modern values.I enjoy reading and i am looking or someone who believes that marriage is a journey for growth and fulfilment.  "
                               
                               ></asp:TextBox>   
                                           
                                        
                                    </div>
                                    <span id="ddleducationerrorr" class="errormsg"></span>
                                </div>

                <asp:Button ID="btnsavedetails" runat="server" class="btn-log" OnClick="btnsavedetails_Click" Text="SAVE DETAILS" />
               
                                
                
                
     </div>

            <div class="col-md-2"></div>
             </div>
            
        </div>

    
    
    </form>
</body>
</html>
