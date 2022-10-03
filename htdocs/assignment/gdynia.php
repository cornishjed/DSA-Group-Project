<?php
require_once 'config.php';

$query1 = "SELECT * FROM city WHERE name = 'Gdynia'";
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
$GdyniaMapAPI = mapAPI[1];

echo "
<!DOCTYPE html>
<html lang='en'>
<head>
  <title>" . $name . "</title>
  <script type='text/javascript' src='googlemap.js'></script>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  <link rel='stylesheet' href='city.css'>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  <script>";

  loadMapPHP($name, $connection);

  echo "}
  </script>
  <script src='$GdyniaMapAPI' defer >
  </script>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
</head>
<body>

  
  <div class='page'>
    <nav style='background: rgb(24, 8, 117)'>
      <ul>
        <li><a class='active' href='index.html'>Home</a></li>
        <li><a href='Plymouth.php'>Plymouth</a></li>
        <li><a href='Gdynia.php'>Gdynia</a></li>
      </ul>
    </nav>
    
    <div id='header'>
      <center><h1>" . $name . "</h1></center>
    </div>

    <div id='profile'>
    <center><h3>City information</h3></center>
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

    <div id='weather'>
    <center><h3>Weather</h3></center>";

      weatherWidget($name);
  
      echo "
    
    </div>

    <main>
    <h3>History</h3>
    " . $description . "
    </main>

    <div id='map'>
      <div id='map'></div>
    </div>

    <div id='flickr'>


    Flickr API Integration

    </div>

    <footer style='background: rgb(24, 8, 117)'><br>Copyright 2021© UFCFV4-30-2 Data, Schemas & Applications - Group F</footer>

    <div id='twitter'>
      <div class='column'>";
        //twitterWidgetFeed($woeid, $connection);
      
        twitterWidgetComplete($name, $name, $woeid, $connection);
          
        echo "
      </div>


  </div>

</body>
</html>";
?>