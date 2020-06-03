function name() {

    var name = document.getElementById("txtusernname").value;
    if (name == "") {
        document.getElementById("nameerror").innerHTML = "Name is Empty";
    }
    else if (!isNaN(name)) {
        document.getElementById("nameerror").innerHTML = "Name is invalid";
    }
    else {
        document.getElementById("nameerror").innerHTML = "";
        return true;
    }
}

function email() {


    var email = document.getElementById("txtsignemail").value;
    var atposition = email.indexOf("@");
    var dotposition = email.dotposition;
    if (email == "") {
        document.getElementById("emailerror").innerHTML = "email is empty";
    }
    else if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= email.length) {
        document.getElementById("emailerror").innerHTML = "email is not correct";
    }
    else {
        document.getElementById("emailerror").innerHTML = "";
        return true;
    }

}
function password() {
    var password = document.getElementById("txtsignpass").value;
    if (password == "") {
        document.getElementById("passerror").innerHTML = "password is Empty";
    }
    else {
        document.getElementById("passerror").innerHTML = "";
        return true;
    }
}
function date() {
    var tdate = document.getElementById("txtdate").value;
    if (tdate == "") {
        document.getElementById("txtdateerror").innerHTML = "date is Empty";
    }
    else {
        document.getElementById("txtdateerror").innerHTML = "";
        return true;
    }
}
//function conformpassword() {
//    var password = document.getElementById("txtsignpass").value;
//    var confpass = document.getElementById("txtsigncpass").value;
//    if (confpass == "") {
//        document.getElementById("confpasserror").innerHTML = "confirm password is Empty";
//    }
//    else if (password != confpass) {
//        document.getElementById("confpasserror").innerHTML = " password not match";
//    }
//    else {
//        document.getElementById("confpasserror").innerHTML = "";
//        return true;
//    }
//}

function number() {
    var number = document.getElementById("txtsignnumber").value;
    if (number == "") {
        document.getElementById("numbererror").innerHTML = " number is empty";
    }
    else if (number.length != 10) {
        document.getElementById("numbererror").innerHTML = " number is wrong";
    }
    else if (isNaN(number)) {
        document.getElementById("numbererror").innerHTML = " enter number value only";

    }
    else {
        document.getElementById("numbererror").innerHTML = "";
        return true;
    }
}

function gender()
{
    var e = document.getElementById("ddlgender").value;
   // var check = e.options[e.selectedIndex].value;
    if(e == 0)
    {
        document.getElementById("txtgendererror").innerHTML = " select gender";
    }
    else {
        document.getElementById("txtgendererror").innerHTML = "";
        return true;
    }
}
function mothertongue() {
    var e = document.getElementById("ddlmothertongue").value;
    // var check = e.options[e.selectedIndex].value;
    if (e == 0) {
        document.getElementById("txtmothertonguelerror").innerHTML = " select mothertongue";
    }
    else {
        document.getElementById("txtmothertonguelerror").innerHTML = "";
        return true;
    }
}

function religion() {
    var e = document.getElementById("ddlreligion").value;
    // var check = e.options[e.selectedIndex].value;
    if (e == 0) {
        document.getElementById("txtreligionerror").innerHTML = " select religion";
    }
    else {
        document.getElementById("txtreligionerror").innerHTML = "";
        return true;
    }
}


function caste() {

    var name = document.getElementById("txtcaste").value;
    if (name == "") {
        document.getElementById("txtcasteerror").innerHTML = "Caste is Empty";
    }
    else if (!isNaN(name)) {
        document.getElementById("txtcasteerror").innerHTML = "Name is invalid";
    }
    else {
        document.getElementById("txtcasteerror").innerHTML = "";
        return true;
    }
}

function country() {
    var e = document.getElementById("ddlcountry").value;
    // var check = e.options[e.selectedIndex].value;
    if (e == 0) {
        document.getElementById("ddlcontryerror").innerHTML = " select contry";
    }
    else {
        document.getElementById("ddlcontryerror").innerHTML = "";
        return true;
    }
}
function state() {
    var e = document.getElementById("ddlstate").value;
    // var check = e.options[e.selectedIndex].value;
    if (e == 0) {
        document.getElementById("ddlstateerror").innerHTML = " select state";
    }
    else {
        document.getElementById("ddlstateerror").innerHTML = "";
        return true;
    }
}
function city() {
    var e = document.getElementById("ddlcity").value;
    // var check = e.options[e.selectedIndex].value;
    if (e == 0) {
        document.getElementById("ddlcityerror").innerHTML = " select city";
    }
    else {
        document.getElementById("ddlcityerror").innerHTML = "";
        return true;
    }
}
function profileforty() {
    var e = document.getElementById("ddlprofilefor").value;
    // var check = e.options[e.selectedIndex].value;
    if (e == 0) {
        document.getElementById("ddlprofileforerror").innerHTML = " select profilefor";
    }
    else {
        document.getElementById("ddlprofileforerror").innerHTML = "";
        return true;
    }
}


function validate() {

    //conformpassword();
    if (name() & email() & number() & password() & gender() & mothertongue() & religion() & caste() & country() & state() & city() & profileforty() & date()) {
        return true;
    }
    else {
        return false;
    }
}

function loginemail() {

    var loginemail = document.getElementById("loginemail").value;
    var atposition = loginemail.indexOf("@");
    var dotposition = loginemail.dotposition;
    if (loginemail == "") {
        document.getElementById("loginemailerror").innerHTML = "email is Empty";

    }
    else if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= loginemail.length) {
        document.getElementById("loginemailerror").innerHTML = "email is not correct";
    }
    else {
        document.getElementById("loginemailerror").innerHTML = "";
        return true;
    }

}
function loginpassword() {
    var loginpassword = document.getElementById("loginpass").value;
    if (loginpassword == "") {
        document.getElementById("loginpasserror").innerHTML = "password is Empty";
    }
    else {
        document.getElementById("loginpasserror").innerHTML = "";
        return true;
    }
}
function loginvalidate() {
    loginemail();
    loginpassword();

    if (loginemail() && loginpassword()) {
        return true;
    }
    else {
        return false;
    }
}




