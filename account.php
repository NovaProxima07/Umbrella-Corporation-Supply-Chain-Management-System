<?php
include 'database.php';
ob_start();

include('inc/header.php');
include 'Inventory.php';
$inventory = new Inventory();

// Assuming you have already established a database connection

// Start the session (make sure this is included before any output in your PHP file)
session_start();

// Retrieve the logged-in user's ID from the session
$userID = $_SESSION['user_id'];

// Query the database to fetch the user's information based on the ID
$query = "SELECT * FROM registration WHERE ID = '$userID'";
$result = mysqli_query($connection, $query);

// Fetch the user's information from the query result
if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $fullname = $row['Fullname'];
    $position = isset($row['Position']) ? $row['Position'] : '';
    $email = isset($row['Email']) ? $row['Email'] : '';
    $address = isset($row['Address']) ? $row['Address'] : '';
    $phone = isset($row['Phone']) ? $row['Phone'] : '';
    $company = isset($row['Company']) ? $row['Company'] : '';
    $username = isset($row['Username']) ? $row['Username'] : '';
    $password = isset($row['Password']) ? $row['Password'] : '';
} else {
    // Handle the case when the query fails or user is not found
    $fullname = 'Default Name';
    $position = '';
    $email = '';
    $address = '';
    $phone = '';
    $company = '';
    $username = '';
    $password = '';
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['fullname']) && isset($_POST['position']) && isset($_POST['email']) && isset($_POST['address']) && isset($_POST['phone']) && isset($_POST['company']) && isset($_POST['username']) && isset($_POST['password'])) {
        $fullname = $_POST['fullname'];
        $position = $_POST['position'];
        $email = $_POST['email'];
        $address = $_POST['address'];
        $phone = $_POST['phone'];
        $company = $_POST['company'];
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Update the user details in the database
        $sql = "UPDATE registration SET Fullname='$fullname', Position='$position', Email='$email', Address='$address', Phone='$phone', Company='$company', Username='$username', Password='$password' WHERE ID='$userID'";
        mysqli_query($connection, $sql);

        // Redirect to the account page or display a success message
        header("Location: account.php");
        exit();
    }
}

// Close the database connection
mysqli_close($connection);
?>

<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>		
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<script src="js/common.js"></script>

<?php include('inc/container.php');?>
<div class="container">		
    <?php include("menus.php"); ?> 
    <div class="row">
        <div class="col-lg-12">
            <div class="card card-default rounded-0 shadow">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-10 col-md-10 col-sm-8 col-xs-6">
                            <h3 class="card-title">Account Details</h3>
                        </div>
                    </div>					   
                    <div class="clear:both"></div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-sm-12 table-responsive">
                                <table id="registration" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>										
                                            <th>Fullname</th>
                                            <th>Position</th>
                                            <th>Email Address</th>
                                            <th>Physical Address</th>
                                            <th>Phone Number</th>
                                            <th>Company ID</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        if ($result && mysqli_num_rows($result) > 0) {
                                            echo '<tr>';
                                            echo '<td>' . $userID . '</td>';
                                            echo '<td>' . $fullname . '</td>';
                                            echo '<td>' . $position . '</td>';
                                            echo '<td>' . $email . '</td>';
                                            echo '<td>' . $address . '</td>';
                                            echo '<td>' . $phone . '</td>';
                                            echo '<td>' . $company . '</td>';
                                            echo '<td>' . $username . '</td>';
                                            echo '<td>' . $password . '</td>';
                                            echo '<td><a href="#" class="edit-link">Edit</a></td>';
                                            echo '</tr>';
                                        } else {
                                            echo '<tr>';
                                            echo '<td colspan="10">No user found</td>';
                                            echo '</tr>';
                                        }
                                        ?>
                                    </tbody>
                                </table>
                                <div class="edit-form" style="display: none;">
                                    <h2>Edit Account Details</h2>
                                    <?php if (isset($error)) { ?>
                                        <div class="alert alert-danger"><?php echo $error; ?></div>
                                    <?php } ?>
                                    <form method="POST" action="account.php" class="needs-validation" novalidate>
                                        <div class="mb-3">
                                            <label for="fullname" class="form-label">Full Name</label>
                                            <input type="text" class="form-control" id="fullname" name="fullname" value="<?php echo $fullname; ?>" required>
                                            <div class="invalid-feedback">Please enter your full name.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="position" class="form-label">Position</label>
                                            <input type="text" class="form-control" id="position" name="position" value="<?php echo $position; ?>" required>
                                            <div class="invalid-feedback">Please enter your position.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email Address</label>
                                            <input type="email" class="form-control" id="email" name="email" value="<?php echo $email; ?>" required>
                                            <div class="invalid-feedback">Please enter a valid email address.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="form-label">Physical Address</label>
                                            <input type="text" class="form-control" id="address" name="address" value="<?php echo $address; ?>" required>
                                            <div class="invalid-feedback">Please enter your physical address.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">Phone Number</label>
                                            <input type="text" class="form-control" id="phone" name="phone" value="<?php echo $phone; ?>" required>
                                            <div class="invalid-feedback">Please enter your phone number.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="company" class="form-label">Company ID</label>
                                            <input type="text" class="form-control" id="company" name="company" value="<?php echo $company; ?>" required>
                                            <div class="invalid-feedback">Please enter your company ID.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="username" class="form-label">Username</label>
                                            <input type="text" class="form-control" id="username" name="username" value="<?php echo $username; ?>" required>
                                            <div class="invalid-feedback">Please enter your username.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">Password</label>
                                            <input type="text" class="form-control" id="password" name="password" value="<?php echo $password; ?>" required>
                                            <div class="invalid-feedback">Please enter your password.</div>
                                        </div>
                                        <div class="mb-3">
                                            <input type="hidden" name="id" value="<?php echo $userID; ?>">
                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include('inc/footer.php'); ?>

<script>
    $(document).ready(function() {
        $('.edit-link').click(function(e) {
            e.preventDefault();
            $('.edit-form').toggle();
        });
    });
</script>
