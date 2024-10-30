// Inicializar el mapa centrado en una ubicación por defecto
var map = L.map('map').setView([-34.6037, -58.3816], 4);

// Añadir una capa de OpenStreetMap
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

// Añadir un marcador que puede ser arrastrado
var marker = L.marker([-34.6037, -58.3816], {draggable: true}).addTo(map);

// Evento para cuando el marcador sea arrastrado
marker.on('dragend', function(e) {
    var latlng = marker.getLatLng();
    var lat = latlng.lat;
    var lon = latlng.lng;

    // Hacer la solicitud a Nominatim para obtener país y ciudad
    fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lon}`)
        .then(response => response.json())
        .then(data => {
            // Extraer país y ciudad de la respuesta
            var country = data.address.country || '';
            var city = data.address.city || data.address.town || data.address.village || '';

            // Mostrar los valores en el formulario
            document.getElementById('selectedCountry').value = country;
            document.getElementById('selectedCity').value = city;

            // Rellenar los campos ocultos del formulario
            document.getElementById('country').value = country;
            document.getElementById('city').value = city;

            alert(`Ubicación seleccionada: ${country}, ${city}`);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('No se pudo obtener la información de la ubicación.');
        });
});