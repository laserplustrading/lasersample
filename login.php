<?php
// Start session
session_start();

// Array to store validation errors
$errmsg_arr = array();

// Validation error flag
$errflag = false;

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

// Sanitize the POST values
$login = clean($link, $_POST['username']);
$password = $_POST['password']; // Don't hash this yet, as it needs verification

// Input Validations
if ($login == '') {
    $errmsg_arr[] = 'Username missing';
    $errflag = true;
}
if ($password == '') {
    $errmsg_arr[] = 'Password missing';
    $errflag = true;
}

// If there are input validations, redirect back to the login form
if ($errflag) {
    $_SESSION['ERRMSG_ARR'] = $errmsg_arr;
    session_write_close();
    header("location: index.php");
    exit();
}

// Create query to fetch user by username
$qry = "SELECT * FROM user WHERE username='$login'";
$result = mysqli_query($link, $qry);

// Check whether the query was successful
if ($result) {
    if (mysqli_num_rows($result) > 0) {
        $member = mysqli_fetch_assoc($result);

        // Verify the hashed password
        if (password_verify($password, $member['password'])) {
            // Login Successful
            session_regenerate_id();
            $_SESSION['SESS_MEMBER_ID'] = $member['id'];
            $_SESSION['SESS_FIRST_NAME'] = $member['username'];
            $_SESSION['SESS_LAST_NAME'] = $member['position'];
            session_write_close();
            header("location: main/index.php");
            exit();
        } else {
            // Invalid password
            $_SESSION['ERRMSG_ARR'] = ['Invalid username or password'];
            session_write_close();
            header("location: index.php");
            exit();
        }
    } else {
        // Invalid username
        $_SESSION['ERRMSG_ARR'] = ['Invalid username or password'];
        session_write_close();
        header("location: index.php");
        exit();
    }
} else {
    die("Query failed: " . mysqli_error($link));
}

// Close the connection
mysqli_close($link);
?>
