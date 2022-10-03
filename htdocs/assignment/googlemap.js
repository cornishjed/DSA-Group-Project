function loadMap() {
	// Initialize and add the map
  var city = { lat: 50.3755, lng: -4.1427 };
  // The map, centered at Uluru
  var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: city,
    });
}