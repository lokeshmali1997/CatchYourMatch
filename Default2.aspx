<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            var min = parseInt($("#lblMin").text());
            var max = parseInt($("#lblMax").text());
            $("#slider-vertical").slider({
                range: "min",
                min: min,
                max: max,
                value: 60,
                slide: function (event, ui) {
                    $("#amount").val(ui.value);
                }
            });
            $("#amount").val($("#slider-vertical").slider("value"));
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <%--<div>
     <div>
           
                Min: <asp:Label ID="lblMin" runat="server" Text=""></asp:Label><br />
                Max: <asp:Label ID="lblMax" runat="server" Text=""></asp:Label><br />
            </div>
            <div id="slider-vertical" data-role="rangeslider" style="height: 10px;"></div>
            <p>
                <label for="amount">Volume:</label>
                <asp:TextBox ID="amount" runat="server" style="border: 0; color: #f6931f; font-weight: bold;"></asp:TextBox>
               
            </p>
        </div>--%>
  <div>
      <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        
        <td>
            <asp:TextBox ID="txtsendmail" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btnGenerate" Text="Generate OTP" runat="server" OnClick="GenerateOTP" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="3">
            OTP:
            <asp:TextBox ID="textBox3" runat="server">

            </asp:TextBox>
            <asp:Button ID="btnverify" runat="server" Text="verify" OnClick="btnverify_Click" />
            <asp:Label ID="lblOTP" runat="server"  />
        </td>
    </tr>
</table>
      </div>
    </form>
</body>
</html>
