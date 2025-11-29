<?php
include '../../include/connections.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

 $workshopID = $_POST['workshopID'];

// Creating the query
$select = "SELECT * FROM workshop_registrations WHERE attendance_status = 'Pending approval' AND workshop_id = '$workshopID' 
        ORDER BY id DESC";

$query = mysqli_query($con, $select);

$results = array();

if (mysqli_num_rows($query) > 0) {
    $results['status'] = "1";
    $results['message'] = "Workshop Registartions";
    $results['details'] = array();

    while ($row = mysqli_fetch_assoc($query)) {
        $temp = array();
        $temp['ID'] = $row['id'];
         $temp['workshopID'] = $row['workshop_id'];
        $temp['studentID'] = $row['student_id'];
        $temp['studentNames'] = $row['student_names'];
        $temp['attendanceStatus'] = $row['attendance_status'];

        array_push($results['details'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = "No record found";
}

echo json_encode($results);
}
?>
