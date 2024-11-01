// Esperar a que el DOM esté completamente cargado
document.addEventListener("DOMContentLoaded", function() {
    // Obtener el elemento canvas por su ID
    const ctx = document.getElementById('miGraficoTorta');

    // Obtener los datos de los atributos data-labels y data-data
    const labels = JSON.parse(ctx.getAttribute('data-labels'));
    const data = JSON.parse(ctx.getAttribute('data-data'));

    // Obtener la etiqueta y texto del gráfico
    const chartLabel = document.getElementById('miGraficoTorta').dataset.chartLabel;
    const chartText = document.getElementById('miGraficoTorta').dataset.chartText;

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
    const miGraficoTorta = new Chart(ctx, config);
});