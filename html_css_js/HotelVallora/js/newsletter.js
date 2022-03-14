window.onsubmit = function () {
    let firstname = document.getElementById('vorname').value;
    let lastname = document.getElementById('nachname').value;
    let mail = document.getElementById('mail').value;
    let log = document.createElement("p");

    let err = validateName(firstname, lastname);

    if (err) {
        log.appendChild(err);
        document.getElementsByTagName("body")[0].appendChild(log);
        alert(err);
    }

    if (!isValidMail(mail)) {
        log.appendChild("Sie haben keine gültige E-Mail-Adresse angegeben.");
        document.getElementById("log")[0].appendChild(log);
        alert("Sie haben keine gültige E-Mail-Adresse angegeben.");
    }
}

function validateName(firstname, lastname) {
    if (!firstname || !lastname) {
        return "Vor- und Nachname dürfen je nicht leer sein."
    }
    if (firstname == lastname) {
        return "Vor- und Nachname dürfen nicht gleich sein."
    }

    return null;
}

function isValidMail(mail) {
    if (!mail.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
        return false;
    }

    return true;
}