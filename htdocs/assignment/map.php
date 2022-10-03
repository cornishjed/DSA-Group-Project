<?php

function loadMapPHP($cityName, $connection) {
// Initialize and add the map
  echo "function loadMap() {";
  $query1 = "SELECT * FROM city WHERE name = '" . $cityName . "'";
  if ($connection->connect_error) die("Fatal Error"); //test
  $result = $connection->query($query1); // test
  if (!$result) die("Fatal Error");

  $result = $connection->query($query1);
  
  //Work out values for marker loop - find number of rows
  $queryRowCount = "SELECT place_id FROM place WHERE address LIKE '%" . $cityName . "%'";
  $result  = $connection->query($queryRowCount);
  $row_cnt = $result->num_rows;
  
  //then find first instance of city place
  $queryInstance = "SELECT place_id FROM place WHERE address LIKE '%" . $cityName . "%' LIMIT 1";
  $result = $connection->query($queryInstance);
  $firstInstance = $result->fetch_assoc()['place_id'];
  
  //finally, find number of rows from first instance
  $rowMax = $firstInstance + $row_cnt;
  
  if ($cityName == 'Plymouth')
	$zoom = 13;
  else if ($cityName == 'Gdynia')
	$zoom = 11;
		
  echo "
    var city = {
	  lat: "; $result = $connection->query($query1); echo $result->fetch_assoc()['latitude'] . ",
	  lng: "; $result = $connection->query($query1); echo $result->fetch_assoc()['longitude'] . "
	};
	
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: " . $zoom . ",
      center: city,
    });
  ";
  
  for ($x = $firstInstance; $x < $rowMax; $x++) {
    $query2 = "SELECT name, latitude, longitude, opening_times FROM place WHERE place_id = '" . $x . "'";
    $result = $connection->query($query2);
    $name = $result->fetch_assoc()['name'];
    $link = $name . '.php';
  
    $query3 = "SELECT category_id FROM place_category WHERE place_id = '" . $x . "'";
    $result = $connection->query($query3);
    $category_icon = $result->fetch_assoc()['category_id'];
    $queryIcon = "SELECT icon FROM category WHERE category_id = " . $category_icon . "";
    $result = $connection->query($queryIcon);
    $iconPath = $result->fetch_assoc()['icon'];
  
    $result = $connection->query($query2);
    $opening_times = $result->fetch_assoc()['opening_times'];
	
    echo "
	var place = {
	  lat: "; $result = $connection->query($query2); echo $result->fetch_assoc()['latitude'] . ",
	  lng: "; $result = $connection->query($query2); echo $result->fetch_assoc()['longitude'] . "
	};
  
    var icon = {
	  url: '" . $iconPath . "',
	  scaledSize: new google.maps.Size(25, 25),
	  origin: new google.maps.Point(0, 0),
	  anchor: new google.maps.Point(0, 0)
    };
  
    var marker" . $x . " = new google.maps.Marker({
	  position: place,
	  map: map,
	  icon: icon,
	  url: './place/" . $link ."',
	  title: '" . $name . "'
    });

    var infowindow" . $x . " = new google.maps.InfoWindow({
	  content: '<strong>" . $name . "</strong><p>Opening times: " . $opening_times . "</p>'
    });
  
    google.maps.event.addListener(marker" . $x . ", 'click', function() {
	  window.location.href = marker" . $x . ".url;
	  marker" . $x . ".setMap(map);
    });

<!-- Mouseover and mouseout Goggle maps market implementation found on Stack Overflow -->

    marker" . $x . ".addListener('mouseover', function() {
    infowindow" . $x . ".open(map, this);
    });

    marker" . $x . ".addListener('mouseout', function() {
    infowindow" . $x . ".close();
    });
    "; 			
  }
}