<?php

if(isset($_GET['fname'])){
	$fname=$_GET['fname'];
}
if(isset($_GET['lname'])){
	$lname=$_GET['lname'];
}
if(isset($_GET['size'])){
	$size=$_GET['size'];
}
if(isset($_GET['col'])){
	$col=$_GET['col'];
}
if(isset($_GET['WristBand'])){
	$band=$_GET['WristBand'];
}
if(isset($_GET['Cap'])){
	$cap=$_GET['Cap'];
}
if(isset($_GET['address1'])){
	$address1=$_GET['address1'];
}
if(isset($_GET['address2'])){
	$address2=$_GET['address2'];
}
if(isset($_GET['address3'])){
	$address3=$_GET['address3'];
}
if(isset($_GET['comment'])){
	$comment=$_GET['comment'];
} ?>
<!DOCTYPE html>
<html>
<head><h1>Your Information System</h1></head>
<body>
Thank you, <?php echo "{$fname}"; ?> for your purchase from our web site<br>
<br>
Your item colour is: <?php echo "{$col} & T-shirt size: {$size}<br>"; ?>
<br>
Selected items/item are:<br><br>
<?php 
if(isset($cap)){
	echo"*{$cap}<br>";
}
if(isset($band)){
	echo"*{$band}<br>";
}
?>
<br>
Your items will be sent to:
<?php
echo "<br><br><i>{$fname} {$lname}<br>";
echo "{$address1}<br>";
echo "{$address2}<br>";
echo "{$address3}<br></i>";

?>
Thank You for submitting your comments.We Appreciate it.You said:<br>
<br>
<?php echo "<i>{$comment}</i><br>"; ?>
</body>


</html>

