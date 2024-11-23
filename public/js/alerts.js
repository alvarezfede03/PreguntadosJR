document.addEventListener('DOMContentLoaded', function () {
    setTimeout(function () {
        // Seleccionamos ambas alertas
        let alerts = document.querySelectorAll('#alert-error, #alert-success');

        alerts.forEach(alert => {
            // Quitamos la clase 'show' para iniciar el efecto fade
            alert.classList.remove('show');

            // Usamos el evento 'transitionend' para esperar a que termine la animación
            alert.addEventListener('transitionend', function () {
                alert.remove(); // Eliminamos el alert del DOM después de la transición
            });
        });
    }, 5000);
});
