document.addEventListener("DOMContentLoaded", function() {
    const enviar = document.getElementById("registro");
    const padre = document.getElementById("error_registro");

    const validations = [
        {
            elementId: "nombreUsuario",
            regex: /^[A-Za-záãäéëêíîóöúüñç\s]{3,}\s?$/,
            errorMessage: "Escriba Nombre valido</br>"
        },
        {
            elementId: "correoUsuario",
            regex: /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/,
            errorMessage: "Escriba un email valido</br>"
        },
        {
            elementId: "contraseñaUsuario",
            regex: /^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$/,
            errorMessage: "Su contraseña debe tener almenos una letra mayuscula una minuscula y un numero, minimo 8 caracteres</br>"
        }
    ];

    enviar.addEventListener("submit", function(e) {
        e.preventDefault();
        padre.innerHTML = "";
        let isValid = true;

        validations.forEach(({ elementId, regex, errorMessage }) => {
            const value = document.getElementById(elementId).value;
            if (!regex.test(value)) {
                padre.innerHTML += errorMessage;
                isValid = false;
            }
        });

        if (isValid) {
            enviar.submit();
        }
    });
});
