<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $donationID = $_POST['donationID'];
    $artID = $_POST['artID'];
    $artistID = $_POST['artistID'];
    $artistShare = $_POST['artistShare'];
    $companyShare = $_POST['companyShare'];

    // Update donation status
    $update = "UPDATE donations SET donation_status = '2', artist_share = '$artistShare', company_share = '$companyShare' WHERE donation_id = '$donationID'";

    if (mysqli_query($con, $update)) {

        $response['status'] = 1;
        $response['message'] = 'Receival Approved Successfully';

    } else {
        $response['status'] = 0;
        $response['message'] = 'Please try again';
    }

    echo json_encode($response);
}
?>
