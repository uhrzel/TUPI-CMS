<?php
// Include your database connection configuration file
include("include/config.php");

// Get the selected user email from the AJAX request
$userEmail = $_GET['userEmail'];

// Query the database to fetch messages for the selected user
$query = "SELECT message FROM chats WHERE userEmail = '$userEmail'";
$result = mysqli_query($con, $query);

// Display the fetched messages
echo "<ul>";
while($row = mysqli_fetch_assoc($result)) {
    echo "<li>" . $row['message'] . "</li>";
}
echo "</ul>";

// Close the database connection
mysqli_close($con);
?>
