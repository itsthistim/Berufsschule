window.onsubmit = function () {
    let firstname = document.getElementById('vorname').value;
    let lastname = document.getElementById('nachname').value;
    let mail = document.getElementById('mail').value;
    let log = document.createElement('p');

    let err = [validateName(firstname, lastname), validateMail(firstname, lastname)];

    if (err.length > 0) {
        let errnode = document.createTextNode(err);
        log.appendChild(errnode);

        document.getElementById("logs").appendChild(log);
        alert(err);
    }

    // if (!isValidMail(mail)) {
    //     let errnode = document.createTextNode("Sie haben keine gültige E-Mail-Adresse angegeben.");
    //     log.appendChild(errnode);

    //     document.getElementById("logs").appendChild(log);
    //     alert("Sie haben keine gültige E-Mail-Adresse angegeben.");
    // }

    return false;
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

function validateMail(mail) {
    if (!mail.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
        return "Sie haben keine gültige E-Mail-Adresse angegeben.";
    }

    return null;
}