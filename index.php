
<?php 
	include 'dbconnect.php';
	session_start();
	
	$user_id = $_SESSION['user_id'];
	if (!isset($user_id)) {
	    header('location:login.php');
	}
	/*----------------logout-------------------------*/
	if (isset($_POST['logout'])) {
	    session_destroy();
	    header('location:login.php');
	}
	/*----------------adding products to cart-------------------------*/
	if (isset($_POST['add_to_cart'])) {
	    $product_id = $_POST['product_id'];
	    $product_name = $_POST['product_name'];
	    $product_price = $_POST['product_price'];
	    $product_image = $_POST['product_image'];
	    $product_quantity = $_POST['product_quantity'];
	    
	    $cart_number = mysqli_query($conn, "SELECT * FROM `cart` WHERE name = '$product_name' AND user_id='$user_id'") or die('query failed');
	    if(mysqli_num_rows($cart_number)>0){
	        $message[] ='product already exist in cart';
	    }else{
	        mysqli_query($conn, "INSERT INTO `cart`(`user_id`,`pid`,`name`,`price`,`quantity`,`image`) VALUES('$user_id','$product_id','$product_name','$product_price','$product_quantity','$product_image')");
	        $message[]='product successfuly added in cart';
	    }
	}
	
	?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
	<link rel="stylesheet" type= "text/css" href="main.css">
	<title>Mittal Clothing Store</title>
</head>
<body>
	<?php include 'header.php'; ?>
	
	<div class="intro">
  <div class="detail">
    <span>Best Quality</span>
    <h1>Formals & Traditionals</h1>
    <a href="shop.php">shop now</a>
  </div>
</div>

	<div class="categories">
		<h1 class="title">TOP CATEGORIES</h1>
		<div class="box-container">
			<div class="box" data-category="Formals" onclick="location.href='category.php?category=' + this.dataset.category"><img src="img/categories-1.jpg"><span>Formals</span></div>
			<div class="box" data-category="Traditionals" onclick="location.href='category.php?category=' + this.dataset.category"><img src="img/categories-2.jpg"><span>Traditionals</span></div>
			<div class="box" data-category="Jeans" onclick="location.href='category.php?category=' + this.dataset.category"><img src="img/categories-3.jpg"><span>Jeans</span></div>
			<div class="box" data-category="Casual Shirts" onclick="location.href='category.php?category=' + this.dataset.category"><img src="img/categories-4.jpg"><span>Casual Shirts</span></div>
			<div class="box" data-category="Winter Wear" onclick="location.href='category.php?category=' + this.dataset.category"><img src="img/categories-5.jpg"><span>Winter Wear</span></div>	
		</div>
	</div>
	<div class="banner3">
		<div class="detail">
			<span>STYLE THAT SPEAKS</span>
			<h1>DISCOVER FASHION THAT FITS YOUR LIFE</h1>
			<p>Make a bold entrance with curated collections for every mood, moment, and milestone.</p>
			<a href="shop.php">explore <i class="bi bi-arrow-right"></i></a>
		</div>
	</div>
<div class="shop">
    <h1 class="title">shop best sellers</h1>
    <div class="box-container">
        <?php 
            $select_products = mysqli_query($conn, "SELECT * FROM `products` ORDER BY RAND() LIMIT 8") or die('query failed');
            if(mysqli_num_rows($select_products) > 0){
                while($fetch_products = mysqli_fetch_assoc($select_products)){
        ?>
        <form action="" method="post" class="box">
            <img src="image/<?php echo $fetch_products['image']; ?>">
            <div class="price">$<?php echo $fetch_products['price']; ?>/-</div>
            <div class="name"><?php echo $fetch_products['name']; ?></div>
            <input type="hidden" name="product_id" value="<?php echo $fetch_products['id']; ?>">
            <input type="hidden" name="product_name" value="<?php echo $fetch_products['name']; ?>">
            <input type="hidden" name="product_price" value="<?php echo $fetch_products['price']; ?>">
            <input type="hidden" name="product_quantity" value="1">
            <input type="hidden" name="product_image" value="<?php echo $fetch_products['image']; ?>">
            <div class="icon">
                <a href="view_page.php?pid=<?php echo $fetch_products['id']; ?>" class="bi bi-eye-fill"></a>
                <button type="submit" name="add_to_cart" class="bi bi-cart"></button>
            </div>
        </form>
        <?php 
                }
            } else {
                echo '<p class="empty">no products added yet!</p>';
            }
        ?>
    
</div>
	<div class="more">
		<a href="shop.php">load more</a>
		<i class="bi bi-arrow-down"></i>
	</div>
	</div>
	<?php include 'footer.php'; ?>
	<script type="text/javascript" src="script.js"></script>
</body>
</html>