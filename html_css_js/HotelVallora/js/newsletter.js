window.onsubmit = function () {
    let firstname = document.getElementById('vorname').value;
    let lastname = document.getElementById('nachname').value;
    let mail = document.getElementById('mail').value;

    let err = [validateName(firstname, lastname), validateMail(mail)];

    if (err.length > 0) {
        err.forEach(error => {
            if (error) {
                let log = document.createElement('p');
                let errnode = document.createTextNode(error);
                log.appendChild(errnode);
                document.getElementById("logs").appendChild(log);
                alert(error);
            }
        });
    }

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