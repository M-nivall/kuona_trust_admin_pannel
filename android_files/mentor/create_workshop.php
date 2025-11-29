<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    include '../../include/connections.php';

    $title = $_POST['title'];
    $userID = $_POST['userID'];
    $desc = $_POST['desc'];
    $workshop_date = $_POST['workshop_date'];
    $venue = $_POST['venue'];
    $exhibitionType = $_POST['exhibitionType'];
    $originalImgName = $_FILES['filename']['name'];
    $tempName = $_FILES['filename']['tmp_name'];
    $folder = "../workshops/";

    $response = array(); // Initialize response array

    // Check if file was uploaded successfully
    if (move_uploaded_file($tempName, $folder . $originalImgName)) {
        // Start transaction
        mysqli_autocommit($con, false);

        $insert= "INSERT INTO workshops (title, mentor_id, workshop_desc, workshop_date, venue, workshop_type, banner_img)
                  VALUES ('$title', '$userID', '$desc', '$workshop_date', '$venue', '$exhibitionType', '$originalImgName')";

        // Execute both queries
        $result1 = mysqli_query($con, $insert);

        if ($result1) {
            mysqli_commit($con); // Commit transaction if both queries succeed
            $response['status'] = '1';
            $response['message'] = 'Workshop created successfully';
        } else {
            mysqli_rollback($con); // Rollback transaction if any query fails
            $response['status'] = '0';
            $response['message'] = 'Failed to set profile';
        }
    } else {
        $response['status'] = '0';
        $response['message'] = 'something went wrong';
    }

    // Close connection
    mysqli_close($con);

    // Return JSON response
    echo json_encode($response);
}
?>
