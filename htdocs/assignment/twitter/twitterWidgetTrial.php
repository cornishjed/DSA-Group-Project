<?php

function twitterWidgetFeed($n, $connection)
{
  /*require_once 'login.php';

  $connection = new mysqli($hn, $un, $pw, $db);	

  if ($connection->connect_error) die("Fatal Error"); //test
  */
  
  if (($n == 493421) || ($n == 32185)) {
    $queryRowCount = "SELECT * FROM tweet WHERE woeid = " . $n . "";
  }
  else {
	$queryRowCount = "SELECT * FROM tweet WHERE place_id = " . $n . "";
  }
 
  $result = $connection->query($queryRowCount);
  $row_cnt = $result->num_rows;
  
  $ids = array();
  
  if (($n == 493421) || ($n == 32185)) {
    $query = "SELECT twin_cities_id FROM tweet WHERE woeid = " . $n . "";
  }
  else {
	$query = "SELECT twin_cities_id FROM tweet WHERE place_id = " . $n . "";
  }
  
  $result = $connection->query($query);
  $row_start = $result->fetch_assoc()['twin_cities_id'];
  $row_max = $row_start + $row_cnt;
  
  # store database id in array
  $current_id = $row_max - 1;
  
  for ($x = 0; $x < $row_cnt; $x++) {
    $result = $connection->query($query);
    #echo $result->fetch_assoc()['tweet_id'];
    $ids[$x] = $current_id;
	$current_id--;
  }

  # store and ouput query results
  echo "
<head>
  <title>Bootstrap Example</title>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
  <script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
</head>
<body>";


$items = array();

  for ($x = 1; $x < 11; $x++) {
    echo "<div id='tweet_box'>";
    $query = "SELECT date_published, author, content FROM tweet WHERE twin_cities_id = " . $ids[$x] . "";
    $result = $connection->query($query);
    $date_published = $result->fetch_assoc()['date_published'];
	$date_published = substr($date_published, 0, 16);
    $result = $connection->query($query);
    $author = $result->fetch_assoc()['author'];
    $result = $connection->query($query);
    $content = $result->fetch_assoc()['content'];
	if (strlen($author) < 2) {
		$x++;
		continue;
	}
    $items[$x] = "
	  <hr />
      <h4>" . $author . "</h4>
	  <p>" . $content . "</p>
	  <p><em>published: " . $date_published . "</em></p>";
  }
  //print_r($items);
  echo "<div id='demo' class='carousel slide' data-ride='carousel'>

  <!-- Indicators -->
  <ul class='carousel-indicators'>
    <li data-target='#demo' data-slide-to='0' class='active'></li>";
	for($x = 1; $x < count($items); $x++) {
      echo "<li data-target='#demo' data-slide-to='" . $x . "'></li>";
    }
  echo "
  </ul>

  <!-- The slideshow -->
  <div class='carousel-inner'>
    <div class='carousel-item active'>
      <p>Posts from Twitter!</p>
    </div>";
	foreach ($items as $item) {
		echo"
		
    <div class='carousel-item'>
      " . $item . "
    </div>
	";
	}
  echo "</div>

  <!-- Left and right controls -->
  <a class='carousel-control-prev' href='#demo' data-slide='prev'>
    <span class='carousel-control-prev-icon'></span>
  </a>
  <a class='carousel-control-next' href='#demo' data-slide='next'>
    <span class='carousel-control-next-icon'></span>
  </a>

</div>";

}
?>