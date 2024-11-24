document.addEventListener('DOMContentLoaded', function () {
    setTimeout(function () {
        let alerts = document.querySelectorAll('#alert-error, #alert-success, #alert-warning');

        alerts.forEach(alert => {
            alert.classList.remove('show');

            alert.addEventListener('transitionend', function () {
                alert.remove();
            });
        });
    }, 5000); // Valor en milisegundos, controla cuanto tiempo tarda el alert en desaparecer.
});
