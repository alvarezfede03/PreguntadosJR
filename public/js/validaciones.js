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