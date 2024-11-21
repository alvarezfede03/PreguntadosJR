const themeSwitches = document.querySelectorAll('.theme-switch');
const tables = document.querySelectorAll('table');
let gameContainer = document.querySelector('.game-container');

const originalBackgroundImage = gameContainer ? gameContainer.style.backgroundImage : '';

if (localStorage.getItem('dark-mode') === 'enabled') {
    document.body.classList.add('dark-mode');
    document.documentElement.setAttribute('data-bs-theme', 'dark');

    themeSwitches.forEach(switchElement => {
        switchElement.checked = true;
    });

    if (gameContainer !== null) {
        updateBackgroundImage(true);
    }
} else {
    themeSwitches.forEach(switchElement => {
        switchElement.checked = false;
    });
    document.documentElement.setAttribute('data-bs-theme', 'light');
}

themeSwitches.forEach(switchElement => {
    switchElement.addEventListener('change', () => {
        const isDarkMode = switchElement.checked;

        if (isDarkMode) {
            document.body.classList.add('dark-mode');
            localStorage.setItem('dark-mode', 'enabled');
            document.documentElement.setAttribute('data-bs-theme', 'dark');
        } else {
            document.body.classList.remove('dark-mode');
            localStorage.setItem('dark-mode', 'disabled');
            document.documentElement.setAttribute('data-bs-theme', 'light');
        }

        themeSwitches.forEach(sw => {
            sw.checked = isDarkMode;
        });

        if (gameContainer !== null) {
            updateBackgroundImage(isDarkMode);
        }
    });
});

function updateBackgroundImage(isDarkMode) {
    if (isDarkMode) {
        gameContainer.style.backgroundImage = originalBackgroundImage.replace('white', '#343a40');
    } else {
        gameContainer.style.backgroundImage = originalBackgroundImage.replace('#343a40', 'white');
    }
}
