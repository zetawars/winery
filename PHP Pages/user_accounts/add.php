<?php
session_start();
if(!isset($_SESSION['username'])){
	header("location: ../index.php");
}

require_once("../dbcontroller.php");
$db_handle = new DBController();
if(!empty($_POST["submit"])) {
	
//	echo $_POST["txtBox"][0];
//	echo $_POST["txtBox"][1];

    $subject = implode("','", $_POST["txtBox"]);
    //echo $subject;
	
	$myQuery = "INSERT INTO User_Accounts VALUES ('NULL','$subject')";
	//echo $myQuery;
	$result = mysqli_query($db_handle->connectDB(), $myQuery) or die(mysqli_error($db_handle->connectDB())); 
	
	
	if(!$result){
			$message="Problem in Adding to database. Please Retry.";
	} else {
		echo "Record Added.<br />"; 
		echo "<a href='list.php'>Back To Listing</a>"; 
		//header("Location:index.php");
	}
 	
}


?>
<link href="../style.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>



<form name="frmToy" method="post" action="" id="frmToy">
<div id="mail-status"></div>
<table>
<tr>
<?php  
$columns = mysqli_query($db_handle->connectDB(),"SHOW COLUMNS FROM User_Accounts");
if (!$columns) {
   	echo $columns;
    echo 'Could not run query: ' . mysqli_error();
    exit;
}
if (mysqli_num_rows($columns) > 0) {
    while ($row = mysqli_fetch_assoc($columns)) {
		if($row['Field'] == 'ID')
		{
			 continue;
		}
		else if($row['Field'] == "Address1" || $row['Field'] == "Address2")
		{
			echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
			echo "<textarea rows=\"4\" cols=\"50\" id=\"ff-{$row['Field']}\" name=\"txtBox[]\" class=\"demoInputBox\" ></textarea></div>";			
		}
		else if($row['Field'] == "Visit_Date")
		{
			echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
			echo "<input id=\"ff-{$row['Field']}\" name=\"txtBox[]\" type=\"date\" class=\"demoInputBox\" /></div>";			
		}
		else{
			echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
			echo "<input id=\"ff-{$row['Field']}\" type=\"text\" name=\"txtBox[]\" class=\"demoInputBox\" /></div>";
		}
    }
}
?>

<div>
<input type="submit" name="submit" id="btnAddAction" value="Add" />
</div>
</div>