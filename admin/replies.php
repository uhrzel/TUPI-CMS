<?php
// Include your database connection configuration file
include("include/config.php");

// Function to handle form submission for each reply
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['reply'])) {
    $replyUserEmail = $_POST['replyUserEmail'];
    $replyMessage = $_POST['replyMessage'];

    // Insert the reply into the "replies" table
    $insertQuery = "INSERT INTO replies (userEmail, message) VALUES ('$replyUserEmail', '$replyMessage')";
    if (mysqli_query($con, $insertQuery)) {
        // Redirect to the same page to prevent form resubmission
        header("Location: ".$_SERVER['REQUEST_URI']);
        exit; // Prevent further execution
    } else {
        echo "Error: " . mysqli_error($con);
    }
}
?>
<?php include('include/header.php');?>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMS | Admin login</title>
    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link type="text/css" href="css/theme.css" rel="stylesheet">
    <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>


    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .reply-box {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 10px;
            margin-top: 10px;
        }
        .reply-box textarea {
            width: calc(100% - 16px); /* Subtract padding and border width */
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 5px;
        }
        .reply-box button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .reply-box button:hover {
            background-color: #0056b3;
        }
        #successMessage {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: limegreen;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 20px;
            padding: 10px 20px;
            z-index: 9999;
        }
        .replied-message {
            background-color: #f2f2f2; /* Gray background */
        }
        .selected-message {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
        }
     
    .center-dropdown {
/*        background-color: white;*/
        color:black;
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        text-align: center; /* Center the dropdown text */
    }

    </style>
</head>

<body>
    

   <div class="container">
    <h2>Chats</h2>
    <?php
    // Retrieve distinct user emails from the "chats" table
    $query = "SELECT DISTINCT userEmail FROM chats";
    $result = mysqli_query($con, $query);

    // Check if there are any rows returned
    if(mysqli_num_rows($result) > 0) {
        // Display the fetched data
        echo "<table>
                <tr>
                    <th>User Email</th>
                    <th>Complainants Messages</th>
                </tr>";

        // Loop through each user's messages
       while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>" . $row['userEmail'] . "</td>";
    echo "<td>";

    // Fetch messages for the current user
    $userEmail = $row['userEmail'];
    $queryMessages = "SELECT message FROM chats WHERE userEmail = '$userEmail'";
    $resultMessages = mysqli_query($con, $queryMessages);

    // Display a dropdown menu for the messages
    echo "<select id='messageDropdown'class='center-dropdown' onchange='displaySelectedMessage(this)'>";
    // Add an "Empty" option
    echo "<option value=''>Empty</option>";
    while($rowMessage = mysqli_fetch_assoc($resultMessages)) {
        echo "<option>" . $rowMessage['message'] . "</option>";
    }
    echo "</select>";

    echo "</td>";
    echo "</tr>";


            // Add a reply box for each user
            echo "<tr>
                    <td colspan='2'>
                        <div class='selected-message' id='selectedMessage'></div> <!-- Display selected message here -->
                        <form method='POST'>
                            <input type='hidden' name='replyUserEmail' value='" . $row['userEmail'] . "'>
                            <input type='hidden' id='selectedMessageInput' name='replyMessage'> <!-- Hidden input to store selected message -->
                            <div class='reply-box'>
                                <textarea id='replyTextArea' name='replyMessage' placeholder='Reply to this message' required></textarea><br>
                                <button type='submit' name='reply'>Send</button>
                            </div>
                        </form>
                    </td>
                </tr>";
        }

        echo "</table>";
    } else {
        // Display a message if no data is found
        echo "No chats found.";
    }

    // Close the database connection
    mysqli_close($con);
    ?>
</div>

<script>
    // JavaScript function to hide the success message after 2 seconds
    setTimeout(function() {
        var successMessage = document.getElementById('successMessage');
        if (successMessage) {
            successMessage.style.display = 'none';
        }
    }, 2000); // 2000 milliseconds = 2 seconds

    // Function to display the selected message above the reply box
    function displaySelectedMessage(select) {
        var selectedMessage = select.value;
        document.getElementById('selectedMessage').innerHTML = "<strong>Selected Message:</strong> " + selectedMessage;
        // Set the selected message in the hidden input field
        document.getElementById('selectedMessageInput').value = selectedMessage;
    }
    // Function to find different user emails when a dropdown is clicked
function findUserEmail(select) {
    var selectedUserEmail = select.options[select.selectedIndex].parentNode.label;
    document.getElementById('selectedUserEmail').innerHTML = "<strong>Selected User Email:</strong> " + selectedUserEmail;
}

</script>
</body>
</html>
