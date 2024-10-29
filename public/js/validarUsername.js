function checkUsername() {
    const username = document.getElementById('username').value;
    const usernameError = document.getElementById('usernameError');

    // Hacer la solicitud AJAX solo si hay algún valor
    if (username.length > 0) {
        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/usuario/verificarUsername', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onload = function () {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);

                // Mostrar mensaje de error si el usuario ya existe
                if (response.existe) {
                    usernameError.style.display = 'block';
                } else {
                    usernameError.style.display = 'none';
                }
            }
        };

        xhr.send('username=' + encodeURIComponent(username));
    } else {
        usernameError.style.display = 'none';  // Ocultar mensaje si no hay texto
    }
}