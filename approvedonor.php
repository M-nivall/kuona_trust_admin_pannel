<?php
include("dbconnect.php");

$id=$_GET['updateid'];
$sql="update `donors` set status='Approved' where $id=$id";
$result=mysqli_query($db,$sql);
if($result){
        //echo "Data updated successfully";
        header('location:approvedonors.php');
}else{
        die(mysqli_error($con));
    }
    

?>
