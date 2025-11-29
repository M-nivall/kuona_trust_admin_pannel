<?php
include '../../include/connections.php';

header('Content-Type: application/json');

 $userID=$_POST['userID'];

// Creating the query
$select = "SELECT workshop_id,title,workshop_desc,workshop_date,venue,workshop_type,banner_img,workshop_status 
        FROM workshops
        WHERE workshop_status IN ('Upcoming','Ongoing', 'Completed') AND mentor_id = '$userID'
        ORDER BY workshop_id DESC";

$query = mysqli_query($con, $select);

$results = array();

if (mysqli_num_rows($query) > 0) {
    $results['status'] = "1";
    $results['message'] = "Upcoming Workshops";
    $results['details'] = array();

    while ($row = mysqli_fetch_assoc($query)) {
        $temp = array();
        $temp['workshopID'] = $row['workshop_id'];
         $temp['title'] = $row['title'];
        $temp['workshopDesc'] = $row['workshop_desc'];
        $temp['workshopDate'] = $row['workshop_date'];
        $temp['venue'] = $row['venue'];
        $temp['workshopType'] = $row['workshop_type'];
        $temp['bannerImg'] = $row['banner_img'];
        $temp['workshopStatus'] = $row['workshop_status'];

        array_push($results['details'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = "No record found";
}

echo json_encode($results);
?>
