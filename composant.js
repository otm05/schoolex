function liactiv(x) {
    var dashboard = document.getElementById("dashboard");
    var config = document.getElementById("config");
    var mailapp = document.getElementById("mailapp");
    var payment = document.getElementById("payment");
    var absence = document.getElementById("absence");
    var exercices = document.getElementById("exercices");
    var controles = document.getElementById("controles");
    if (x == 'li-dashboard') {


        dashboard.classList.add("activ");

    } else {

        dashboard.classList.remove("activ");
    }
    if (x === 'li-config') {


        config.classList.add("activ");

    } else {

        config.classList.remove("activ");
    }
    if (x == "li-mailapp") {

        mailapp.classList.add("activ");
    } else {

        mailapp.classList.remove("activ");
    }
    if (x == "li-payment") {

        payment.classList.add("activ");
    } else {

        payment.classList.remove("activ");
    }
    if (x == "li-absence") {

        absence.classList.add("activ");
    } else {

        absence.classList.remove("activ");
    }
    if (x == "li-exercices") {

        exercices.classList.add("activ");
    } else {

        exercices.classList.remove("activ");
    }
    if (x == "li-controles") {

        controles.classList.add("activ");
    } else {

        controles.classList.remove("activ");
    }
}

function hide(x) {
    var hidetag = document.getElementById(x);

    if (hidetag.style.display == "flex") {
        hidetag.style.display = "none";

    }

}

function hideall() {
    hide('li-config');
    hide('li-mailapp');
    hide('li-payment');
    hide('li-absence');
    hide('li-exercices');
    hide('li-controles');
    hide('li-notification');
    hide('li-profil');

}

function myFunction() {
    var element = document.getElementById("myDIV");
    element.classList.add("activ");
}

function show(x) {
    hideall();
    var hidetag = document.getElementById(x);

    if (hidetag.style.display == "none") {
        hidetag.style.display = "flex";

    } else {
        hidetag.style.display = "none";
    }
    liactiv(x);
}

function show(x) {
    hideall();
    var hidetag = document.getElementById(x);

    if (hidetag.style.display == "none") {
        hidetag.style.display = "flex";

    } else {
        hidetag.style.display = "none";
    }
    liactiv(x);
}

function redirect() {
    window.location.href = "http://www.w3schools.com";
}