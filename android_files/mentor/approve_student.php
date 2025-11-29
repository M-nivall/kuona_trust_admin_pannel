<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $studentID = $_POST['studentID'];
    $workshopID = $_POST['workshopID'];

    $update = "UPDATE workshop_registrations SET attendance_status = 'Approved' WHERE student_id = '$studentID' AND workshop_id = '$workshopID'";

    if (mysqli_query($con, $update)) {
        $response['status'] = 1;
        $response['message'] = 'Approved Successfully';
    } else {
        $response['status'] = 0;
        $response['message'] = 'Please try again';
    }

    echo json_encode($response);
}
?>
