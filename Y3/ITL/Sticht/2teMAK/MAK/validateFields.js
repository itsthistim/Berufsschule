function checkFields() {
    let firstname = document.getElementById('firstname');
    let lastname = document.getElementById('lastname');
    let email = document.getElementById('email');
    let country = document.getElementById('country');
    let plz = document.getElementById('PLZ');

    let welcomer = document.getElementById('welcomer');

    let log = document.getElementById('log');
    log.innerHTML = '';
    log.style.color = "red";

    let err = [];

    //required fields
    if (!firstname.value) {
        err.push("You did not enter a first name.")
    }
    if (!lastname.value) {
        err.push("You did not enter a last name.")
    }
    if (!email.value) {
        err.push("You did not enter an e-mail.")
    }
    if (!country.value) {
        err.push("You did not enter a country.")
    }
    if (!plz.value) {
        err.push("You did not enter a country code.")
    }

    // no duplicate names
    if (firstname.value == lastname.value) {
        err.push("Your first name and your last name can't be the same.")
    }

    if (!checkLen(firstname.value, 2)) {
        err.push("Your first name is too short.");
    }

    if (!checkLen(lastname.value, 3)) {
        err.push("Your last name is too short.");
    }

    
    err.forEach(error => {
        log.innerHTML += error + '<br>'
    });

    // change text in hero
    welcomer.innerText = `Welcome, ${firstname.value} ${lastname.value}`;
}

function checkLen(str, len) {
    if (str.length < len) {
        return false;
    }
    return true;
}