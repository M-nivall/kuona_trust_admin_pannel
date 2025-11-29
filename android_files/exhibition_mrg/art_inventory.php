  <?php


  include '../../include/connections.php';

  $select="SELECT * FROM inventory i INNER JOIN exhibitions e ON i.exhibition_id = e.exhibition_id";
  $query=mysqli_query($con,$select);


    if(mysqli_num_rows($query)>0){
        $response['status']=1;
        $response['message']="Inventory";
        $response['details']=array();

        while ($row=mysqli_fetch_array($query)){
            $index['ID']=$row['id'];
            $index['title']=$row['title'];
            $index['imageName']=$row['image_name'];
            $index['exhibitionID']=$row['exhibition_id'];
            $index['artistID']=$row['artist_id'];
            $index['artistName']=$row['artist_name'];
            $index['startingDate']=$row['starting_date'];

            array_push($response['details'],$index);
        }
        echo json_encode($response);
    }
    ?>