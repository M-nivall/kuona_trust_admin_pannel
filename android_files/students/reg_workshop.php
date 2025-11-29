<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $workshopID = $_POST['workshopID'];
    $studentID = $_POST['studentID'];
    $studentName = $_POST['studentName'];

    $insert = "INSERT INTO workshop_registrations (workshop_id, student_id, student_names) VALUES ('$workshopID','$studentID','$studentName')";

    if (mysqli_query($con, $insert)) {
        $response['status'] = 1;
        $response['message'] = 'You are all set now! stay alert on any updates';
    } else {
        $response['status'] = 0;
        $response['message'] = 'Please try again';
    }

    echo json_encode($response);
}
?>
