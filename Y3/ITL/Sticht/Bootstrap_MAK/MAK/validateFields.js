window.onload = function() {
    document.getElementById('contactform').onsubmit = checkFields;
}

function checkFields() {
    let firstname = document.getElementById('firstname');
    let lastname = document.getElementById('lastname');
    let email = document.getElementById('email');
    let country = document.getElementById('country');
    let plz = document.getElementById('PLZ');
    let isValid = true;

    let welcomer = document.getElementById('welcomer');

    let log = document.getElementById('log');
    log.innerHTML = '';
    log.style.color = "red";

    let err = [];
    
    //required fields
    if (!firstname.value) {
        err.push("You did not enter a first name.");
        isValid = false;
    }
    if (!lastname.value) {
        err.push("You did not enter a last name.");
        isValid = false;
    }
    if (!email.value) {
        err.push("You did not enter an e-mail.");
        isValid = false;
    }
    if (!country.value) {
        err.push("You did not enter a country.");
        isValid = false;
    }
    if (!plz.value) {
        err.push("You did not enter a country code.");
        isValid = false;
    }

    // no duplicate names
    if (firstname.value == lastname.value) {
        err.push("Your first name and your last name can't be the same.")
        isValid = false;
    }

    if (!checkLen(firstname.value, 2)) {
        err.push("Your first name is too short.");
        isValid = false;
    }

    if (!checkLen(lastname.value, 3)) {
        err.push("Your last name is too short.");
        isValid = false;
    }

    
    err.forEach(error => {
        log.innerHTML += error + '<br>'
    });

    // change text in hero
    welcomer.innerText = `Welcome, ${firstname.value} ${lastname.value}`;
    return isValid;
}

function checkLen(str, len) {
    if (str.length < len) {
        return false;
    }
    return true;
}