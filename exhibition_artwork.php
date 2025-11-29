<?php
include('dbconnect.php'); // Ensure this file contains your DB connection setup
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Approved Artworks - Kuona Trust</title>
  <!-- Base styles -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- DataTables CSS -->
  <link rel="stylesheet" href="assets/extra-libs/DataTables/datatables.min.css">
  <!-- Custom styles -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
</head>

<body>
  <div class="container-scroller">
    <?php include 'partials/navbar.php'; ?>
    <div class="container-fluid page-body-wrapper">
      <?php include 'partials/sidebar.php'; ?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Approved Artwork for Exhibition</h4>
                  <div class="table-responsive">
                    <table id="approved_artworks" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Artwork Title</th>
                          <th>Artist Name</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $getID = isset($_GET['get']) ? intval($_GET['get']) : 0;
                        $select = "SELECT e.id, e.title, CONCAT(c.first_name, ' ', c.last_name) AS artist_name
                                   FROM exhibition_artworks e
                                   INNER JOIN clients c ON e.artist_id = c.client_id
                                   WHERE e.ex_status = 'Approved' AND e.exhibition_id = $getID";
                        $query = mysqli_query($db, $select);
                        while ($row = mysqli_fetch_array($query)) {
                        ?>
                          <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo $row['title']; ?></td>
                            <td><?php echo $row['artist_name']; ?></td>
                            <td>Approved</td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div> <!-- End row -->
        </div> <!-- End content-wrapper -->
        <?php include 'partials/footer.php'; ?>
      </div> <!-- End main-panel -->
    </div> <!-- End page-body-wrapper -->
  </div> <!-- End container-scroller -->

  <!-- JavaScript -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <script src="assets/extra-libs/DataTables/datatables.min.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>

  <!-- DataTable Initialization -->
  <script>
    $(document).ready(function() {
      $('#approved_artworks').DataTable();
    });
  </script>
</body>

</html>
