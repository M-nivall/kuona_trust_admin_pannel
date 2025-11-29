<?php
include '../../include/connections.php';

header('Content-Type: application/json');


// Creating the query
$select = "SELECT w.workshop_id,w.title,w.workshop_desc,w.workshop_date,w.venue,w.workshop_type,w.banner_img,w.workshop_status,e.f_name,e.l_name 
        FROM workshops w 
        INNER JOIN employees e ON e.emp_id = w.mentor_id
        WHERE workshop_status IN('Upcoming','Ongoing', 'Completed')
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
        $temp['mentor'] = $row['f_name']. ' '.$row['l_name'];
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
