<?php

include "../../include/connections.php";


if($_SERVER['REQUEST_METHOD']=='POST'){

$workshopID=$_POST['workshopID'];

$update=" UPDATE workshops SET workshop_status = 'Ongoing' WHERE workshop_id='$workshopID'";
if(mysqli_query($con,$update)){

    $response['status']=1;
    $response['message']='Approved successfully';

}else{
    $response['status']=0;
    $response['message']='Please try again';


}
echo json_encode($response);
}
?>