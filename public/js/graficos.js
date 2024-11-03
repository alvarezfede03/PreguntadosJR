document.addEventListener("DOMContentLoaded", function () {
    const ctx = document.getElementById('miGraficoTorta');
    const labels = JSON.parse(ctx.getAttribute('data-labels'));
    const data = JSON.parse(ctx.getAttribute('data-data'));
    const chartLabel = ctx.dataset.chartLabel;
    const chartText = ctx.dataset.chartText;

    const config = {
        type: 'doughnut',
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
                            size: 18
                        }
                    }
                },
                title: {
                    display: true,
                    text: chartText,
                    font: {
                        size: 24,
                        weight: 'bold'
                    }
                }
            }
        }
    };

    let miGraficoTorta = new Chart(ctx, config);

    document.getElementById('filtrar_btn').addEventListener('click', function () {
        const fechaInicio = document.getElementById('fecha_inicio').value;
        const fechaFin = document.getElementById('fecha_fin').value;

        if (!fechaInicio || !fechaFin) {
            alert("Por favor, selecciona ambas fechas para aplicar el filtro.");
            return;
        }

        fetch('/admin/cantidadUsuariosXPais', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `fecha_inicio=${encodeURIComponent(fechaInicio)}&fecha_fin=${encodeURIComponent(fechaFin)}`
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error en la respuesta del servidor');
                }
                return response.json();
            })
            .then(data => {
                miGraficoTorta.data.labels = data.labels;
                miGraficoTorta.data.datasets[0].data = data.data;
                miGraficoTorta.update();
            })
            .catch(error => console.error('Error:', error));
    });
});
