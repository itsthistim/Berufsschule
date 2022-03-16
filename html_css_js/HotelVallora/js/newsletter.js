const form = document.getElementById('form');
const dropdown = document.getElementById('aufmerksamvon');
const log = document.getElementById('logs');

form.addEventListener('submit', validateSubmit);

function validateSubmit(event) {
    let firstname = document.getElementById('vorname').value;
    let lastname = document.getElementById('nachname').value;
    let mail = document.getElementById('mail').value;
    let err = [validateName(firstname, lastname), validateMail(mail), validateAufmerksamkeit(dropdown.value)];

    let hasErr = false;

    for (let i = 0; i < err.length; i++) {
        const error = err[i];
        if (error != null) {
            hasErr = true;
            break;
        }
    }

    if (hasErr) {
        err.forEach(error => {
            if (error) {
                log.innerHTML += `${error}<br>`;
                alert(error);
            }
        });
        event.preventDefault();
    }
}

function validateName(firstname, lastname) {
    if (!firstname || !lastname) {
        return "Vor- und Nachname dürfen je nicht leer sein."
    }
    if (firstname == lastname) {
        return "Vor- und Nachname dürfen nicht gleich sein."
    }
}

function validateAufmerksamkeit(value) {
    if (!value) {
        return "Wovon sind Sie auf uns Aufmerksam geworden? Bitte füllen das Feld aus."
    }
}

function validateMail(mail) {
    if (!mail.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
        return "Sie haben keine gültige E-Mail-Adresse angegeben.";
    }
}