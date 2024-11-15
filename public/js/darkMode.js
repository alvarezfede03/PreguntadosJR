const themeSwitch = document.getElementById('themeSwitch');
const tables = document.querySelectorAll('table');
let gameContainer = document.querySelector('.game-container');

const originalBackgroundImage = gameContainer ? gameContainer.style.backgroundImage : '';

// Aplicar el estado almacenado
if (localStorage.getItem('dark-mode') === 'enabled') {
    document.body.classList.add('dark-mode');
    themeSwitch.checked = true;

    tables.forEach(table => {
        if (themeSwitch.checked) {
            table.classList.remove('table-light');
            table.classList.add('table-dark');
        } else {
            table.classList.remove('table-dark');
            table.classList.add('table-light');
        }
    });

    if (gameContainer !== null) {
        updateBackgroundImage(true);
    }
}

themeSwitch.addEventListener('change', () => {
    if (themeSwitch.checked) {
        document.body.classList.add('dark-mode');
        localStorage.setItem('dark-mode', 'enabled');
    } else {
        document.body.classList.remove('dark-mode');
        localStorage.setItem('dark-mode', 'disabled');
    }

    tables.forEach(table => {
        if (themeSwitch.checked) {
            table.classList.remove('table-light');
            table.classList.add('table-dark');
        } else {
            table.classList.remove('table-dark');
            table.classList.add('table-light');
        }
    });

    if (gameContainer !== null) {
        updateBackgroundImage(themeSwitch.checked);
    }
});

function updateBackgroundImage(isDarkMode) {
    if (isDarkMode) {
        gameContainer.style.backgroundImage = originalBackgroundImage.replace('white', '#343a40');
    } else {
        gameContainer.style.backgroundImage = originalBackgroundImage.replace('#343a40', 'white');
    }
}
