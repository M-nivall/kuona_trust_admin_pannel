<?php

include '../../include/connections.php';

$select="SELECT * FROM exhibitions WHERE exhibition_status = 'Upcoming'";

$records=mysqli_query($con,$select);

       $results['status'] = "1";

       $results['products'] = array();

       while ($row=mysqli_fetch_array($records)){


    $temp['exhibitionID'] = $row['exhibition_id'];
    $temp['title'] = $row['title'];
    $temp['exhibitionDesc'] = $row['exhibition_desc'];
    $temp['startingDate'] = $row['starting_date'];
    $temp['endDate'] = $row['end_date'];
    $temp['venue'] = $row['venue'];
    $temp['exhibitionType'] = $row['exhibition_type'];
    $temp['bannerImg'] = $row['banner_img'];
     $temp['visibility'] = $row['visibility'];

    

    array_push($results['products'], $temp);

}


//displaying the result in json format
echo json_encode($results);







?>