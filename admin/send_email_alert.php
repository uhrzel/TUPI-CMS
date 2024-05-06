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
                                    <h3>Complaint Details</h3>
                                </div>
                                <div class="module-body table">
                                    <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped display" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Complaint Name</th>
                                                <th>Nature of Complaint</th>
                                                <th>Email</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $query = "SELECT tblcomplaints.complaintType, users.fullName, users.userEmail, tblcomplaints.noc FROM tblcomplaints JOIN users ON users.id = tblcomplaints.userId WHERE tblcomplaints.complaintType = 'Urgent'";
                                            $result = mysqli_query($con, $query);
                                            while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                                <tr>
                                                    <td><?php echo htmlentities($row['fullName']); ?></td>
                                                    <td><?php echo htmlentities($row['noc']); ?></td>
                                                    <td><?php echo htmlentities($row['userEmail']); ?></td>
                                                    <td><button onclick="redirectToGmail('<?php echo htmlentities($row['userEmail']); ?>')" class="btn btn-primary">Send Email Alert</button></td>
                                                </tr>
                                            <?php } ?>
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
        <div id="emailPopup" class="popup">
            <span class="close" onclick="closePopup()">&times;</span>
            <form id="emailForm">
                <textarea id="emailText" placeholder="Type your message here" required></textarea>
                <button type="submit">Send Email Alert</button>
            </form>
        </div>
        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script>
            function showPopup(userEmail) {
                $('#emailPopup').show(); // Show the popup
                $('#emailText').val(''); // Clear any previous text
                $('#emailText').focus(); // Focus on the textarea
                // Assign the email to a hidden input field (if needed)
                $('#emailPopup').data('userEmail', userEmail);
            }

            function closePopup() {
                $('#emailPopup').hide(); // Hide the popup
            }

            $('#emailForm').submit(function(event) {
                event.preventDefault(); // Prevent form submission
                var userEmail = $('#emailPopup').data('userEmail');
                var message = $('#emailText').val();
                // Perform your email sending action here
                // For now, let's just log the message
                console.log("Email sent to: " + userEmail + "\nMessage: " + message);
                $('#emailPopup').hide(); // Hide the popup after sending
                alert("Alert has been sent successfully!"); // Show alert message
                // Change the color of the row to light grey
                $('tr').each(function() {
                    if ($(this).find('td:nth-child(3)').text() === userEmail) {
                        $(this).css('background-color', '#f2f2f2'); // Light grey color
                    }
                });
            });
        </script>
        <script>
            function redirectToGmail(userEmail) {
                // Construct the Gmail URL with the email address
                var gmailUrl = 'https://mail.google.com/mail/?view=cm&fs=1&to=' + encodeURIComponent(userEmail);
                // Open the Gmail URL in a new tab/window
                window.open(gmailUrl, '_blank');
            }
        </script>

    </body>
<?php } ?>