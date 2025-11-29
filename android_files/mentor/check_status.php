<?php

include '../../include/connections.php';

$workshopID = $_POST['workshopID'];

$response = array();

$select = "SELECT * FROM workshops WHERE workshop_id = '$workshopID'";
$query = mysqli_query($con, $select);

if (mysqli_num_rows($query) > 0) {
    $response['status'] = "1";
    $response['message'] = "Status found";

    $row = mysqli_fetch_assoc($query); 

    $check = array();
    $check['workshopStatus'] = $row['workshop_status']; 

    $response['details'] = array();
    array_push($response['details'], $check);
} else {
    $response['status'] = "0";
    $response['message'] = "No record found";
}

echo json_encode($response);
?>
