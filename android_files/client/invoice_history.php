<?php

include '../../include/connections.php';

$clientID = $_POST['clientID'];

// Creating a query to fetch unique orders for the specified client
$select = "SELECT o.order_id, o.order_status, o.order_date, o.address, 
                  MAX(p.item_price) AS item_price, SUM(p.quantity) AS quantity, 
                  MAX(p.item_status) AS item_status 
           FROM bookings o 
           INNER JOIN order_items p ON o.order_id = p.order_id 
           WHERE o.client_id = '$clientID' 
           GROUP BY o.order_id 
           ORDER BY o.order_id DESC";

$query = mysqli_query($con, $select);

if (mysqli_num_rows($query) > 0) {
    $results = array();
    $results['status'] = "1";
    $results['orders'] = array();
    $results['message'] = "Order history";
    
    while ($row = mysqli_fetch_array($query)) {
        $temp = array();

        $temp['orderID'] = $row['order_id'];
        $temp['orderDate'] = $row['order_date'];
        $temp['orderCost'] = $row['item_price'];
        $temp['mpesaCode'] = $row['address'];
        $temp['shippingCost'] = $row['quantity'];
        $temp['itemCost'] = $row['item_price'];

        // Convert order_status to a readable status message
        switch ($row['order_status']) {
            case 1:
                $temp['orderStatus'] = "Pending";
                break;
            case 2:
                $temp['orderStatus'] = "Approved";
                break;
            case 3:
                $temp['orderStatus'] = "Shipping";
                break;
            case 4:
                $temp['orderStatus'] = "Pay Invoiced Amount";
                break;
            case 5:
            case 6:
                $temp['orderStatus'] = "Invoice Paid";
                break;
            case 7:
                $temp['orderStatus'] = "Confirm Completion";
                break;
            case 8:
                $temp['orderStatus'] = "Service Completed";
                break;
            default:
                $temp['orderStatus'] = "Unknown";
        }

        array_push($results['orders'], $temp);
    }
} else {
    $results['status'] = "0";
    $results['message'] = "No Invoice Found";
}

// Displaying the result in JSON format
echo json_encode($results);

?>
