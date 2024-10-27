function initMapPerfil(country, city) {
    // Hacer una solicitud para obtener las coordenadas basadas en el país y la ciudad
    fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${city},${country}`)
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                var lat = data[0].lat;
                var lon = data[0].lon;

                // Inicializar el mapa en las coordenadas obtenidas
                var map = L.map('map').setView([lat, lon], 10);
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(map);

                // Añadir un marcador en la ubicación específica
                L.marker([lat, lon]).addTo(map)
                    .bindPopup(`<b>${city}, ${country}</b>`)
                    .openPopup();
            } else {
                console.error('Ubicación no encontrada.');
            }
        })
        .catch(error => console.error('Error:', error));
}
