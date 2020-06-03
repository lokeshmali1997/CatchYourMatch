function ddlfamily() {
    var e = document.getElementById("ddlfamily").value;
    if (e == 0) {
        document.getElementById("ddlfamilyerror").innerHTML = " select family";
    }
    else {
        document.getElementById("ddlfamilyerror").innerHTML = "";
        return true;
    }
}

function ddlmaritalstatus() {
    var e = document.getElementById("ddlmaritalstatus").value;
    if (e == 0) {
        document.getElementById("ddlmaritalstatuserror").innerHTML = " select marital status";
    }
    else {
        document.getElementById("ddlmaritalstatuserror").innerHTML = "";
        return true;
    }
}

function ddlfamilystatus() {
    var e = document.getElementById("ddlfamilystatus").value;
    if (e == 0) {
        document.getElementById("ddlfamilystatuserror").innerHTML = " select family status";
    }
    else {
        document.getElementById("ddlfamilystatuserror").innerHTML = "";
        return true;
    }
}

function ddlheight() {
    var e = document.getElementById("ddlheight").value;
    if (e == 0) {
        document.getElementById("ddlheighterror").innerHTML = " select height";
    }
    else {
        document.getElementById("ddlheighterror").innerHTML = "";
        return true;
    }
}


function formvalidate1() {

    if (ddlfamily() & ddlmaritalstatus() & ddlfamilystatus() & ddlheight()) {
        return true;
    }
    else {
        return false;
    }
}

function age() {
    var number = document.getElementById("txtage").value;
    if (number == "") {
        document.getElementById("txtageerror").innerHTML = " age is empty";
    }
    else if (isNaN(number)) {
        document.getElementById("txtageerror").innerHTML = " enter number value only";

    }
    else if (number < 18) {
        document.getElementById("txtageerror").innerHTML = " only 18+ allowed";

    }
    else {
        document.getElementById("txtageerror").innerHTML = "";
        return true;
    }
}



function ddldeit() {
    var e = document.getElementById("ddldeit").value;
    if (e == 0) {
        document.getElementById("ddldeiterror").innerHTML = " select deit";
    }
    else {
        document.getElementById("ddldeiterror").innerHTML = "";
        return true;
    }
}

function ddldrinking() {
    var e = document.getElementById("ddldrinking").value;
    if (e == 0) {
        document.getElementById("ddldrinkingerror").innerHTML = " select drinking and smoking";
    }
    else {
        document.getElementById("ddldrinkingerror").innerHTML = "";
        return true;
    }
}

function ddlphysicalstatus() {
    var e = document.getElementById("ddlphysicalstatus").value;
    if (e == 0) {
        document.getElementById("ddlphysicalstatuserror").innerHTML = " select physical status";
    }
    else {
        document.getElementById("ddlphysicalstatuserror").innerHTML = "";
        return true;
    }
}


function formvalidate2() {

    if (age() & ddldeit() & ddldrinking() & ddlphysicalstatus()) {
        return true;
    }
    else {
        return false;
    }
}

function education() {

    var name = document.getElementById("txteducation").value;
    if (name == "") {
        document.getElementById("ddleducationerror").innerHTML = "Name is Empty";
    }
    else if (!isNaN(name)) {
        document.getElementById("ddleducationerror").innerHTML = "Name is invalid";
    }
    else {
        document.getElementById("ddleducationerror").innerHTML = "";
        return true;
    }
}


function ddlemployee() {
    var e = document.getElementById("ddlemployee").value;
    if (e == 0) {
        document.getElementById("ddlemployeeerror").innerHTML = " select employee";
    }
    else {
        document.getElementById("ddlemployeeerror").innerHTML = "";
        return true;
    }
}

function occupation() {

    var name = document.getElementById("txtoccupation").value;
    if (name == "") {
        document.getElementById("ddloccupationerror").innerHTML = "Name is Empty";
    }
    else if (!isNaN(name)) {
        document.getElementById("ddloccupationerror").innerHTML = "Name is invalid";
    }
    else {
        document.getElementById("ddloccupationerror").innerHTML = "";
        return true;
    }
}

function annualincome() {
    var number = document.getElementById("txtincome").value;
    if (number == "") {
        document.getElementById("ddlannualincomeerror").innerHTML = " income is empty";
    }
    else if (isNaN(number)) {
        document.getElementById("ddlannualincomeerror").innerHTML = " enter number value only";

    }

    else {
        document.getElementById("ddlannualincomeerror").innerHTML = "";
        return true;
    }
}


function formvalidate3() {

    if (education() & ddlemployee() & occupation() & annualincome()) {
        return true;
    }
    else {
        return false;
    }
}
