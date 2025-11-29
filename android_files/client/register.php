<?php

include '../../include/connections.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $username = $_POST['username'];
    $phoneNo = $_POST['phoneNo'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $role = $_POST['role'];

    if (empty($firstname) || empty($lastname) || empty($username) || empty($email) || empty($phoneNo) || empty($password)) {
        $response["status"] = 0;
        $response["message"] = "Some details are missing";
        echo json_encode($response);
        mysqli_close($con);
        exit();
    }

    // Check if username already exists
    $checkUsername = "SELECT username FROM clients WHERE username='$username'";
    $result = mysqli_query($con, $checkUsername);
    if (mysqli_num_rows($result) > 0) {
        $response["status"] = 0;
        $response["message"] = "Username is registered with another account";
        echo json_encode($response);
        exit();
    }

    // Check if phone number already exists
    $checkPhone = "SELECT phone_no FROM clients WHERE phone_no='$phoneNo'";
    $result = mysqli_query($con, $checkPhone);
    if (mysqli_num_rows($result) > 0) {
        $response["status"] = 0;
        $response["message"] = "Phone number is registered with another account";
        echo json_encode($response);
        exit();
    }

    // Check if email already exists
    $checkEmail = "SELECT email FROM clients WHERE email='$email'";
    $result = mysqli_query($con, $checkEmail);
    if (mysqli_num_rows($result) > 0) {
        $response["status"] = 0;
        $response["message"] = "Email is registered with another account";
        echo json_encode($response);
        exit();
    }

    // If role is Patron, insert into donors table
    if ($role == 'Patron') {
        $insertDonor = "INSERT INTO donors (first_name, last_name, username, phone_no, email, password, user)
                         VALUES ('$firstname','$lastname','$username','$phoneNo','$email','$password','$role')";
        if (mysqli_query($con, $insertDonor)) {
            $response["status"] = 1;
            $response["message"] = "You have successfully registered as a Patron (Donor)";
            echo json_encode($response);
        } else {
            $response["status"] = 0;
            $response["message"] = "Failed to register as a Patron";
            echo json_encode($response);
        }
    } else {
        // Otherwise insert into clients table
        $insertClient = "INSERT INTO clients (first_name, last_name, username, phone_no, email, password, user)
                         VALUES ('$firstname','$lastname','$username','$phoneNo','$email','$password','$role')";
        if (mysqli_query($con, $insertClient)) {
            $response["status"] = 1;
            $response["message"] = "You have successfully registered";
            echo json_encode($response);
        } else {
            $response["status"] = 0;
            $response["message"] = "Something went wrong, please try again";
            echo json_encode($response);
        }
    }
}
?>
