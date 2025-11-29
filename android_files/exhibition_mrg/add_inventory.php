<?php

include "../../include/connections.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $exhibitionID = $_POST['exhibitionID'];
    $artID = $_POST['artID'];
    $artistID = $_POST['artistID'];
    $artistName = $_POST['artistName'];
    $title = $_POST['title'];
    $imgName = $_POST['imgName'];

    // Check if this art_id already exists
    $check = "SELECT * FROM inventory WHERE art_id = '$artID'";
    $result = mysqli_query($con, $check);

    if (mysqli_num_rows($result) > 0) {
        $response['status'] = 0;
        $response['message'] = 'This artwork is already archived.';
    } else {
        $insert = "INSERT INTO inventory (title, image_name, exhibition_id, artist_id, artist_name, art_id)
                   VALUES ('$title', '$imgName', '$exhibitionID', '$artistID', '$artistName', '$artID')";

        if (mysqli_query($con, $insert)) {
            $response['status'] = 1;
            $response['message'] = 'Artwork added successfully.';
        } else {
            $response['status'] = 0;
            $response['message'] = 'Database error. Please try again.';
        }
    }

    echo json_encode($response);
}
?>
