<?php

require_once 'config.php';

function date_suffix($d)  {
  if ($d == 1)
      return "st";
  elseif ($d == 21)
      return "st";
  elseif ($d == 31)
      return "st";
  elseif ($d == 2)
      return "nd";
  elseif ($d == 3)
      return "rd";
  else
      return "th";
};

function weatherWidget(string $name) {

$dayofweek = substr(date("l"), 0, 3);

$city1 = simplexml_load_file(weatherAPI[0]);
$city2 = simplexml_load_file(weatherAPI[1]);

//city1 data sorting
$dtRaw = $city1->lastupdate['value'];
$dateObj = DateTime::createFromFormat('!m', substr($dtRaw, 5, 2));
$monthName = $dateObj->format('F');

$icon1 =  "http://openweathermap.org/img/wn/" . $city1->weather['icon'] . "@2x.png";

$dateTime1 = array('year'=>substr($dtRaw, 0, 4), 'month'=>$monthName, "day"=>substr($dtRaw, 8, 2), 'hour'=>substr($dtRaw, 11, 2), 'minute'=>substr($dtRaw, 14, 2), 'second'=>substr($dtRaw, 17, 2));

if ($dateTime1['day'] < 10)
  $dateTime1['day'] = substr($dateTime1['day'], 1, 1);

$city1temp = $city1->temperature['value'];
$city1temp -= round(273.15);

//city2 data sorting
$dtRaw = $city2->lastupdate['value'];
$dateObj = DateTime::createFromFormat('!m', substr($dtRaw, 5, 2));
$monthName = $dateObj->format('F');

$icon2 =  "http://openweathermap.org/img/wn/" . $city2->weather['icon'] . "@2x.png";

$dateTime2 = array('year'=>substr($dtRaw, 0, 4), 'month'=>$monthName, "day"=>substr($dtRaw, 8, 2), 'hour'=>substr($dtRaw, 11, 2), 'minute'=>substr($dtRaw, 14, 2), 'second'=>substr($dtRaw, 17, 2));

if ($dateTime2['day'] < 10)
  $dateTime2['day'] = substr($dateTime2['day'], 1, 1);

$city2temp = $city2->temperature['value'];
$city2temp -= round(273.15);

//page script
if ($name == $city1->city['name']) {
echo "
    <p>Weather in " .  $city1->city['name'] . " " . $city1->city->country . " on " . $dayofweek . " " . $dateTime1['day'] . date_suffix($dateTime1['day']) . " " . $dateTime1['month'] . " " . $dateTime1['year'] . " @ " . $dateTime1['hour'] . ":" . $dateTime1['minute'] . ":" . $dateTime2['second'] . "</p>
    <table>
          <tr>
            <td>Condition:</td>
            <td><img src=". $icon1 . ">" . $city1->weather['value'] . "</td>
          </tr>
          <tr>
            <td>Temperature:</td>
            <td>" . round($city1temp) . "&degC</td>
          </tr>
          <tr>
            <td>Wind:</td>
            <td>" . $city1->wind->speed['value'] . " " .  $city1->wind->speed['unit'] . " (" . $city1->wind->speed['name'] . ") from a " . $city1->wind->direction['name'] . " direction</td>
          </tr>
          <tr>
            <td>Humidity:</td>
            <td>" . $city1->humidity['value'] . $city1->humidity['unit'] . "</td>
          </tr>
          <tr>
            <td>Pressure:</td>
            <td>" . $city1->pressure['value'] . " " . $city1->pressure['unit'] . "</td>
          </tr>
          <tr>
            <td>Sunrise:</td>
            <td>" . substr($city1->city->sun['rise'], 11, 8) . "</td>
          </tr>
          <tr>
            <td>Sunset:</td>
           <td>" .  substr($city1->city->sun['set'], 11, 8) . "</td>
          </tr>
        </table>";
}
elseif ($name == $city2->city['name']) {
	echo "
    <p>Weather in " .  $city2->city['name'] . " " . $city2->city->country . " on " . $dayofweek . " " . $dateTime1['day'] . date_suffix($dateTime1['day']) . " " . $dateTime1['month'] . " " . $dateTime1['year'] . " @ " . $dateTime1['hour'] . ":" . $dateTime1['minute'] . ":" . $dateTime2['second'] . "</p>
    <table>
          <tr>
            <td>Condition:</td>
            <td><img src=". $icon1 . ">" . $city2->weather['value'] . "</td>
          </tr>
          <tr>
            <td>Temperature:</td>
            <td>" . round($city2temp) . "&degC</td>
          </tr>
          <tr>
            <td>Wind:</td>
            <td>" . $city2->wind->speed['value'] . " " .  $city2->wind->speed['unit'] . " (" . $city2->wind->speed['name'] . ") from a " . $city1->wind->direction['name'] . " direction</td>
          </tr>
          <tr>
            <td>Humidity:</td>
            <td>" . $city2->humidity['value'] . $city2->humidity['unit'] . "</td>
          </tr>
          <tr>
            <td>Pressure:</td>
            <td>" . $city2->pressure['value'] . " " . $city2->pressure['unit'] . "</td>
          </tr>
          <tr>
            <td>Sunrise:</td>
            <td>" . substr($city2->city->sun['rise'], 11, 8) . "</td>
          </tr>
          <tr>
            <td>Sunset:</td>
           <td>" .  substr($city2->city->sun['set'], 11, 8) . "</td>
          </tr>
        </table>";
}
}

?>