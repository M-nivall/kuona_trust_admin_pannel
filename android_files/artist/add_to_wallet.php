<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $donationID = $_POST['donationID'];
    $artID = $_POST['artID'];
    $artistID = $_POST['artistID'];
    $amount = $_POST['amount'];

    // Update donation status
    $update = "UPDATE donations SET donation_status = '4' WHERE donation_id = '$donationID'";

    if (mysqli_query($con, $update)) {

        // Step 1: Update artist wallet
        $updateArtistWallet = "UPDATE clients SET wallet = wallet + $amount WHERE client_id = '$artistID'";
        mysqli_query($con, $updateArtistWallet);

        $response['status'] = 1;
        $response['message'] = 'Added successfully';

    } else {
        $response['status'] = 0;
        $response['message'] = 'Please try again';
    }

    echo json_encode($response);
}
?>
