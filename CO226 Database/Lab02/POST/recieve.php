<?php

if(isset($_POST['fname'])){
	$fname=$_POST['fname'];
}
if(isset($_POST['lname'])){
	$lname=$_POST['lname'];
}
if(isset($_POST['size'])){
	$size=$_POST['size'];
}
if(isset($_POST['col'])){
	$col=$_POST['col'];
}
if(isset($_POST['WristBand'])){
	$band=$_POST['WristBand'];
}
if(isset($_POST['Cap'])){
	$cap=$_POST['Cap'];
}
if(isset($_POST['address1'])){
	$address1=$_POST['address1'];
}
if(isset($_POST['address2'])){
	$address2=$_POST['address2'];
}
if(isset($_POST['address3'])){
	$address3=$_POST['address3'];
}
if(isset($_POST['comment'])){
	$comment=$_POST['comment'];
} ?>
<!DOCTYPE html>
<html>
<head><h1>Your Information System</h1></head>
<body>
Thank you, <?php echo "{$fname}"; ?> for your purchase from our web site<br>
<br>
Your item colour is: <?php echo "{$col} & T-shirt size: {$size}<br>"; ?>
<br>
Selected items/item are:<br>
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
echo "<br><i>{$fname} {$lname}<br>";
echo "{$address1}<br>";
echo "{$address2}<br>";
echo "{$address3}</i><br>";

?>
Thank You for submitting your comments.We Appreciate it.You said:<br>
<?php echo "{$comment}<br>"; ?>
</body>


</html>

