<?php
include '../../include/connections.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $exhibitionID = $_POST['exhibitionID'];

// Creating the query
$select = "SELECT e.id,e.exhibition_id,e.artist_id,e.title,e.art_desc,e.image_name,
        e.ex_status,c.first_name,c.last_name
        FROM exhibition_artworks e
        INNER JOIN clients c ON e.artist_id = c.client_id 
        WHERE e.ex_status = 'Pending approval' AND exhibition_id = '$exhibitionID' 
        ORDER BY e.id DESC";

$query = mysqli_query($con, $select);

$results = array();

if (mysqli_num_rows($query) > 0) {
    $results['status'] = "1";
    $results['message'] = "Exhibition Applicants";
    $results['details'] = array();

    while ($row = mysqli_fetch_assoc($query)) {
        $temp = array();
        $temp['ID'] = $row['id'];
         $temp['exhibitionID'] = $row['exhibition_id'];
        $temp['artistID'] = $row['artist_id'];
         $temp['artistName'] = $row['first_name'] . ' ' . $row['last_name'];
        $temp['title'] = $row['title'];
        $temp['artDesc'] = $row['art_desc'];
        $temp['imageName'] = $row['image_name'];
        $temp['exStatus'] = $row['ex_status'];

        array_push($results['details'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = "No record found";
}

echo json_encode($results);
}
?>
