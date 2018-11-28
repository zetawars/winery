<?php
session_start();
if(!isset($_SESSION['username'])){
	header("location:../index.php");
}

require_once("../dbcontroller.php");
$db_handle = new DBController();
if(!empty($_GET["id"])) {
	$result = mysqli_query($db_handle->connectDB(), "DELETE FROM Wines WHERE ID=".$_GET["id"]) or die(mysqli_error());
	if($result)
	{
		echo "<strong>1 record Deleted Successfully!</strong><br />";
		echo "<a href='list.php'>Back to List</a>'";
	}
//	if(!empty($result)){
//		header("Location:index.php");
//	}
}
?>