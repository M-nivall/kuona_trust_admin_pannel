<?php

include '../../include/connections.php';

$select="SELECT a.id,a.artist_id,a.title,a.art_desc,a.image_name,c.first_name,c.last_name,c.username
        FROM art_work a
        INNER JOIN clients c ON a.artist_id = c.client_id 
        WHERE a.art_status = 'Approved'";

$records=mysqli_query($con,$select);

       $results['status'] = "1";

       $results['products'] = array();

       while ($row=mysqli_fetch_array($records)){


    $temp['artID'] = $row['id'];
    $temp['artistID'] = $row['artist_id'];
    $temp['title'] = $row['title'];
    $temp['desc'] = $row['art_desc'];
    $temp['image'] = $row['image_name'];
    $temp['fullName'] = $row['first_name'].' '.$row['last_name'];
    $temp['username'] = $row['username'];

    array_push($results['products'], $temp);

}
//displaying the result in json format
echo json_encode($results);







?>