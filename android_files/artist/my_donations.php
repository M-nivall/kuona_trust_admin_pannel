<?php
include '../../include/connections.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $userID = $_POST['userID'];

    // Updated SQL query to LEFT JOIN both artwork and exhibition tables
    $select = "SELECT 
                d.donation_id, d.art_id, d.artist_id, d.donor_id, d.amount, 
                d.payment_method, d.reference_code, d.donation_date, d.donation_status, d.donation_for,
                c.first_name AS artist_fname, c.last_name AS artist_lname,
                dn.first_name AS donor_fname, dn.last_name AS donor_lname,
                ea.title AS exhibition_title,
                aw.title AS artwork_title
              FROM donations d
              INNER JOIN clients c ON d.artist_id = c.client_id
              INNER JOIN donors dn ON d.donor_id = dn.donor_id
              LEFT JOIN exhibition_artworks ea ON d.art_id = ea.id AND d.donation_for = 'Exhibition'
              LEFT JOIN art_work aw ON d.art_id = aw.id AND d.donation_for = 'Artwork'
              WHERE d.donation_status IN ('1','2','3') AND d.artist_id = '$userID'
              ORDER BY d.donation_id DESC";

    $query = mysqli_query($con, $select);

    $results = array();

    if (mysqli_num_rows($query) > 0) {
        $results['status'] = "1";
        $results['message'] = "New Donations";
        $results['details'] = array();

        while ($row = mysqli_fetch_assoc($query)) {
            $temp = array();
            $temp['donationID'] = $row['donation_id'];
            $temp['donorID'] = $row['donor_id'];
            $temp['artistName'] = $row['artist_fname'] . ' ' . $row['artist_lname'];
            $temp['donorName'] = $row['donor_fname'] . ' ' . $row['donor_lname'];
            $temp['artID'] = $row['art_id'];
            $temp['artistID'] = $row['artist_id'];
            $temp['amount'] = $row['amount'];
            $temp['paymentMethod'] = $row['payment_method'];
            $temp['referenceCode'] = $row['reference_code'];
            $temp['donationDate'] = $row['donation_date'];
           // $temp['donationFor'] = $row['donation_for'];
            $temp['title'] = ($row['donation_for'] == 'Exhibition') ? $row['exhibition_title'] : $row['artwork_title'];

            if($row['donation_status'] == 1){
                $temp['donationStatus'] = "Pending";
            } elseif ($row['donation_status'] == 2){
                $temp['donationStatus'] = "Pending Dispatched";
            } elseif ($row['donation_status'] == 3){
                $temp['donationStatus'] = "Dispatched";
            }

            array_push($results['details'], $temp);
        }
    } else {
        $results['status'] = "0";
        $results['message'] = "No donations found.";
    }

    echo json_encode($results);
}
?>
