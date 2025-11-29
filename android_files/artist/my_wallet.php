<?php
include '../../include/connections.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $userID = $_POST['userID'];

// Creating the query
$select = "SELECT wallet FROM clients WHERE client_id = '$userID'";

$query = mysqli_query($con, $select);

$results = array();

if (mysqli_num_rows($query) > 0) {
    $results['status'] = "1";
    $results['message'] = "My Wallet";
    $results['details'] = array();

    while ($row = mysqli_fetch_assoc($query)) {
        $temp = array();
        $temp['wallet'] = $row['wallet'];

        array_push($results['details'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = " ";
}

echo json_encode($results);
}
?>
