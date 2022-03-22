const form = document.getElementById('form');
const dropdown = document.getElementById('aufmerksamvon');
const log = document.getElementById('logs');

form.addEventListener('submit', validateSubmit);

function validateSubmit(event) {
    let firstname = document.getElementById('vorname').value;
    let lastname = document.getElementById('nachname').value;
    let mail = document.getElementById('mail').value;
    
    let err = [];
    validateName(err, firstname, lastname);
    validateMail(err, mail);
    validateAufmerksamkeit(err, dropdown.value);

    if (err.length > 0) {
        err.forEach(error => {
            if (error) {
                log.innerHTML += `${error}<br>`;
                alert(error);
            }
        });
        event.preventDefault();
    }
}

function validateName(err, firstname, lastname) {
    if (!firstname || !lastname) {
        err.push("Vor- und Nachname dürfen je nicht leer sein.");
    }
    if (firstname == lastname) {
        err.push("Vor- und Nachname dürfen nicht gleich sein.");
    }
}

function validateAufmerksamkeit(err, value) {
    if (!value) {
        err.push("Wovon sind Sie auf uns Aufmerksam geworden? Bitte füllen das Feld aus.")
    }
}

function validateMail(err, mail) {
    if (!mail.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
        err.push("Sie haben keine gültige E-Mail-Adresse angegeben.");
    }
}