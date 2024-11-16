const themeSwitches = document.querySelectorAll('.theme-switch');
const tables = document.querySelectorAll('table');
let gameContainer = document.querySelector('.game-container');

const originalBackgroundImage = gameContainer ? gameContainer.style.backgroundImage : '';

if (localStorage.getItem('dark-mode') === 'enabled') {
    document.body.classList.add('dark-mode');

    themeSwitches.forEach(switchElement => {
        switchElement.checked = true;
    });

    tables.forEach(table => {
        table.classList.remove('table-light');
        table.classList.add('table-dark');
    });

    if (gameContainer !== null) {
        updateBackgroundImage(true);
    }
} else {
    themeSwitches.forEach(switchElement => {
        switchElement.checked = false;
    });
}

themeSwitches.forEach(switchElement => {
    switchElement.addEventListener('change', () => {
        const isDarkMode = switchElement.checked;

        if (isDarkMode) {
            document.body.classList.add('dark-mode');
            localStorage.setItem('dark-mode', 'enabled');
        } else {
            document.body.classList.remove('dark-mode');
            localStorage.setItem('dark-mode', 'disabled');
        }

        themeSwitches.forEach(sw => {
            sw.checked = isDarkMode;
        });

        tables.forEach(table => {
            if (isDarkMode) {
                table.classList.remove('table-light');
                table.classList.add('table-dark');
            } else {
                table.classList.remove('table-dark');
                table.classList.add('table-light');
            }
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
