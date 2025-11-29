<?php
session_start();
include('include/connections.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Kuona Trust</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="assets/extra-libs/DataTables/datatables.min.css">
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <?php include 'partials/navbar.php'; ?>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <?php include 'partials/sidebar.php'; ?>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Ongoing Workshops</h4>
                  <button onclick="printReport()" class="btn btn-primary mb-3">Print</button>
                  <div class="table-responsive">
                    <table id="zero_config" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID#</th>
                          <th>Title</th>
                          <th>Date</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $select = "SELECT * FROM workshops WHERE workshop_status = 'Ongoing'";
                        $query = mysqli_query($con, $select);
                        while ($row = mysqli_fetch_array($query)) {
                        ?>
                          <tr>
                            <td><?php echo $row['workshop_id']; ?></td>
                            <td><?php echo $row['title']; ?></td>
                            <td><?php echo $row['workshop_date']; ?></td>
                            <td><?php echo $row['workshop_status']; ?></td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <?php include 'partials/footer.php'; ?>
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- Plugin js for this page -->
  <script src="assets/extra-libs/DataTables/datatables.min.js"></script>
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- Custom js for this page -->
  <script>
    $(document).ready(function() {
      $('#zero_config').DataTable(); // Enables search, sort, pagination
    });
  </script>
    <script>
    function printReport() {
      var printContents = document.querySelector(".table-responsive").innerHTML;
      var originalContents = document.body.innerHTML;
      document.body.innerHTML = `
        <html>
          <head>
            <title>Dispatched Donations Report</title>
            <style>
              table {
                width: 100%;
                border-collapse: collapse;
              }
              table, th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
              }
              h4 {
                text-align: center;
              }
            </style>
          </head>
          <body>
            <h4>Dispatched Donations Report</h4>
            ${printContents}
          </body>
        </html>`;
      window.print();
      document.body.innerHTML = originalContents;
      location.reload(); // reload original page after print
    }
  </script>
</body>

</html>
