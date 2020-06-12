<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='https://code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>


    <script type='text/javascript'>
        $(function () {
            $("#txtdate").datepicker({
                calendarWeeks: true,
                todayHighlight: true,
                autoclose: true
            });
        });

    </script>



    <link href="css/index.css" rel="stylesheet" />
    <script src="css/JavaScript.js"></script>
    <style>
        .row {
            margin: 0px;
        }

        .container-fluid {
            padding-left: 0px;
            padding-right: 0px;
        }

        #btnlogin {
            margin-left: 30px;
        }

        .ddl {
            border-bottom: 2px solid #adadad;
        }

        .mydropdownlist {
            color: #adadad;
            padding: 5px 0px;
            outline: none;
            border: none;
            background-color: #f1f1f1;
            width: 100%;
            margin: 10px 0;
        }

        .errormsg {
            color: red;
            font-size: 11px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="background-image: url(img/d.jpg); height:722px; background-size: 100% 722px; background-repeat: no-repeat">
                <div class="col-md-8">
                </div>
                <div class="registerform col-md-4">
                    <div class="row login">
                        <div class="col-md-12  ">
                            <div class="login-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="txtb">
                                            <asp:TextBox ID="txtusernname" runat="server"></asp:TextBox>
                                            <span data-placeholder="Login Name"></span>
                                        </div>
                                        <span id="nameerror" class="errormsg"></span>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="txtb">
                                            <asp:TextBox ID="txtsignemail" runat="server"></asp:TextBox>
                                            <span data-placeholder="Email"></span>
                                        </div>
                                        <span id="emailerror" class="errormsg"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="txtb">
                                            <asp:TextBox ID="txtsignpass" runat="server" TextMode="Password"></asp:TextBox>
                                            <span data-placeholder="password"></span>
                                        </div>
                                        <span id="passerror" class="errormsg"></span>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="txtb">
                                            <asp:TextBox ID="txtdate" runat="server"></asp:TextBox>
                                            <span data-placeholder="Date Of Birth"></span>
                                        </div>

                                        <span id="txtdateerror" class="errormsg"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="" style="border-bottom: 2px solid #adadad">
                                            <asp:DropDownList ID="ddlgender" CssClass="mydropdownlist" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <span id="txtgendererror" class="errormsg"></span>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="ddl">
                                            <asp:DropDownList ID="ddlmothertongue" CssClass="mydropdownlist" runat="server"></asp:DropDownList>
                                        </div>
                                        <span id="txtmothertonguelerror" class="errormsg"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="ddl">
                                            <asp:DropDownList ID="ddlreligion" CssClass="mydropdownlist" runat="server"></asp:DropDownList>
                                        </div>
                                        <span id="txtreligionerror" class="errormsg"></span>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="txtb">
                                            <asp:TextBox ID="txtcaste" runat="server"></asp:TextBox>
                                            <span data-placeholder="Caste*"></span>
                                        </div>
                                        <span id="txtcasteerror" class="errormsg"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="ddl">
                                            <asp:DropDownList ID="ddlcountry" CssClass="mydropdownlist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <span id="ddlcontryerror" class="errormsg"></span>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="ddl">
                                            <asp:DropDownList ID="ddlstate" CssClass="mydropdownlist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <span id="ddlstateerror" class="errormsg"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="ddl">
                                            <asp:DropDownList ID="ddlcity" CssClass="mydropdownlist" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <span id="ddlcityerror" class="errormsg"></span>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="txtb">
                                            <asp:TextBox ID="txtsignnumber" runat="server"></asp:TextBox>
                                            <span data-placeholder="Mobile Number"></span>
                                        </div>
                                        <span id="numbererror" class="errormsg"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="ddl">
                                            <asp:DropDownList ID="ddlprofilefor" CssClass="mydropdownlist" runat="server"></asp:DropDownList>
                                        </div>
                                        <span id="ddlprofileforerror" class="errormsg"></span>
                                    </div>
                                    <div class="col-md-6">
                                    </div>
                                </div>

                                <asp:Button ID="btnsignup" class="btn-log" runat="server" Text="REGISTER NOW" OnClick="btnsignup_Click" OnClientClick="return validate();" />
                                <h5 style="margin: 10px 130px">Do have account?<a href="loginpage.aspx" style="color: #000; font-size: 16px; text-decoration: none">Login</a></h5>
                            </div>

                        </div>
                    </div>
                    <script type="text/javascript">
                        $(".txtb input").on("focus", function () {
                            $(this).addClass("focus");
                        });
                        $(".txtb input").on("blur", function () {
                            if ($(this).val() == "")
                                $(this).removeClass("focus");
                        });

                    </script>
                </div>
            </div>
        </div>
        </form>
</body>
</html>
