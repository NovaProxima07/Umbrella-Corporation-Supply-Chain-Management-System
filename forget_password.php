<?php
include 'database.php';

$successMessage = "";
$errorMessage = "";

if (isset($_POST['reset'])) {
    $email = $_POST['email'];
    $companyID = $_POST['companyID'];

    // Check if the email and company ID match in the database
    $checkQuery = "SELECT * FROM registration WHERE Email = '$email' AND Company = '$companyID'";
    $checkResult = mysqli_query($connection, $checkQuery);

    if (mysqli_num_rows($checkResult) > 0) {
        // Email and company ID match, update password
        $newPassword = $_POST['newPassword'];

        $updateQuery = "UPDATE registration SET Password = '$newPassword' WHERE Email = '$email' AND Company = '$companyID'";
        if (mysqli_query($connection, $updateQuery)) {
            $successMessage = "Password updated successfully!";
        } else {
            $errorMessage = "Failed to update password. Please try again.";
        }
    } else {
        $errorMessage = "Invalid Credentials! Please try again.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="style-login.css">
    <link rel="stylesheet" href="style.css">
    <style>
        /* Add the modified CSS code here */
     
        .success-text {
            display: <?php echo $successMessage ? 'block' : 'none'; ?>;
            text-align: center;
            padding: 20px;
            background-color: #ff000050;
            color: #fff;
        }

        .error-text {
            display: <?php echo $errorMessage ? 'block' : 'none'; ?>;
            text-align: center;
            padding: 20px;
            background-color: #ff000050;
            color: #fff;
        }

        .success-text a,
        .error-text a {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="banner">
        <div class="navbar">
            <a href="index.html"><img src="elements/umbrella.png"></a>
            <video autoplay loop muted plays-inline class="back-video">
                <source src="elements/login1.mp4" type="video/mp4">
            </video>
            <ul>
                <li><a href="index.html">Return to Home Page</a></li>
            </ul>
        </div>
        <div class="center">
            <h1>Forgot Password</h1>
            <div class="success-text"><?php echo $successMessage; ?></div>
            <div class="error-text"><?php echo $errorMessage; ?></div>
            <form action="" method="post">
                <div class="txt_field">
                    <input type="email" name="email" required>
                    <label>Email</label>
                </div>

                <div class="txt_field">
                    <input type="text" name="companyID" required>
                    <label>Company ID</label>
                </div>

                <div class="txt_field">
                    <input type="password" name="newPassword" required>
                    <label>New Password</label>
                </div>

                <input type="submit" name="reset" value="Reset Password">
                <div class="signup_link">
                    Remember your password? <a href="login.php">Login</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
