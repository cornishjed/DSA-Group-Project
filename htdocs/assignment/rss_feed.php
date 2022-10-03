<?php
    header("Content-Type: application/rss+xml; charset=UTF-8");

    $dsn = 'mysql:dbname=twin_cities;host=127.0.0.1';
    $user = 'root';
    $password = '';

    try {
        $connection = new PDO($dsn, $user, $password);
    }
    catch (\PDOException $e) {
        throw new \PDOException($e->getMessage(), (int)$e->getCode());
    }
        

    $query = "SELECT * FROM place ORDER BY place_id ASC";
    $statement = $connection->prepare($query);   
    $statement->execute();
    $result = $statement->fetchAll();

    $xw = xmlwriter_open_memory();
    xmlwriter_set_indent($xw, 1);
    $res = xmlwriter_set_indent_string($xw, ' ');
    
    xmlwriter_start_document($xw, '1.0', 'UTF-8');

    xmlwriter_start_element($xw, 'rss');
    
    xmlwriter_start_attribute($xw, 'version');
    xmlwriter_text($xw, '2.0');
    xmlwriter_end_attribute($xw);
    
    xmlwriter_start_element($xw, 'channel');
    
    xmlwriter_start_element($xw, 'title');
    xmlwriter_text($xw, 'Twin Cities RSS Feed');
    xmlwriter_end_element($xw); // title

    xmlwriter_start_element($xw, 'link');
    xmlwriter_text($xw, 'http://localhost/assignment/rss_feed.php');
    xmlwriter_end_element($xw); // link

    xmlwriter_start_element($xw, 'description');
    xmlwriter_text($xw, 'Places in Plymouth and Gdynia');
    xmlwriter_end_element($xw); // description

    xmlwriter_start_element($xw, 'language');
    xmlwriter_text($xw, 'en-gb');
    xmlwriter_end_element($xw); // language

    foreach($result as $row) {
        xmlwriter_start_element($xw, 'item');
        
        xmlwriter_start_element($xw, 'title');
        xmlwriter_text($xw, $row["name"]);
        xmlwriter_end_element($xw); // title

        xmlwriter_start_element($xw, 'description');
        xmlwriter_start_cdata($xw);
        xmlwriter_text($xw, $row["description"]);
        xmlwriter_end_cdata($xw);
        xmlwriter_end_element($xw); // description

        xmlwriter_start_element($xw, 'link');
        xmlwriter_text($xw, $row["weblink"]);
        xmlwriter_end_element($xw); // link    

        xmlwriter_end_element($xw); // item
    }

    xmlwriter_end_element($xw); // channel

    xmlwriter_end_element($xw); // rss



    xmlwriter_end_document($xw);
    echo xmlwriter_output_memory($xw);
    ?>