<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    include '../../include/connections.php';

    $userID = $_POST['userID'];
    $exhibitionID = $_POST['exhibitionID'];
    $title = $_POST['title'];
    $art_desc = $_POST['desc'];
    $originalImgName = $_FILES['filename']['name'];
    $tempName = $_FILES['filename']['tmp_name'];
    $folder = "../exhibition_artworks/";

    $response = array(); // Initialize response array

    // Create a unique filename (e.g., 20240508122530_filename.jpg)
    $uniquePrefix = date('YmdHis') . '_' . uniqid(); // time + unique ID
    $extension = pathinfo($originalImgName, PATHINFO_EXTENSION);
    $newFileName = $uniquePrefix . '.' . $extension;
    $destination = $folder . $newFileName;

    // Check if file was uploaded successfully
    if (move_uploaded_file($tempName, $destination)) {
        // Start transaction
        mysqli_autocommit($con, false);

        $insert= "INSERT INTO exhibition_artworks (exhibition_id,artist_id, title, art_desc, image_name)
                  VALUES ('$exhibitionID', '$userID', '$title', '$art_desc', '$newFileName')";

        $result = mysqli_query($con, $insert);

        if ($result) {
            mysqli_commit($con); // Commit transaction
            $response['status'] = '1';
            $response['message'] = 'Submited  Successfully';
        } else {
            mysqli_rollback($con); // Rollback on failure
            $response['status'] = '0';
            $response['message'] = 'Database insert failed';
        }
    } else {
        $response['status'] = '0';
        $response['message'] = 'File upload failed';
    }

    mysqli_close($con);
    echo json_encode($response);
}
?>
