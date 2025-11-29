<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $donationID = $_POST['donationID'];
    $artID = $_POST['artID'];
    $artistID = $_POST['artistID'];
    $artistShare = $_POST['artistShare'];
    $companyShare = $_POST['companyShare'];

    // Update donation status
    $update = "UPDATE donations SET donation_status = '3', artist_share = '$artistShare', company_share = '$companyShare' WHERE donation_id = '$donationID'";

    if (mysqli_query($con, $update)) {

        // Step 1: Update artist wallet
        //$updateArtistWallet = "UPDATE artist_wallets SET balance = balance + $artistShare WHERE artist_id = '$artistID'";
        //mysqli_query($con, $updateArtistWallet);

        // Step 2: Update company wallet (assuming only one row with id = 1 or name = 'main')
        $updateCompanyWallet = "UPDATE platform_wallet SET total_amount = total_amount + $companyShare WHERE id = 1";
        mysqli_query($con, $updateCompanyWallet);

        $response['status'] = 1;
        $response['message'] = 'Sent successfully and funds updated';

    } else {
        $response['status'] = 0;
        $response['message'] = 'Please try again';
    }

    echo json_encode($response);
}
?>
