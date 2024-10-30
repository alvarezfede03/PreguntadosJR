const progressBar = document.getElementById('progress-bar');
const hiddenSubmit = document.getElementById('hiddenSubmit');

const totalTime = 15;
let timeLeft = totalTime;

progressBar.style.width = '100%';

const countdown = setInterval(() => {
    timeLeft--;

    const progressPercentage = (timeLeft / totalTime) * 100;
    progressBar.style.width = `${progressPercentage}%`;

    if (timeLeft <= 5) {
        progressBar.classList.remove('bg-success', 'bg-info');
        progressBar.classList.add('bg-warning');
    }
    if (timeLeft <= 3) {
        progressBar.classList.remove('bg-warning');
        progressBar.classList.add('bg-danger');
    }

    if (timeLeft <= 0) {
        clearInterval(countdown);
        progressBar.style.width = '0%';
        hiddenSubmit.click();
    }
}, 1000);