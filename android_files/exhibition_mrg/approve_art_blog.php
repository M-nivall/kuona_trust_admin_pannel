<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $ID = $_POST['ID'];
    $artistID = $_POST['artistID'];

    $update = "UPDATE art_work SET art_status = 'Approved' WHERE id = '$ID' AND artist_id = '$artistID'";

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
