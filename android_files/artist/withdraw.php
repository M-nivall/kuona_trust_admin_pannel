<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $userID = $_POST['userID'];
    $amount = $_POST['amount'];

    // Withdraw from wallet
    $updateArtistWallet = "UPDATE clients SET wallet = wallet - $amount WHERE client_id = '$userID'";

    if (mysqli_query($con, $updateArtistWallet)) {
        $response['status'] = 1;
        $response['message'] = 'Withdrawn KSH: ' . $amount . ' successfully';
    } else {
        $response['status'] = 0;
        $response['message'] = 'Please try again';
    }

    echo json_encode($response);
}

?>
