<?php

include '../../include/connections.php';

$userID = $_POST['userID'];
$workshopID = $_POST['workshopID'];

$response = array();

$select = "SELECT * FROM workshop_registrations wr 
          INNER JOIN workshops w ON wr.workshop_id = w.workshop_id 
          WHERE student_id = '$userID' 
          AND wr.workshop_id = '$workshopID'";
$query = mysqli_query($con, $select);

if (mysqli_num_rows($query) > 0) {
    $response['status'] = "1";
    $response['message'] = "Status found";

    $row = mysqli_fetch_assoc($query); // ✅ fetch row before using it

    $check = array();
    $check['checkStatus'] = "Registered";
    $check['approvalStatus'] = $row['attendance_status'];
    $check['workshopStatus'] = $row['workshop_status']; // now this works

    $response['details'] = array();
    array_push($response['details'], $check);
} else {
    $response['status'] = "0";
    $response['message'] = "No record found";
}

echo json_encode($response);
?>
