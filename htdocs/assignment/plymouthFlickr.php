<?php
require_once 'weather.php';
require_once 'login.php';
require_once 'map.php';

$connection = new mysqli($hn, $un, $pw, $db);	

if ($connection->connect_error) die("Fatal Error"); //test

$query1 = "SELECT * FROM city WHERE name = 'Plymouth'";
$result = $connection->query($query1); // test
if (!$result) die("Fatal Error");

$result = $connection->query($query1);
$name = $result->fetch_assoc()['name'];
$result = $connection->query($query1);
$country = $result->fetch_assoc()['country'];
$result = $connection->query($query1);
$region = $result->fetch_assoc()['region'];
$result = $connection->query($query1);
$description = $result->fetch_assoc()['description'];
$result = $connection->query($query1);
$language = $result->fetch_assoc()['language'];
$result = $connection->query($query1);
$population = $result->fetch_assoc()['population'];
$result = $connection->query($query1);
$mayor = $result->fetch_assoc()['mayor'];
$result = $connection->query($query1);
$woeid = $result->fetch_assoc()['woeid'];
$result = $connection->query($query1);
$weblink = $result->fetch_assoc()['weblink'];

echo "
<!DOCTYPE html>
<html lang='en'>
<head>
  <title>" . $name . "</title>
  <script type='text/javascript' src='googlemap.js'></script>
  <link rel='stylesheet' href='place/flickr.css'>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  <link rel='stylesheet' href='" . $name . ".css'>
  <script>";

  loadMapPHP($name, $connection);

  echo "}
  </script>
  <script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyBPJgHizQhdKtjyvA5RexKV0PbnBEfUaY8&callback=loadMap&libraries=&v=weekly' defer >
  </script>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
</head>
<body>

  <div class='topnav'>
    <a href='index.html'>Home</a>
    <a href=''>Plymouth</a>
    <a href='gdynia.php'>Gdynia</a>
    <h1 style='text-align: right; padding-right: 15px;'>Twin Cities</h1>
  </div>

  <div class='header'>
	<center><h1>" . $name . "</h1></center>
  </div>
  <div class='row'>
    <div class='column' style='background-color:#aaa;'>
      <center><h3>Profile</h3></center>
      <table>
        <tr>
          <td><strong>Name</strong></td>
    	  <td>" . $name . "</td>
	    </tr>
	    <tr>
	      <td><strong>Country</strong></td>
	      <td>" . $country . "</td>
	    </tr>
	    <tr>
	      <td><strong>Region</strong></td>
	      <td>" . $region . "</td>
	    </tr>
	    <tr>
	      <td><strong>Language</strong></td>
	      <td>" . $language . "</td>
	    </tr>
	    <tr>
	      <td><strong>Population</strong></td>
	      <td>" . $population . "</td>
	    </tr>
	    <tr>
	      <td><strong>Mayor</strong></td>
	      <td>" . $mayor . "</td>
	    </tr>
	    <tr>
	      <td><strong>woeid</strong></td>
	      <td>" . $woeid . "</td>
	    </tr>
	    <tr>
	      <td><strong>Local website</strong></td>
	     <td><a href='" . $weblink . "'>" . $weblink . "</td>
	    </tr>	
      </table>
    </div>
    <div class='column' style='background-color:#bbb;'>" . $description . "</div>
    <div class='column' style='background-color:#ccc;'>
      <center><h3>Weather</h3></center>";

      weatherWidget($name);
  
      echo "
    </div>
  </div>
  <div class='header'>
	<h2>Places of Interest</h2>
  </div>
  <div class='container'>
    <div id='map'></div>
  </div>";

  //FLICKR
      //Key: d748a0175d7a04a0ff38571f70ef2192
      $key = 'd748a0175d7a04a0ff38571f70ef2192';
      //Secret: 56916a762b2ae241 
      $secret = '56916a762b2ae241';
      //PHP wrapper for Flickr API
      include_once('place/phpFlickr.php');
      $f = new phpFlickr($key, $secret);
      //enable caching using phpFlickr API kit
      //This will create a new table in 'twin_cities' database called 'flickr_cache'
      $f->enableCache("db", "mysql://root:@localhost/twin_cities");
  
      $tag = $name;

      $response = $f->photos_search(array("tags"=>"$tag", "tag_mode"=>"any", "per_page"=>"32"));
      $photos = $response['photo'];
 
      echo '<div class="gallery">';                        
      foreach ($photos as $photo) {
          $title = str_replace("'", "&#39", $photo['title']);   
          echo '<div class="img-container">';        
          echo '<img src="' . $f->buildPhotoURL($photo, "medium") . '" alt = "'. $title . '" data-original="'.$f->buildPhotoURL($photo, "large").'">';  
          echo '</div>';    
          //modal
          echo '<div class="f_modal">';     
          echo '<img src="'. $f->buildPhotoURL($photo, "large"). '" alt="" class ="full-img" />';
          echo '<p class="caption">'. $title .'</p>';     
          echo '</div>';  //modal                                   
      }                      
echo '</div>'; //gallery
  
      echo "<div class='footer'>
    <p>Footer</p>
  </div>
  <script src='place/flickr.js'></script>
</body>
</html>";
?>