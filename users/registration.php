<?php
include('includes/config.php');
error_reporting(0);
if (isset($_POST['submit'])) {
	$fullname = $_POST['fullname'];
	$email = $_POST['email'];
	$password = md5($_POST['password']);
	$contactno = $_POST['contactno'];
	$status = 1;

	// Check if contact number is exactly 11 digits and starts with "09"
	if (preg_match("/^09[0-9]{9}$/", $contactno)) {
		// Check if the contact number already exists in the database
		$query = mysqli_query($con, "SELECT * FROM users WHERE contactNo = '$contactno'");
		$count = mysqli_num_rows($query);
		if ($count == 0) {
			// Contact number does not exist in the database, proceed with registration
			$query = mysqli_query($con, "INSERT INTO users(fullName,userEmail,password,contactNo,status) VALUES('$fullname','$email','$password','$contactno','$status')");
			$msg = "Registration successful. Now You can login!";
		} else {
			$msg = "Contact number already exists.";
		}
	} else {
		$msg = "Contact number must be exactly 11 digits and start with '09'.";
	}
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

	<title>CMS | User Registration</title>
	<link href="assets/css/bootstrap.css" rel="stylesheet">
	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link href="assets/css/style.css" rel="stylesheet">
	<link href="assets/css/style-responsive.css" rel="stylesheet">
	<script>
		function userAvailability() {
			$("#loaderIcon").show();
			jQuery.ajax({
				url: "check_availability.php",
				data: 'email=' + $("#email").val(),
				type: "POST",
				success: function(data) {
					$("#user-availability-status1").html(data);
					$("#loaderIcon").hide();
				},
				error: function() {}
			});
		}
	</script>
	<script>
		// JavaScript function to limit the number field to 11 digits
		function limitContactNumber(event) {
			var input = event.target;
			if (input.value.length > 11) {
				input.value = input.value.slice(0, 11); // Limiting to 11 digits
			}
		}
	</script>
</head>

<body>
	<div id="login-page">
		<div class="container">
			<h3 align="center" style="color:#fff"><a href="../index.html" style="color:#fff">TUPI-Poblacion Online Complaint Management System</a></h3>
			<hr />
			<form class="form-login" method="post">
				<h2 class="form-login-heading">User Registration</h2>
				<p style="padding-left: 1%; color: green">
					<?php if ($msg) {
						echo htmlentities($msg);
					} ?>


				</p>
				<div class="login-wrap">
					<input type="text" class="form-control" placeholder="Full Name" name="fullname" required="required" autofocus>
					<br>
					<input type="email" class="form-control" placeholder="Email ID" id="email" onBlur="userAvailability()" name="email" required="required">
					<span id="user-availability-status1" style="font-size:12px;"></span>
					<br>
					<input type="password" class="form-control" placeholder="Password" required="required" name="password"><br>
					<input type="number" class="form-control" maxlength="11" name="contactno" placeholder="Contact no" required="required" autofocus oninput="limitContactNumber(event)">
					<br>

					<button class="btn btn-theme btn-block" type="submit" name="submit" id="submit"><i class="fa fa-user"></i> Register</button>
					<hr>

					<div class="registration">
						Already Registered<br />
						<a class="" href="index.php">
							Sign in
						</a>
					</div>
					<div class="chats">
						<a href="chats.php">
							<i class="fa fa-comment"></i> Go to Chats
						</a>
					</div>


				</div>



			</form>

		</div>
	</div>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!--BACKSTRETCH-->
	<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
	<script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
	<script>
		$.backstretch("assets/img/login-bg.jpg", {
			speed: 500
		});
	</script>


</body>

</html>