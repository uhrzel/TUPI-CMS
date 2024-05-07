<style>
	/* Blinking animation */
	/* Blinking and shadow animation */
	@keyframes blink_shadow {
		0% {
			opacity: 1;
			box-shadow: 0 0 5px rgba(255, 0, 0, 0.7);
			/* Initial shadow */
		}

		50% {
			opacity: 0;
			box-shadow: 0 0 10px rgba(255, 0, 0, 0.7);
			/* Larger shadow */
		}

		100% {
			opacity: 1;
			box-shadow: 0 0 5px rgba(255, 0, 0, 0.7);
			/* Initial shadow */
		}
	}

	/* Add the animation to the badge */
	.blink_me {
		animation: blink_shadow 1s infinite;
		/* Blinking and shadow animation */
		color: #fff;
		background-color: #ff0000;
		/* Red color */
	}

	/* Badge style */
	.badge {
		display: inline-block;
		padding: 4px 8px;
		font-size: 12px;
		font-weight: bold;
		line-height: 1;
		color: #fff;
		background-color: red;
		/* Blue color */
		border-radius: 10px;
		margin-left: 5px;
	}

	/* Badge color on hover */
	.sub-menu:hover .badge {
		background-color: #0056b3;
		/* Darker blue color on hover */
	}
</style>

<div class="span3">
	<div class="sidebar">


		<ul class="widget widget-menu unstyled">
			<li>
				<a class="collapsed" data-toggle="collapse" href="#togglePages">
					<i class="menu-icon icon-cog"></i>
					<i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
					Manage Complaint
				</a>
				<ul id="togglePages" class="collapse unstyled">
					<li>
						<a href="notprocess-complaint.php">
							<i class="icon-tasks"></i>
							Not Process Yet Complaint
							<?php
							$rt = mysqli_query($con, "SELECT * FROM tblcomplaints where status is null");
							$num1 = mysqli_num_rows($rt); { ?>

								<b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
							<?php } ?>
						</a>
					</li>
					<li>
						<a href="inprocess-complaint.php">
							<i class="icon-tasks"></i>
							Pending Complaint
							<?php
							$status = "in Process";
							$rt = mysqli_query($con, "SELECT * FROM tblcomplaints where status='$status'");
							$num1 = mysqli_num_rows($rt); { ?><b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
							<?php } ?>
						</a>
					</li>
					<li>
						<a href="closed-complaint.php">
							<i class="icon-inbox"></i>
							Closed Complaints
							<?php
							$status = "closed";
							$rt = mysqli_query($con, "SELECT * FROM tblcomplaints where status='$status'");
							$num1 = mysqli_num_rows($rt); { ?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
							<?php } ?>

						</a>
					</li>
				</ul>
			</li>

			<li>
				<a href="manage-users.php">
					<i class="menu-icon icon-group"></i>
					Manage users
				</a>
			</li>
		</ul>


		<ul class="widget widget-menu unstyled">
			<!-- <li><a href="category.php"><i class="menu-icon icon-tasks"></i> Add Category </a></li>
                                <li><a href="subcategory.php"><i class="menu-icon icon-tasks"></i>Add Sub-Category </a></li> -->
			<li><a href="state.php"><i class="menu-icon icon-paste"></i>Add Address</a></li>


		</ul><!--/.widget-nav-->

		<ul class="widget widget-menu unstyled">
			<li><a href="user-logs.php"><i class="menu-icon icon-tasks"></i>User Login Log </a></li>
			<!-- <ul class="widget widget-menu unstyled"> -->
			<li class="sub-menu">
				<a href="replies.php">
					<i class="menu-icon icon-envelope"></i>
					<span>Chats</span>
					<?php
					// Count the number of messages from the chat table
					$query = "SELECT COUNT(*) AS num_messages FROM chats"; // Assuming "chat" is the table name
					$result = mysqli_query($con, $query);
					$row = mysqli_fetch_assoc($result);
					$num_messages = $row['num_messages'];

					// Display the notification badge with the number of messages
					if ($num_messages > 0) {
						echo '<span class="badge badge-info">' . $num_messages . '</span>';
					}
					?>
				</a>
			</li>
			<li>
				<a href="urgent_identification.php" onclick="removeBadgeOnSpecificPage()">
					<i class="menu-icon icon-star"></i>
					Urgent Identification Status
					<?php
					// Count the number of complaints inside "Urgent Identification"
					$query = "SELECT COUNT(*) AS num_complaints FROM tblcomplaints WHERE complaintType = 'Urgent'";
					$result = mysqli_query($con, $query);
					$row = mysqli_fetch_assoc($result);
					$num_complaints = $row['num_complaints'];

					// Display the notification badge with the number of complaints
					if ($num_complaints > 0) {
						echo '<span class="badge badge-info blink_me">' . $num_complaints . '</span>';
					}
					?>
				</a>
			</li>

			<li>
				<a href="send_email_alert.php">
					<i class="menu-icon icon-inbox"></i>
					Send Email Alerts
				</a>
			</li>
			<li>
				<a href="sms_notifications.php" onclick="removeBadgeOnSpecificPagechat()">
					<i class="menu-icon icon-bell"></i>
					SMS
					<?php
					// Include config file and establish database connection

					// Define SQL query to count the number of users with a contact number
					$query = "SELECT COUNT(*) AS total FROM users WHERE contactNo IS NOT NULL AND contactNo != ''";

					// Execute the query
					$result = mysqli_query($con, $query);

					// Check if query executed successfully
					if ($result) {
						// Fetch the result as an associative array
						$row = mysqli_fetch_assoc($result);
						// Access the total count
						$totalUsersWithContactNo = $row['total'];
						// Output the count as a badge
						echo '<span class="badge badge-danger ml-auto uwu">' . $totalUsersWithContactNo . '</span>';
					} else {
						// Handle query execution error
						echo "Error executing query: " . mysqli_error($con);
					}


					?>
				</a>
			</li>

			<li>
				<a href="backup.php">
					<i class="menu-icon icon-file"></i>
					Data Backup
				</a>
			</li>
			<li>
				<a href="logout.php">
					<i class="menu-icon icon-signout"></i>
					Logout
				</a>
			</li>
		</ul>

	</div><!--/.sidebar-->
</div><!--/.span3-->
<script>
	// JavaScript function to remove the badge when navigating to "urgent_identification.php"
	function removeBadgeOnSpecificPage() {
		var currentPageUrl = window.location.href;
		var targetPageUrl = "urgent_identification.php";
		if (currentPageUrl.includes(targetPageUrl)) {
			var badge = document.querySelector('.blink_me');
			if (badge) {
				badge.parentNode.removeChild(badge);
			}
		}
	}

	function removeBadgeOnSpecificPagechat() {
		var currentPageUrl = window.location.href;
		var targetPageUrl = "sms_notifications.php";
		if (currentPageUrl.includes(targetPageUrl)) {
			var badge = document.querySelector('.uwu');
			if (badge) {
				badge.parentNode.removeChild(badge);
			}
		}
	}

	// Call the function to remove the badge when the page is loaded
	window.onload = function() {
		removeBadgeOnSpecificPage();
		removeBadgeOnSpecificPagechat();
	};
</script>