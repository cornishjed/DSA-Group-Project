<?php
namespace TwinCities;
@date_default_timezone_set("GMT");

# define database parameters: HOST, DATABASE, USERNAME, PASSWORD
define ("DB", [
    "localhost",
    "root",
    "",
    "twin_cities"
]);

    $connection = mysqli_connect(DB[0], DB[1], DB[2], DB[3]) or die("Can not connect to database.");
    
# define Map APIs
define ("mapAPI", [
    "https://maps.googleapis.com/maps/api/js?key=AIzaSyBPJgHizQhdKtjyvA5RexKV0PbnBEfUaY8&callback=loadMap&libraries=&v=weekly",
    "https://maps.googleapis.com/maps/api/js?key=AIzaSyBPJgHizQhdKtjyvA5RexKV0PbnBEfUaY8&callback=loadMap&libraries=&v=weekly"

]);

# define Weather
define ("weatherAPI", [
    "http://api.openweathermap.org/data/2.5/weather?q=Plymouth,uk&APPID=a25fdfe5ef03c36e5ab813f9c6933f0b&mode=xml",
    "http://api.openweathermap.org/data/2.5/weather?q=Gdynia,poland&APPID=a25fdfe5ef03c36e5ab813f9c6933f0b&mode=xml"

]);

?>