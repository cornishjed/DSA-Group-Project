<?php

require_once '../../login.php';

  $connection = new mysqli($hn, $un, $pw, $db);	

  if ($connection->connect_error) die("Fatal Error");
     #hide errors
    error_reporting(0);
    ini_set('display_errors', 0); 
# COMMENTS CAROSEL SLIDESHOW
# 1. Pull comments from database
  
$queryRowCount = "SELECT * FROM tweet";
  $result = $connection->query($queryRowCount);
  $row_cnt = $result->num_rows;
$queryInstance = "SELECT MIN(twin_cities_id) AS min_id FROM tweet";
$result = $connection->query($queryInstance);
$firstInstance = $result->fetch_assoc()['min_id'];
$queryInstance = "SELECT MAX(twin_cities_id) AS max_id FROM tweet";
$result = $connection->query($queryInstance);
$lastInstance = $connection->query($queryInstance);

$first_instance_cpy = $firstInstance;

$ids = array();

for ($x = 0; $x < $row_cnt; $x++) {
	$query = "SELECT twin_cities_id FROM tweet WHERE twin_cities_id = " . $firstInstance . "";
	$result = $connection->query($query);
	$id = $result->fetch_assoc()['twin_cities_id'];
	if ($id == NULL){
		$firstInstance++;
		$x--;
		continue;
	}
	$ids[$x] = $id;
	$firstInstance++;
}

$items = array();

echo "
<link rel='stylesheet' href='carosel.css'>
";

for ($x = sizeof($ids) - 1; $x > 0; $x--) {
    $query = "SELECT date_published, author, content FROM tweet WHERE twin_cities_id = " . $ids[$x] . "";
    $result = $connection->query($query);
    $date_published = $result->fetch_assoc()['date_published'];
	$date_published = substr($date_published, 0, 16);
    $result = $connection->query($query);
    $author = $result->fetch_assoc()['author'];
    $result = $connection->query($query);
    $content = $result->fetch_assoc()['content'];
	
	#Check place exists in content
	$pattern = "/" . $place . "/i";

	if ((strlen($author) < 2) || (!preg_match($pattern, $content))) {
		$x--;
		continue;
	}
    $items[$x] = "
	  <hr />
      <h4>" . $author . "</h4>
	  <p>" . $content . "</p>
	  <p><em>published: " . $date_published . "</em></p>";
	if (sizeof($items) == 10)
		break;
  }



echo "

<div class='slideshow-container'>
  <!-- The slideshow -->
";
	foreach ($items as $item) {
		echo"
		
    <div class='mySlides fade'>
      " . $item . "
    </div>";
	}


echo"


</div>
<br>

<div style='text-align:center'>";
for ($x = 0; $x < 10; $x++) {
  $y = $x+1;
  echo "<span class='dot' onclick='currentSlide(" . $y . ")'></span>";
}
echo "</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
	
  var i;
  var slides = document.getElementsByClassName('mySlides');
  var dots = document.getElementsByClassName('dot');
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = 'none';  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(' active', '');
  }
  slides[slideIndex-1].style.display = 'block';  
  dots[slideIndex-1].className += ' active';
  setTimeout(showSlides, 5000); // Change image every 2 seconds
}
</script>

</body>
</html>";
#https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_slideshow_auto