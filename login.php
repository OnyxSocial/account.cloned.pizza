<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In - Onyx</title>
    <link rel="stylesheet" href="https://cloned.pizza/assets/css/onyx.css">
</head>
<body>
    <h1>Log into your Onyx account</h1>
    <p>Username</p>
    <form action="login.php" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>
    <?php
session_start();
$servername = "localhost";
$username = "root";
$password = "your_password";
$dbname = "onyx";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function sanitize_input($data) {
    return htmlspecialchars(stripslashes(trim($data)));
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = sanitize_input($_POST['email']);
    $password = sanitize_input($_POST['password']);
    
    $passwordHash = hash('sha256', $password);
    
    $stmt = $conn->prepare("SELECT UserID, Username FROM Users WHERE Email = ? AND PasswordHash = ?");
    $stmt->bind_param("ss", $email, $passwordHash);
    
    $stmt->execute();
    
    $stmt->store_result();
    
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($userID, $username);
        $stmt->fetch();
        
        $_SESSION['UserID'] = $userID;
        $_SESSION['Username'] = $username;
        
        header("Location: index.php");
        exit();
    } else {
        echo "Invalid email or password.";
    }
    
    $stmt->close();
}

$conn->close();
?>

    <p>No account? Create one <a href="signup.php"><p>here</p></a></p>
</body>
</html>
