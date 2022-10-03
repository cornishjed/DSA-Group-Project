<?php
use DG\Twitter\Twitter;

require_once 'src/twitter.class.php';
require_once '../../login.php';

$connection = new mysqli($hn, $un, $pw, $db);	
if ($connection->connect_error) die("Fatal Error"); //test

#1. Submit comment to database

if ($_POST['place'] != $_POST['city']) {
  $query1 = "SELECT woeid FROM city WHERE name = '" . $_POST['city'] . "'";
  $result = $connection->query($query1);
  $woeid = $result->fetch_assoc()['woeid'];
  $query1 = "SELECT place_id FROM place WHERE name = '" . $_POST['place'] . "'";
  $result = $connection->query($query1);
  $place_id = $result->fetch_assoc()['place_id'];
  $query = "INSERT INTO comments(content, author, woeid, place_id) VALUES ('" . $_POST['content'] . "', '" . $_POST['name'] . "', " . $woeid . ", " . $place_id . ")";
  $connection->query($query);
}
else {
  $query1 = "SELECT woeid FROM city WHERE name = '" . $_POST['city'] . "'";
  $result = $connection->query($query1);
  $woeid = $result->fetch_assoc()['woeid'];
  $query = "INSERT INTO comments(content, author, woeid) VALUES ('" . $_POST['content'] . "', '" . $_POST['name'] . "', " . $woeid . ")";
$connection->query($query);
}

#2. Submit post to Twitter
# credits - https://github.com/dg/twitter-php

$tweet = $_POST['name'] . " says \"" . $_POST['content'] . "\" ";

$onehashtag = str_replace(' ', '', $_POST['place']);
$tweet .= " #" . $onehashtag;

if ($_POST['place'] != $_POST['city'])
  $tweet .= " #" . $_POST['city'];

$tweet .= " - posted from TwinCitiesDSA.co.uk";

// ENTER HERE YOUR CREDENTIALS (see readme.txt)
define ('TWITTER_USERNAME', 'Jed Powell');
define('CONSUMER_KEY', 'cpAX9NeFNVGQQdEovUfWC5LPL');
define('CONSUMER_SECRET', 'KLt2SJrwNEETPwBq47urvuHj6gdE1nxnkDw7P5FUmyuHJaWjvW');
define('ACCESS_TOKEN', '1334491496058413056-FNAOL9MHFG70lxgvddHEWxEXFQx5SN');
define('ACCESS_TOKEN_SECRET', '0q2Qy6HFhVvkfSsm0PYYjMoKLA0VpsGjFfBj15PZmAWwv');

$twitter = new Twitter(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET);

try {
	$tweet = $twitter->send($tweet); // you can add $imagePath or array of image paths as second argument

} catch (DG\Twitter\TwitterException $e) {
	echo 'Error: ' . $e->getMessage();
}

if ($_POST['place'] != $_POST['city']) {
echo "
	<p>Comment submitted! Click <a href='../../place/" . $_POST['place'] . ".php'>here</a> to return</p></p>";
}
else {
	echo "
<p>Comment submitted! Click <a href='../../" . $_POST['place'] . ".php'>here</a> to return</p>";
}
?>