<?php
include '../../include/connections.php';

header('Content-Type: application/json');

// Creating the query
$select = "SELECT a.id,a.artist_id,a.title,a.art_desc,a.image_name,
        a.art_status,c.first_name,c.last_name
        FROM art_work a
        INNER JOIN clients c ON a.artist_id = c.client_id 
        WHERE a.art_status = 'Pending approval' 
        ORDER BY a.id DESC";

$query = mysqli_query($con, $select);

$results = array();

if (mysqli_num_rows($query) > 0) {
    $results['status'] = "1";
    $results['message'] = "Pending Artworks";
    $results['details'] = array();

    while ($row = mysqli_fetch_assoc($query)) {
        $temp = array();
        $temp['ID'] = $row['id'];
        $temp['artistID'] = $row['artist_id'];
        $temp['artistName'] = $row['first_name'] . ' ' . $row['last_name'];
        $temp['title'] = $row['title'];
        $temp['artDesc'] = $row['art_desc'];
        $temp['imageName'] = $row['image_name'];
        $temp['artStatus'] = $row['art_status'];

        array_push($results['details'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = "No record found";
}

echo json_encode($results);
?>
