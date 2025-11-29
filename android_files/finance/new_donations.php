<?php
include '../../include/connections.php';

header('Content-Type: application/json');

// Creating the query
$select = "SELECT d.donation_id, d.art_id, d.artist_id, d.donor_id, d.amount, d.payment_method, d.reference_code,
          c.first_name AS artist_fname, c.last_name AS artist_lname,
          dn.first_name AS donor_fname, dn.last_name AS donor_lname
          FROM donations d
          INNER JOIN clients c ON d.artist_id = c.client_id
          INNER JOIN donors dn ON d.donor_id = dn.donor_id
          WHERE d.donation_status = '1'
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
        $temp['donationStatus'] = "New Donation";

        array_push($results['details'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = "No record found";
}

echo json_encode($results);
?>
