<?php

include "../../include/connections.php";

function generateRefCode($length = 10) {
    $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $refCode = '';
    for ($i = 0; $i < $length; $i++) {
        $refCode .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $refCode;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $artID = $_POST['artID'];
    $artistID = $_POST['artistID'];
    $donorID = $_POST['donorID'];
    $amount = $_POST['amount'];
    $payment_method = $_POST['payment_method'];
    $ref_code = generateRefCode(); 
    $payment_date = date("Y-m-d");

    $insert = "INSERT INTO donations (art_id, artist_id, donor_id, amount, payment_method, reference_code, donation_date, donation_for)
               VALUES ('$artID', '$artistID', '$donorID', '$amount', '$payment_method', '$ref_code', '$payment_date', 'Exhibition')";

    if (mysqli_query($con, $insert)) {
        $response['status'] = 1;
        $response['message'] = 'Thank you for your donation';
        $response['reference_code'] = $ref_code;
    } else {
        $response['status'] = 0;
        $response['message'] = 'Please try again';
    }

    echo json_encode($response);
}
?>
