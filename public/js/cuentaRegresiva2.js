// Barra de progreso secundaria
const progressBar2 = document.getElementById('progress-bar2');
const pregunta32 = document.getElementById('pregunta32');

const totalTime2 = 3;
let timeLeft2 = totalTime2;
let countdown2;

progressBar2.style.width = '100%';

function startCountdown() {
    countdown2 = setInterval(() => {
        timeLeft2--;

        const progressPercentage2 = (timeLeft2 / totalTime2) * 100;
        progressBar2.style.width = `${progressPercentage2}%`;

        if (timeLeft2 <= 0) {
            clearInterval(countdown2);
            pregunta32.click();
            resetCountdown();
        }
    }, 1000);
}

function pauseCountdown() {
    clearInterval(countdown2);
}

startCountdown();

const reportModal = document.getElementById('reportModal');

reportModal.addEventListener('show.bs.modal', pauseCountdown);
reportModal.addEventListener('hide.bs.modal', startCountdown);