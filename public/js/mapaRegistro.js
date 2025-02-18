var map = L.map('map').setView([-34.6037, -58.3816], 4);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

var marker = L.marker([-34.6037, -58.3816], {draggable: true}).addTo(map);

marker.on('dragend', function (e) {
    var latlng = marker.getLatLng();
    var lat = latlng.lat;
    var lon = latlng.lng;

    // Photon no admite geocodificación inversa directa, pero se puede buscar lugares cercanos con un "approximated search".
    fetch(`https://photon.komoot.io/reverse?lon=${lon}&lat=${lat}`)
        .then(response => response.json())
        .then(data => {
            if (data.features && data.features.length > 0) {
                const properties = data.features[0].properties;

                var country = properties.country || '';
                var city = properties.city || properties.name || '';

                document.getElementById('selectedCountry').value = country;
                document.getElementById('selectedCity').value = city;
                document.getElementById('country').value = country;
                document.getElementById('city').value = city;

                alert(`Ubicación seleccionada: ${country}, ${city}`);
            } else {
                alert('No se encontró información para las coordenadas seleccionadas.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('No se pudo obtener la información de la ubicación.');
        });
});
