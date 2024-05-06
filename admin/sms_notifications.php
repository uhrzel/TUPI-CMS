<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin | Complaint Details</title>
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="css/theme.css" rel="stylesheet">
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
        <style>
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #f4f4f4;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 30px;
                z-index: 9999;
            }

            .popup textarea {
                width: calc(100% - 20px);
                /* Adjust for padding */
                height: 300px;
                margin-bottom: 10px;
                resize: none;
                padding: 10px;
            }

            .popup button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .popup .close {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 30px;
                color: red;
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <?php include('include/header.php'); ?>
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <?php include('include/sidebar.php'); ?>
                    <div class="span9">
                        <div class="content">
                            <div class="module">
                                <div class="module-head">
                                    <h3> SMS Notifications and Progress</h3>
                                </div>
                                <div class="module-body table">
                                    <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped display" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Complaint Name</th>
                                                <th>Complaint Type</th>
                                                <th>Messages</th>
                                                <th>Contact Number</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $query = "SELECT c.complaintNumber, c.complaintType, c.noc, c.complaintDetails, c.status, u.fullName, u.contactNo 
                                            FROM tblcomplaints c 
                                            INNER JOIN users u ON c.userId = u.id
                                            WHERE c.status IN ('closed', 'in process')";
                                            $result = mysqli_query($con, $query);
                                            while ($row = mysqli_fetch_assoc($result)) {
                                                echo "<tr>";
                                                echo "<td>{$row['fullName']}</td>";
                                                echo "<td>{$row['complaintType']}</td>";
                                                echo "<td>{$row['complaintDetails']}</td>";
                                                echo "<td>{$row['contactNo']}</td>";
                                                echo "<td>{$row['status']}</td>";
                                                echo "</tr>";
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--/.content-->
                    </div><!--/.span9-->
                </div>
            </div><!--/.container-->
        </div><!--/.wrapper-->
        <?php include('include/footer.php'); ?>
    </body>
<?php } ?>