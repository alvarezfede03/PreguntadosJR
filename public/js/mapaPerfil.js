function initMapPerfil(country, city) {
    fetch(`https://photon.komoot.io/api?q=${city},${country}`)
        .then(response => response.json())
        .then(data => {
            if (data.features && data.features.length > 0) {
                const [lon, lat] = data.features[0].geometry.coordinates;

                const map = L.map('map').setView([lat, lon], 10);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(map);

                L.marker([lat, lon]).addTo(map)
                    .bindPopup(`<b>${city}, ${country}</b>`)
                    .openPopup();
            } else {
                console.error('Ubicación no encontrada.');
            }
        })
        .catch(error => console.error('Error al obtener la ubicación:', error));
}
