<?php
include '../../include/connections.php';

header('Content-Type: application/json');

// Creating the query
$select = "SELECT exhibition_id,title,exhibition_desc,starting_date,end_date,venue,exhibition_type,banner_img,visibility 
        FROM exhibitions
        WHERE exhibition_status = 'Upcoming'
        ORDER BY exhibition_id DESC";

$query = mysqli_query($con, $select);

$results = array();

if (mysqli_num_rows($query) > 0) {
    $results['status'] = "1";
    $results['message'] = "Upcoming Exhibition";
    $results['details'] = array();

    while ($row = mysqli_fetch_assoc($query)) {
        $temp = array();
        $temp['exhibitionID'] = $row['exhibition_id'];
         $temp['title'] = $row['title'];
        $temp['exhibitionDesc'] = $row['exhibition_desc'];
        $temp['startingDate'] = $row['starting_date'];
        $temp['endDate'] = $row['end_date'];
        $temp['venue'] = $row['venue'];
        $temp['exhibitionType'] = $row['exhibition_type'];
        $temp['bannerImg'] = $row['banner_img'];
        $temp['visibility'] = $row['visibility'];

        array_push($results['details'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = "No record found";
}

echo json_encode($results);
?>
