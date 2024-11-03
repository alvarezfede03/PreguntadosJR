let miGraficoTorta; // Definido en el ámbito global

document.addEventListener("DOMContentLoaded", function() {
    // Obtener el elemento canvas por su ID
    const ctx = document.getElementById('miGraficoTorta');

    // Obtener los datos de los atributos data-labels y data-data
    const labels = JSON.parse(ctx.getAttribute('data-labels'));
    const data = JSON.parse(ctx.getAttribute('data-data'));

    // Obtener la etiqueta y texto del gráfico
    const chartLabel = ctx.dataset.chartLabel;
    const chartText = ctx.dataset.chartText;

    // Configuración del gráfico
    const config = {
        type: 'doughnut', // Tipo de gráfico
        data: {
            labels: labels,
            datasets: [{
                label: chartLabel,
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        font: {
                            size: 18, // Tamaño de la fuente de la leyenda
                        }
                    }
                },
                title: {
                    display: true,
                    text: chartText,
                    font: {
                        size: 24, // Tamaño de la fuente
                        weight: 'bold', // Peso de la fuente
                    }
                }
            }
        }
    };

    // Crear el gráfico
    miGraficoTorta = new Chart(ctx, config);
});

document.getElementById("filtrar_btn").addEventListener("click", function() {
    const fecha_inicio = document.getElementById("fecha_inicio").value;
    const fecha_fin = document.getElementById("fecha_fin").value;

    if (!fecha_inicio || !fecha_fin) {
        alert("Por favor, seleccione ambas fechas.");
        return;
    }

    // Crear un objeto con los datos a enviar
    const data = {
        fecha_inicio: fecha_inicio,
        fecha_fin: fecha_fin
    };

    fetch('/admin/cantidadUsuariosXPais', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json', // Especificamos el tipo de contenido
        },
        body: JSON.stringify(data) // Convertimos el objeto a JSON
    })
        .then(response => {
            // Comprobamos si la respuesta es válida
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json(); // Convertimos la respuesta a JSON
        })
        .then(data => {
            console.log(data); // Para verificar que los datos son correctos
            // Actualizamos los datos del gráfico
            miGraficoTorta.data.labels = data.labels;
            miGraficoTorta.data.datasets[0].data = data.data;
            miGraficoTorta.update();
        })
        .catch(error => {
            console.error('Error en la solicitud:', error);
            alert("Error al obtener datos. Intente nuevamente.");
        });
});
