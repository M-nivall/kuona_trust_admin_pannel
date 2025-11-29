<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    include '../../include/connections.php';

    $title = $_POST['title'];
    $desc = $_POST['desc'];
    $startDate = $_POST['startDate'];
    $endDate = $_POST['endDate'];
    $venue = $_POST['venue'];
    $exhibitionType = $_POST['exhibitionType'];
    $originalImgName = $_FILES['filename']['name'];
    $tempName = $_FILES['filename']['tmp_name'];
    $folder = "../exhibitions/";

    $response = array(); // Initialize response array

    // Check if file was uploaded successfully
    if (move_uploaded_file($tempName, $folder . $originalImgName)) {
        // Start transaction
        mysqli_autocommit($con, false);

        $insert= "INSERT INTO exhibitions (title, exhibition_desc, starting_date, end_date, venue, exhibition_type, banner_img)
                  VALUES ('$title', '$desc', '$startDate', '$endDate', '$venue', '$exhibitionType', '$originalImgName')";

        // Execute both queries
        $result1 = mysqli_query($con, $insert);

        if ($result1) {
            mysqli_commit($con); // Commit transaction if both queries succeed
            $response['status'] = '1';
            $response['message'] = 'Exhibition created successfully';
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
