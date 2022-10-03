<?php

date_default_timezone_set("Europe/London");

require_once 'TwitterAPIExchange.php';
require_once 'twitterLogin.php';

#hide errors
error_reporting(0);
ini_set('display_errors', 0);

#$connection = new mysqli($hn, $un, $pw, $db);	

if ($connection->connect_error) die("Fatal Error"); //test

$query1 = "SELECT * FROM tweet WHERE woeid = '32185'";
$result = $connection->query($query1); // test
if (!$result) die("Fatal Error");

# set the base URL and HTTP method
//$url = "https://api.twitter.com/1.1/statuses/user_timeline.json";
$url = 'https://api.twitter.com/1.1/search/tweets.json';

$requestMethod = "GET";

# if no user and/or count GET params. - set to defaults
if (isset($_GET['user']))  {$user = preg_replace("/[^A-Za-z0-9_]/", '', $_GET['user']);}  else {$user  = "Plymouth";}
if (isset($_GET['count']) && is_numeric($_GET['count'])) {$count = $_GET['count'];} else {$count = 10;}

# build up the URL
$getfield = "?screen_name=$user&count=$count&tweet_mode=extended"; //hashtag here?


if (isset($_GET['user']))  {$user = preg_replace("/[^A-Za-z0-9_]/", '', $_GET['user']);}  else {$user  = "MiastoGdynia";}
if (isset($_GET['count']) && is_numeric($_GET['count'])) {$count = $_GET['count'];} else {$count = 10;}

$getfield2 = "?screen_name=$user&count=$count&tweet_mode=extended";

# make a new object using the library
$twitter = new TwitterAPIExchange($settings);

# make the request and decode JSON into array $string




$query1 = "SELECT * FROM tweet";
$result = $connection->query($query1);

$tweet_id = $result->fetch_assoc()['tweet_id'];

#Plymouth
$getfield = "?q=%23plymouth&-filter:retweets&-filter:replies&result_type=recent&count=$count&tweet_mode=extended"; //hashtag here?

$plymouth_woeid = 32185;

$string = json_decode($twitter->setGetfield($getfield)
->buildOauth($url, $requestMethod)
->performRequest(),$assoc = TRUE);

/*echo "<pre>
	"; print_r($string);
	echo "</pre>";*/

# catch errors
/*if(array_key_exists("errors", $string)) {
  echo "<h3>Sorry, there was a problem.</h3>
  <p>Twitter returned the following error message:</p><p><em>".$string[errors][0]["message"]."</em></p>";
  exit();
}*/

# process the array
foreach($string as $array) { 
	foreach($array as $items) {

	if ($items['id'] != $tweet_id) {
    /*echo "Tweet ID: ". $items['id']."<br />";
    echo "Time and Date of Tweet: ".$items['created_at']."<br />";
    echo "Tweet: ". $items['full_text']."<br />";
    echo "Tweeted by: ". $items['user']['name']."<br />";
    echo "Screen name: ". $items['user']['screen_name']."<br />";
    echo "Followers: ". $items['user']['followers_count']."<br />";
    echo "Friends: ". $items['user']['friends_count']."<br />";
    echo "Listed: ". $items['user']['listed_count']."<br /><hr />";*/

	$id = $items['id'];
	if ($id == NULL)
		break;
	
	$date = $items['created_at'];
	$author = $items['user']['name'];
	
	$content = $items['full_text'];
	$content = addslashes($content);
    $queryInsert = "INSERT INTO tweet (tweet_id, author, date_published, content, woeid) VALUES (" . $id . ", '" . $author . "', '" . $date . "', '" . $content . "', " . $plymouth_woeid . ")";
	/*if ($connection->query($queryInsert) === TRUE) {
		echo "New record created successfully";
	}
	else {
		echo "Error: " . $queryInsert . "<br>" . $connection->error;
	}*/
	}
  }
}

#Gdynia
$getfield2 = "?q=%23gdynia&-filter:retweets&-filter:replies&result_type=recent&count=$count&tweet_mode=extended"; //hashtag here?
$gdynia_woeid = 493421;

$string = json_decode($twitter->setGetfield($getfield2)
->buildOauth($url, $requestMethod)
->performRequest(),$assoc = TRUE);

# catch errors
if(array_key_exists("errors", $string)) {
    /*echo "<h3>Sorry, there was a problem.</h3>
    <p>Twitter returned the following error message:</p><p><em>".$string[errors][0]["message"]."</em></p>";*/
    exit();
}
  
# process the array
foreach($string as $array) {
	foreach($array as $items) {
	if ($items['id'] != $tweet_id) {
    /*echo "Tweet ID: ". $items['id']."<br />";
    echo "Time and Date of Tweet: ".$items['created_at']."<br />";
    echo "Tweet: ". $items['full_text']."<br />";
    echo "Tweeted by: ". $items['user']['name']."<br />";
    echo "Screen name: ". $items['user']['screen_name']."<br />";
    echo "Followers: ". $items['user']['followers_count']."<br />";
    echo "Friends: ". $items['user']['friends_count']."<br />";
    echo "Listed: ". $items['user']['listed_count']."<br /><hr />";*/

	$id = $items['id'];
	if ($id == NULL)
		break;
	
	$date = $items['created_at'];
	$author = $items['user']['name'];
	$content = $items['full_text'];
	$content = addslashes($content);
    $queryInsert = "INSERT INTO tweet (tweet_id, author, date_published, content, woeid) VALUES (" . $id . ", '" . $author . "', '" . $date . "', '" . $content . "', " . $gdynia_woeid . ")";
	/*if ($connection->query($queryInsert) === TRUE) {
		echo "New record created successfully";
	}
	else {
		echo "Error: " . $queryInsert . "<br>" . $connection->error;
	}*/
	}
  }
}

# places

  // find number of places
  $queryRowCount = "SELECT name FROM place";
  $result = $connection->query($queryRowCount);
  $row_cnt = $result->num_rows;
  $city_place_id = 1;
  $count = 20;
  
  # store place names in array
for ($x = 0; $x < $row_cnt; $x++) {
	    $query = "SELECT name FROM place WHERE place_id = '" . $city_place_id . "'";
	    $result = $connection->query($query);
	    $place_name = $result->fetch_assoc()['name'];
		$getfield = "?q=%23" . $place_name . "&-filter:retweets&-filter:replies&result_type=recent&count=$count&tweet_mode=extended"; //hashtag here?

		$string = json_decode($twitter->setGetfield($getfield)
		->buildOauth($url, $requestMethod)
		->performRequest(),$assoc = TRUE);

		# catch errors
		if(array_key_exists("errors", $string)) {
			echo "<h3>Sorry, there was a problem.</h3>
			<p>Twitter returned the following error message:</p><p><em>".$string[errors][0]["message"]."</em></p>";
		exit();
		};

		foreach($string as $array) {
			foreach($array as $items) {
				if ($items['id'] != $tweet_id) {
	$id = $items['id'];
	if ($id == NULL)
		break;
	
    $tweet_id = $items['id'];
	$date = $items['created_at'];
	$author = $items['user']['name'];
	$content = $items['full_text'];
	$content = addslashes($content);
    $queryInsert = "INSERT INTO tweet (tweet_id, author, date_published, content, place_id) VALUES (" . $id . ", '" . $author . "', '" . $date . "', '" . $content . "', " . $city_place_id . ")";
	/*if ($connection->query($queryInsert) === TRUE) {
		echo "New record created successfully";
	}
	else {
		echo "Error: " . $queryInsert . "<br>" . $connection->error;
				}*/
			}
		}
	$city_place_id++;

	}

$query = "DELETE FROM tweet WHERE LENGTH(author) < 2";
$connection->query($query);
return;
}
//print_r($place_names); # test
  
# pull tweets that contain phrase "Your City or Town" in content

# $url = "https://api.twitter.com/1.1/statuses/user_timeline.json";


?>