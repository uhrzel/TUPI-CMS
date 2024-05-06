<?php
session_start();
error_reporting(0);
include("includes/config.php");

// Check if the login form is submitted
if (isset($_POST['submit'])) {
    $userEmail = $_POST['username'];
    $password = md5($_POST['password']);

    $query = "SELECT * FROM users WHERE userEmail='$userEmail' AND password='$password'";
    $result = mysqli_query($con, $query);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $_SESSION['userEmail'] = $row['userEmail']; // Store user's email in session
    } else {
        $errormsg = "Invalid username or password";
    }
}

// Check if user is logged in
if (!isset($_SESSION['userEmail'])) {
    // If not logged in, display the login form
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <!-- Link to your external CSS file -->
        <link rel="stylesheet" href="styles.css">
        <!-- Inline CSS for the login form -->
        <style>
            .container {

                width: 100%;
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            input[type="email"],
            input[type="password"],
            button {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            button {
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            p.error {
                color: red;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>Login</h2>
            <form method="POST">
                <input type="email" name="username" placeholder="Email" required autofocus>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit" name="submit">Login</button>
            </form>
            <p class="error"><?php if (isset($errormsg)) echo $errormsg; ?></p>
        </div>
    </body>

    </html>


<?php
    exit(); // Exit to prevent displaying the rest of the page
}

// User is logged in, continue displaying the chat interface

$userEmail = $_SESSION['userEmail'];

// Check if the chat form is submitted
if (isset($_POST['message'])) {
    $message = $_POST['message'];
    $query = "INSERT INTO chats (userEmail, message) VALUES ('$userEmail', '$message')";
    mysqli_query($con, $query);

    // Redirect to prevent form resubmission when refreshing the page
    header("Location: " . $_SERVER['REQUEST_URI']);
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CMS | Chats</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .chat-box {
            height: 300px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        #message {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .logout-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            width: 100%;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>

    <div class="container">
        <h2>Welcome, <?php echo $userEmail; ?></h2>
        <div class="chat-box" id="chatBox">
            <!-- Display messages from 'chats' table -->
            <?php
            $queryChats = "SELECT * FROM chats WHERE userEmail='$userEmail'";
            $resultChats = mysqli_query($con, $queryChats);
            while ($rowChat = mysqli_fetch_assoc($resultChats)) {
                echo "<div><strong>{$rowChat['userEmail']}:</strong> {$rowChat['message']}</div>";
            }
            ?>
            <!-- Display messages from 'replies' table -->
            <?php
            $queryReplies = "SELECT * FROM replies WHERE userEmail='$userEmail'";
            $resultReplies = mysqli_query($con, $queryReplies);
            while ($rowReply = mysqli_fetch_assoc($resultReplies)) {
                echo "<div><strong>Admin Reply:</strong> {$rowReply['message']}</div>";
            }
            ?>
        </div>
        <form id="chatForm" class="chat-form" method="POST">
            <textarea name="message" id="message" placeholder="2000 Max" required></textarea>
            <button type="submit">Send</button>
        </form>
        <!-- Logout button -->
        <button class="logout-btn" onclick="confirmLogout()">Logout</button>
    </div>
</body>



<script>
    function confirmLogout() {
        if (confirm("Are you sure you want to logout?")) {
            window.location.href = 'logout.php';
        }
    }
</script>
</body>

</html>