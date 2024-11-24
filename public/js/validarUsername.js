function checkUsername() {
    const username = document.getElementById('username').value;
    const usernameError = document.getElementById('usernameError');

    if (username.length > 0) {
        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/usuario/verificarUsername', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onload = function () {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                isUsernameDuplicate = response.existe;
                if (response.existe) {
                    usernameError.style.display = 'block';
                } else {
                    usernameError.style.display = 'none';
                }
            }
        };

        xhr.send('username=' + encodeURIComponent(username));
    } else {
        usernameError.style.display = 'none';
        isUsernameDuplicate = false; // No hay duplicados si el campo está vacío
    }
}
