<?php
include 'database.php';

$successMessage = "";
$errorMessage = "";

if (isset($_POST['reg'])) {

    $fullname = $_POST['fullname'];
    $position = $_POST['position'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $phoneNumber = $_POST['phoneNumber'];
    $companyID = $_POST['companyID'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if the company ID already exists
    $checkCompanyIDQuery = "SELECT * FROM registration WHERE Company = '$companyID'";
    $checkCompanyIDResult = mysqli_query($connection, $checkCompanyIDQuery);

    if (mysqli_num_rows($checkCompanyIDResult) > 0) {
        $errorMessage = "Company ID already exists!";
        $_POST['companyID'] = "";
    } else {
        $register = "INSERT INTO registration (Fullname, Position, Email, Address, Phone, Company, Username, Password) VALUES ('$fullname', '$position', '$email', '$address', '$phoneNumber', '$companyID', '$username', '$password')";

        if(mysqli_query($connection, $register)) {
            $successMessage = "Registration successful!";
            $_POST['fullname'] = "";
            $_POST['position'] = "";
            $_POST['email'] = "";
            $_POST['address'] = "";
            $_POST['phoneNumber'] = "";
            $_POST['companyID'] = "";
            $_POST['username'] = "";
            $_POST['password'] = "";
        }
    }
}

?>

<!DOCTYPE html>
<html>
<head>
  <title>Website Login</title>
  <link rel="stylesheet" href="style-login.css">
  <link rel="stylesheet" href="style.css">
  <style>
    /* Add the modified CSS code here */
    .center {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 600px; /* Adjust the width as per your preference */
      background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75));
    }

    .center h1 {
      color: #fff;
      text-align: center;
      padding: 20px 0;
      border-bottom: 1px solid silver;
    }

    .center form {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      padding: 0 40px;
      box-sizing: border-box;
    }

    .txt_field {
      width: calc(50% - 20px); /* Adjust the width as per your preference */
      margin-bottom: 30px;
    }

    .txt_field input {
      width: 100%;
    }

    .txt_field label {
      font-size: 16px;
    }

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
      <h1>Register Account</h1>
      <div class="success-text"><?php echo $successMessage; ?></div>
      <div class="error-text"><?php echo $errorMessage; ?></div>
      <form action="registration.php" method="post" id="register-form">
        <div class="txt_field">
          <input type="text" name="fullname" required value="<?php echo $_POST['fullname'] ?? ''; ?>">
          <span></span>
          <label>Full Name</label>
        </div>

        <div class="txt_field">
          <input type="text" name="position" required value="<?php echo $_POST['position'] ?? ''; ?>">
          <span></span>
          <label>Position</label>
        </div>

        <div class="txt_field">
          <input type="email" name="email" required value="<?php echo $_POST['email'] ?? ''; ?>">
          <span></span>
          <label>Email Address</label>
        </div>

        <div class="txt_field">
          <input type="text" name="address" required value="<?php echo $_POST['address'] ?? ''; ?>">
          <span></span>
          <label>Physical Address</label>
        </div>

        <div class="txt_field">
          <input type="text" name="phoneNumber" required value="<?php echo $_POST['phoneNumber'] ?? ''; ?>">
          <span></span>
          <label>Phone Number</label>
        </div>

        <div class="txt_field">
          <input type="text" name="companyID" required value="<?php echo $_POST['companyID'] ?? ''; ?>">
          <span></span>
          <label>Company ID</label>
        </div>

        <div class="txt_field">
          <input type="text" name="username" required value="<?php echo $_POST['username'] ?? ''; ?>">
          <span></span>
          <label>Your Desired Username</label>
        </div>

        <div class="txt_field">
          <input type="text" name="password" required>
          <span></span>
          <label>Your Desired Password</label>
        </div>

        <input type="submit" name="reg" value="Register" class="center-btn">
      </form>
    
      <div class="signup_link">
        Existing Member? <a href="login.php">Login</a>
      </div>
    </div>
  </div>
</body>
</html>
