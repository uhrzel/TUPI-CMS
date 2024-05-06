<?php
session_start();
include("includes/config.php");

// Check if user is logged in
if(isset($_SESSION['userEmail'])) {
    // Update user log with logout time
    date_default_timezone_set('Asia/Kolkata');
    $ldate = date('d-m-Y h:i:s A', time());
    mysqli_query($con, "UPDATE userlog SET logout = '$ldate' WHERE username = '".$_SESSION['userEmail']."' ORDER BY id DESC LIMIT 1");

    // Unset all session variables
    session_unset();
    
    // Destroy the session
    session_destroy();
}

// Redirect to the login page
header("Location: ../index.html");
exit();
?>
