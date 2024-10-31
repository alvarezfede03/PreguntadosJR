var map = L.map('map').setView([-34.6037, -58.3816], 4);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);
var marker = L.marker([-34.6037, -58.3816], {draggable: true}).addTo(map);

marker.on('dragend', function(e) {
    var latlng = marker.getLatLng();
    var lat = latlng.lat;
    var lon = latlng.lng;

    fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lon}`)
        .then(response => response.json())
        .then(data => {

            var country = data.address.country || '';
            var city = data.address.city || data.address.town || data.address.village || '';

            document.getElementById('selectedCountry').value = country;
            document.getElementById('selectedCity').value = city;
            document.getElementById('country').value = country;
            document.getElementById('city').value = city;
            alert(`Ubicación seleccionada: ${country}, ${city}`);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('No se pudo obtener la información de la ubicación.');
        });
});