<?php
require_once 'config.php';

function placePageCreate($place) {

$connection = new mysqli(DB[0], DB[1], DB[2], DB[3]);	

if ($connection->connect_error) die("Fatal Error");

$query1 = "SELECT * FROM place WHERE name = '" . $place . "'";
$place = array();
for ($x = 1; $x <= 6; $x++) {
  $query = "SELECT name FROM place WHERE place_id = '" . $x . "'";
  $result = $connection->query($query);
  $place[$x] = $result->fetch_assoc()['name'];
}
$result = $connection->query($query1);
if (!$result) die("Fatal Error");

$result = $connection->query($query1);
$place_id = $result->fetch_assoc()['place_id'];
$result = $connection->query($query1);
$name = $result->fetch_assoc()['name'];
$result = $connection->query($query1);
$description = $result->fetch_assoc()['description'];
$result = $connection->query($query1);
$address = $result->fetch_assoc()['address'];
$result = $connection->query($query1);
$date_opened = $result->fetch_assoc()['data_opened'];
$result = $connection->query($query1);
$opening_times = $result->fetch_assoc()['opening_times'];
$result = $connection->query($query1);
$pets_allowed = $result->fetch_assoc()['pets_allowed'];
$result = $connection->query($query1);
$weblink = $result->fetch_assoc()['weblink'];
$result = $connection->query($query1);
$woeid = $result->fetch_assoc()['woeid'];
$query = "SELECT name FROM city WHERE woeid = '" . $woeid . "'";
$result = $connection->query($query);
$city = $result->fetch_assoc()['name'];

echo "
<!DOCTYPE html>
<html lang='en'>
<head>
  <title>" . $name . "</title>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  <link rel='stylesheet' href='place.css'>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
</head>
<body>


  <div class='page'>
    <nav>
      <ul>
        <li><a href='http://localhost/assignment/index.html'>Home</a></li>
        <li><a href='http://localhost/assignment/plymouth.php'>Plymouth</a></li>
        <li><a href='http://localhost/assignment/gdynia.php'>Gdynia</a></li>
      </ul>
    </nav>

    <div id='places'>";
      $queryPlaces = "SELECT place_id FROM place WHERE woeid = '" . $woeid . "' LIMIT 1";
      $result = $connection->query($queryPlaces);
      $firstInstance = $result->fetch_assoc()['place_id'];
	  $queryRowCount = "SELECT name FROM place WHERE woeid = '" . $woeid . "'";
      $result  = $connection->query($queryRowCount);
      $row_cnt = $result->num_rows;
  
	  $rowMax = $firstInstance + $row_cnt;
	  $places = array();
  
      $city_place_id = $firstInstance;
  
      for ($x = 0; $x < $row_cnt; $x++) {
	    $query = "SELECT name FROM place WHERE woeid = '" . $woeid . "' AND place_id = '" . $city_place_id . "'";
	    $result = $connection->query($query);
	    $places[$x] = $result->fetch_assoc()['name'];
	    $city_place_id++;
      };
	
      echo" <h3>More places in " . $city . "</h3><hr>";
	
	  foreach ($places as $place) {
        echo "<p><a href='" . $place . ".php'>" . $place . "</a></p><br>";
	  }
	   
	  echo "
    </div>
   
    <div id='gallery'>
      <h1>" . $name . "</h1>
      <p>" . $description . "</p>
      <hr>";
  
      $queryRowCount = "SELECT source FROM photo WHERE place_id = '" . $place_id . "'";
      $result  = $connection->query($queryRowCount);
      $row_cnt = $result->num_rows;
  
      $queryInstance = "SELECT photo_id FROM photo WHERE place_id LIKE '%" . $place_id . "%' LIMIT 1";
      $result = $connection->query($queryInstance);
      $firstInstance = $result->fetch_assoc()['photo_id'];

      //finally, find number of rows from first instance
      $rowMax = $firstInstance + $row_cnt;
  
      $photos = array();
  
      $photo_id = $firstInstance;
  
      for ($x = 0; $x < $row_cnt; $x++) {
	    $query = "SELECT source FROM photo WHERE place_id = '" . $place_id . "' AND photo_id = '" . $photo_id . "'";
	    $result = $connection->query($query);
	    $photos[$x] = $result->fetch_assoc()['source'];
	    $photo_id++;
      };
	  
      echo" <h3>Gallery</h3><br>";
	 
	  foreach ($photos as $img) {
        echo "<img src='" . $img . "'><br><hr><br>";
	  }
	  
      echo "
    </div>

    <footer><br>Copyright 2021© UFCFV4-30-2 Data, Schemas & Applications - Group F</footer>
  </div>

</body>
</html>";
}