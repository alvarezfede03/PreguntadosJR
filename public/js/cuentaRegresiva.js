// Barra de progreso principal
const progressBar = document.getElementById('progress-bar');
const hiddenSubmit = document.getElementById('hiddenSubmit');

const totalTime = 15; // 15 segundos para responder la pregunta
let countdown;

// Funcion para que al actualizar o salir de la pagina recuerde el tiempo restante de la progressbar
function getTimeLeft() {
    const storedTime = localStorage.getItem('timeLeft');
    return storedTime !== null ? parseInt(storedTime, 10) : totalTime;
}

function updateProgressBar(timeLeft) {
    const progressPercentage = (timeLeft / totalTime) * 100;
    progressBar.style.width = `${progressPercentage}%`;

    progressBar.classList.remove('bg-success', 'bg-warning', 'bg-danger');
    if (timeLeft <= 5) { // Cuando quedan 5 segundos o menos
        progressBar.classList.remove('bg-success', 'bg-info');
        progressBar.classList.add('bg-warning');
    }
    if (timeLeft <= 3) { // Cuando quedan 3 segundos o menos
        progressBar.classList.remove('bg-warning');
        progressBar.classList.add('bg-danger');
    }
}

function startCountdown() {
    let timeLeft = getTimeLeft();

    updateProgressBar(timeLeft);

    countdown = setInterval(() => {
        timeLeft--;

        updateProgressBar(timeLeft);

        localStorage.setItem('timeLeft', timeLeft);

        if (timeLeft <= 0) { // Cuando llega a 0 envia el click
            clearInterval(countdown);
            localStorage.removeItem('timeLeft');
            progressBar.style.width = '0%';
            hiddenSubmit.click();
        }
    }, 1000);
}

function resetCountdown() {
    clearInterval(countdown);
    localStorage.setItem('timeLeft', totalTime);
    startCountdown();
}

startCountdown();

const buttons = document.querySelectorAll('form button[type="submit"]');

buttons.forEach(button => {
    button.addEventListener('click', (event) => {
        resetCountdown();
    });
});