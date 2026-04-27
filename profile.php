<?php
include 'dbconnect.php';
session_start();

$user_id = $_SESSION['user_id'];
if (!isset($user_id)) {
    header('location:login.php');
}
if (isset($_POST['logout'])) {
    session_destroy();
    header('location:login.php');
}

// Update profile info (name, email, password)
if (isset($_POST['update_profile'])) {
    $new_name = mysqli_real_escape_string($conn, $_POST['name']);
    $new_email = mysqli_real_escape_string($conn, $_POST['email']);
    $new_password = mysqli_real_escape_string($conn, $_POST['password']);
    
    mysqli_query($conn, "UPDATE `users` SET name='$new_name', email='$new_email', password='$new_password' WHERE id='$user_id'") or die('query failed');
    $_SESSION['user_name'] = $new_name;
    $_SESSION['user_email'] = $new_email;
    $message[] = 'Profile updated successfully!';
}

// Fetch user info
$select_user = mysqli_query($conn, "SELECT * FROM `users` WHERE id='$user_id'") or die('query failed');
$user = mysqli_fetch_assoc($select_user);

// Fetch order history
$orders = mysqli_query($conn, "SELECT * FROM `orders` WHERE user_id='$user_id' ORDER BY placed_on DESC") or die('query failed');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <title>My Profile</title>
</head>
<body>
<?php include 'header.php'; ?>

<div class="banner">
    <h1>My Profile</h1>
    <p>Manage your account and view your orders.</p>
</div>

<div class="profile">
    <?php 
    if (isset($message)) {
        foreach ($message as $msg) {
            echo '<div class="message"><span>'.$msg.'</span><i class="bi bi-x-circle" onclick="this.parentElement.remove()"></i></div>';
        }
    }
    ?>
    <div class="row">
        <div class="detail">
            <h2>Update Information</h2>
            <form method="post">
                <label>Name:</label>
                <input type="text" name="name" value="<?php echo $user['name']; ?>" class="input">
                <label>Email:</label>
                <input type="email" name="email" value="<?php echo $user['email']; ?>" class="input">
                <label>Password:</label>
                <input type="text" name="password" value="<?php echo $user['password']; ?>" class="input">
                <button type="submit" name="update_profile" class="btn2">Update</button>
            </form>
        </div>
        <div class="orders">
            <h2>Order History</h2>
            <?php if(mysqli_num_rows($orders) > 0){ ?>
                <table class="order-table">
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Status</th>
                    </tr>
                    <?php while($order = mysqli_fetch_assoc($orders)){ ?>
                        <tr>
                            <td><?php echo $order['id']; ?></td>
                            <td><?php echo $order['placed_on']; ?></td>
                            <td>$<?php echo $order['total_price']; ?>/-</td>
                            <td><?php echo $order['payment_status']; ?></td>
                        </tr>
                    <?php } ?>
                </table>
            <?php } else { ?>
                <p>No orders yet.</p>
            <?php } ?>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>
<script type="text/javascript" src="script.js"></script>
</body>
</html>
