<?php
session_start();

// Check if user is not logged in
if(!isset($_SESSION['username'])) {
    // Redirect to login page
    header("Location: login.php");
    exit; // Stop further execution
}
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Management - Onyx</title>
    <link rel="stylesheet" href="https://cloned.pizza/assets/css/onyx.css">
</head>
<body>
    <h1>Account Management - Onyx</h1>
    <p>Placeholder</p>
</body>
</html>