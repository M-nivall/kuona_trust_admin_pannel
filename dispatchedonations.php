<?php
include('dbconnect.php');
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
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <?php include 'partials/navbar.php' ?>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_sidebar.html -->
      <?php include 'partials/sidebar.php' ?>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Dispatched Donations</h4>

                  <!-- Print Button -->
                  <button onclick="printReport()" class="btn btn-primary mb-3">Print</button>

                  <div class="table-responsive">
                    <table id="zero_config" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID#</th>
                          <th>Amount</th>
                          <th>Donor</th>
                          <th>To Artist</th>
                          <th>Ref Code</th>
                          <th>Date</th>
                          <th>Artist Share</th>
                          <th>Company Share</th>
                          <th>Payment Method</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $select = "SELECT 
                            d.donation_id,
                            d.amount,
                            d.reference_code,
                            d.donation_date,
                            d.artist_share,
                            d.company_share,
                            d.payment_method,
                            CONCAT(dn.first_name, ' ', dn.last_name) AS donor_name,
                            CONCAT(c.first_name, ' ', c.last_name) AS artist_name
                          FROM 
                            donations d
                          INNER JOIN 
                            clients c ON d.artist_id = c.client_id
                          INNER JOIN 
                            donors dn ON d.donor_id = dn.donor_id
                          WHERE  
                            d.donation_status IN ('3', '4')";
                        $query = mysqli_query($db, $select);
                        while ($row = mysqli_fetch_array($query)) {
                        ?>
                          <tr class="odd gradeX">
                            <td><?php echo $row['donation_id'] ?></td>
                            <td><?php echo $row['amount'] ?></td>
                            <td><?php echo $row['donor_name'] ?></td>
                            <td><?php echo $row['artist_name'] ?></td>
                            <td><?php echo $row['reference_code'] ?></td>
                            <td><?php echo $row['donation_date'] ?></td>
                            <td><?php echo $row['artist_share'] ?></td>
                            <td><?php echo $row['company_share'] ?></td>
                            <td><?php echo $row['payment_method'] ?></td>
                            <td>Dispatched</td>
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
        <!-- partial:../../partials/_footer.html -->
        <?php include 'partials/footer.php' ?>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- DataTables -->
  <script src="assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
  <script src="assets/extra-libs/multicheck/jquery.multicheck.js"></script>
  <script src="assets/extra-libs/DataTables/datatables.min.js"></script>
  <script>
    $('#zero_config').DataTable();
  </script>

  <!-- Print Script -->
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
