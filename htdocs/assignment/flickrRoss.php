<?php

function flickrWidget(string $name) {
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

    if ($name == 'Plymouth' or 'Gydnia') {
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
    }
    else {
        $query = 'SELECT name FROM place WHERE place_id = ' . $place_id . '';
        $result = $connection->query($query);

        $tag = $result->fetch_assoc()['name'];
 
        //calls the api, shows 27 results as photos tend to get less relevant as photo number increases
        $response = $f->photos_search(array("tags"=>"$tag", "tag_mode"=>"any", "per_page"=>"27"));
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
    }
}