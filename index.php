<?php
// Start session
session_start();

// Unset session variables on page load to clear previous data
unset($_SESSION['SESS_MEMBER_ID']);
unset($_SESSION['SESS_FIRST_NAME']);
unset($_SESSION['SESS_LAST_NAME']);

// Initialize error messages as empty strings
$signInError = $signUpError = "";

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Connect to MySQL server
    $link = mysqli_connect('localhost', 'root', '', 'lpt');

    // Check connection
    if (!$link) {
        die('Failed to connect to server: ' . mysqli_connect_error());
    }

    // Function to sanitize values received from the form to prevent SQL injection
    function clean($link, $str) {
        $str = trim($str);
        return mysqli_real_escape_string($link, $str);
    }

    // Check if the "Sign Up" button was clicked
    if (isset($_POST['signup'])) {
        // Get values from the sign-up form
        $username = clean($link, $_POST['username']);
        $password = $_POST['password'];

        // Perform validation for sign-up
        if (empty($username) || empty($password)) {
            $signUpError = "Please fill in all fields."; // Set error message if fields are empty
        } else {
            // Check if the username already exists
            $qry = "SELECT * FROM user WHERE username='$username'";
            $result = mysqli_query($link, $qry);

            if (mysqli_num_rows($result) > 0) {
                $signUpError = "Username already exists. Please choose another one.";
            } else {
                // Hash the password before saving
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                // Insert the new user into the database
                $qry = "INSERT INTO user (username, password) VALUES ('$username', '$hashedPassword')";
                if (mysqli_query($link, $qry)) {
                    echo "Sign-up successful!";
                } else {
                    $signUpError = "Error during sign-up. Please try again.";
                }
            }
        }
    }

    // Check if the "Sign In" button was clicked
    if (isset($_POST['signin'])) {
        // Get values from the sign-in form
        $username = clean($link, $_POST['username']);
        $password = $_POST['password'];

        // Perform validation for sign-in
        if (empty($username) || empty($password)) {
            $signInError = "Please enter both username and password."; // Set error message if fields are empty
        } else {
            // Check if the username exists
            $qry = "SELECT * FROM user WHERE username='$username'";
            $result = mysqli_query($link, $qry);

            if (mysqli_num_rows($result) > 0) {
                $member = mysqli_fetch_assoc($result);

                // Verify the hashed password
                if (password_verify($password, $member['password'])) {
                    // Login successful
                    session_regenerate_id();
                    $_SESSION['SESS_MEMBER_ID'] = $member['id'];
                    $_SESSION['SESS_FIRST_NAME'] = $member['username'];
                    $_SESSION['SESS_LAST_NAME'] = $member['position'];
                    session_write_close();
                    header("location: main/index.php");
                    exit();
                } else {
                    $signInError = "Invalid username or password.";
                }
            } else {
                $signInError = "Invalid username or password.";
            }
        }
    }

    // Close the connection
    mysqli_close($link);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="icon" href="main/img/lasertrading.png" type="image/x-icon">
    <title>Laser Plus Trading System</title>
    <link rel="stylesheet" href="login.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <style>
        /* Style for password fields */
        .password-container {
            position: relative;
            margin-bottom: 15px;
            width: 100%;
        }

        .box {
            width: 100%;  /* Ensures both username and password boxes are the same width */
        }

        /* Style for the eye icon */
        .eye {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 18px;
            color: #aaa;
        }

        /* Style for the eye icon when the password is visible */
        .eye.active i {
            color: #333;
        }

        /* Ensures the input boxes are the same width */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<!-- Main container for the forms -->
<div class="container" id="container">

    <!-- Sign-Up Form Container -->
    <div class="form-container sign-up-container">
        <form action="index.php" method="POST">
        <h1>Sign in</h1>
        <div class="social-container">
            <a href="#" class="social">
                <i class="fa fa-cogs" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Settings"></i>
            </a>
            <a href="#" class="social">
                <i class="fa fa-box" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Manage Inventory"></i>
            </a>
            <a href="#" class="social">
                <i class="fa fa-th-list" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Categories"></i>
            </a>
            <a href="#" class="social">
                <i class="fa fa-search" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Search"></i>
            </a>
        </div>

        <span>Laser Plus Trading</span>
            <!-- Input fields for username -->
            <input type="text" name="username" placeholder="Username" />

            <!-- Password Field with Eye Icon -->
            <div class="password-container">
                <input type="password" name="password" id="password" placeholder="Password" class="box"/>
                <span class="eye" onclick="togglePassword('password')"><i class="fas fa-eye"></i></span>
            </div>

            <button type="submit" name="signin">Login</button>
            <p style="color:red;"><?php echo $signInError; ?></p> <!-- Display error message if any -->
        </form>
    </div>

    <!-- Sign-In Form Container -->
    <div class="form-container sign-in-container">
        <form action="index.php" method="POST">
            <h1>Sign in</h1>
            <div class="social-container">
                <a href="#" class="social">
                    <i class="fa fa-cogs" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Settings"></i>
                </a>
                <a href="#" class="social">
                    <i class="fa fa-box" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Manage Inventory"></i>
                </a>
                <a href="#" class="social">
                    <i class="fa fa-th-list" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Categories"></i>
                </a>
                <a href="#" class="social">
                    <i class="fa fa-search" style="font-size: 2rem; color: #333333; margin-right: 10px;" title="Search"></i>
                </a>
            </div>

            <span>Laser Plus Trading</span>
            <!-- Input fields for username -->
            <input type="text" name="username" placeholder="Username" />

            <!-- Password Field with Eye Icon -->
            <div class="password-container">
                <input type="password" name="password" id="password2" placeholder="Password" class="box"/>
                <span class="eye" onclick="togglePassword('password2')"><i class="fas fa-eye"></i></span>
            </div>

            <button type="submit" name="signin">Login</button>
            <p style="color:red;"><?php echo $signInError; ?></p> <!-- Display error message if any -->
        </form>
    </div>

    <!-- Overlay container for styling and toggling between sign-in and sign-up -->
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Login</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signUp">Login</button>
            </div>
        </div>
    </div>
</div>

<!-- Add JavaScript to handle toggling between sign-in and sign-up forms -->
<script>
    // Toggle password visibility function
    function togglePassword(id) {
        const passwordField = document.getElementById(id);
        const eyeIcon = passwordField.nextElementSibling;

        if (passwordField.type === "password") {
            passwordField.type = "text";
            eyeIcon.innerHTML = "<i class='fas fa-eye-slash'></i>";
        } else {
            passwordField.type = "password";
            eyeIcon.innerHTML = "<i class='fas fa-eye'></i>";
        }
    }

    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>

</body>
</html>
