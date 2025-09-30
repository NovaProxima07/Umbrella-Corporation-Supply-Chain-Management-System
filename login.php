<?php

include 'database.php';

$errorMessage = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $companyID = $_POST['companyID'];

    // Validate user credentials
    $query = "SELECT * FROM registration WHERE Username = '$username' AND Password = '$password' AND Company = '$companyID'";
    $result = mysqli_query($connection, $query);

    if (mysqli_num_rows($result) > 0) {
        // User login successful
        $row = mysqli_fetch_assoc($result);
        $userID = $row['ID'];
        
        // Start the session
        session_start();
        
        // Store the user ID in the session variable
        $_SESSION['user_id'] = $userID;
        
        header("Location: index.php");
        exit();
    } else {
        // Invalid credentials
        $errorMessage = "Invalid Credentials! Please try again.";
    }
}
?>


<!DOCTYPE html>
<style>
     .error-text {
      display: <?php echo $errorMessage ? 'block' : 'none'; ?>;
      text-align: center;
      padding: 20px;
      background-color: #ff000050;
      color: #fff;
    }

    .error-text a {
      color: #fff;
    }
    </style>
<html>
    <head>
        <title>Website Login</title>
        <link rel="stylesheet" href="style-login.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <a href="index.html"><img src ="elements/umbrella.png"></a>
                <video autoplay loop muted plays-inline class="back-video">
                    <source src="elements/login1.mp4" type="video/mp4">
                </video>
                <ul>
                    <li><a href="index.html">Return to Home Page</a></li>
                </ul>
            </div> 

            <div class="center">
                <h1>Login</h1>
                <div class="error-text"><?php echo $errorMessage; ?></div>
                <form action="" method="post">
                    <div class="txt_field">
                        <input type="text" name="username" required>
                        <label>Username</label>
                    </div>

                    <div class="txt_field">
                        <input type="password" name="password" required>
                        <label>Password</label>
                    </div>

                    <div class="txt_field">
                        <input type="text" name="companyID" required>
                        <label>Company ID</label>
                    </div>

                    <input type="submit" value="Submit">
                    <div class="signup_link">
                        Not a Member? <a href="registration.php">Sign Up</a>
                    </div>
                    <div class="signup_link">
                        Forget password? <a href="forget_password.php">Click Here</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
