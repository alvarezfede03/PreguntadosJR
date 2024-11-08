function validatePasswords() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm_password').value;
    const passwordError = document.getElementById('passwordError');

    if (password !== confirmPassword) {
        passwordError.style.display = 'block';
        return false;
    }
    passwordError.style.display = 'none';
    return true;
}

function validateLocation() {
    const country = document.getElementById("country").value;
    const city = document.getElementById("city").value;
    if (country === "" || city === "") {
        alert("Debes seleccionar un país y una ciudad en el mapa.");
        return false;
    }
    return true;
}

function validateForm() {
    if (!validatePasswords()) return false;
    if (!validateLocation()) return false;
    return true;
}

document.getElementById("formPreguntas").addEventListener("submit", function(event) {
    event.preventDefault();

    // Obtener los valores de los inputs de opciones
    const opcion1 = document.getElementById("opcion1").value.trim();
    const opcion2 = document.getElementById("opcion2").value.trim();
    const opcion3 = document.getElementById("opcion3").value.trim();
    const opcion4 = document.getElementById("opcion4").value.trim();

    // Obtener la opción seleccionada en el select
    const selectedOption = document.getElementById("opcionCorrecta").value;

    // Determinar el contenido del input correspondiente
    let correctAnswer = "";
    switch (selectedOption) {
        case "1":
            correctAnswer = opcion1;
            break;
        case "2":
            correctAnswer = opcion2;
            break;
        case "3":
            correctAnswer = opcion3;
            break;
        case "4":
            correctAnswer = opcion4;
            break;
        default:
            return null;
    }
    document.getElementById("opcionCorrectaTexto").value = correctAnswer;
    event.target.submit();
});