<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    include '../../include/connections.php';

    $userID = $_POST['userID'];
    $bio = $_POST['bio'];
    $portfolio = $_POST['portfolio'];
    $originalImgName = $_FILES['filename']['name'];
    $tempName = $_FILES['filename']['tmp_name'];
    $folder = "../profiles/";

    $response = array(); // Initialize response array

    // Check if file was uploaded successfully
    if (move_uploaded_file($tempName, $folder . $originalImgName)) {
        // Start transaction
        mysqli_autocommit($con, false);

        // Update attorney_assignments table
        $query1 = "UPDATE clients
                  SET bio = '$bio', portfolio = '$portfolio', profile_image = '$originalImgName' 
                  WHERE client_id = '$userID'";

        // Execute both queries
        $result1 = mysqli_query($con, $query1);

        if ($result1) {
            mysqli_commit($con); // Commit transaction if both queries succeed
            $response['status'] = '1';
            $response['message'] = 'Profile set successfully';
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
