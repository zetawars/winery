<?php
session_start();
if(!isset($_SESSION['username'])){
	header("location:../index.php");
}

require_once("../dbcontroller.php");
$db_handle = new DBController();
$id = (int) $_GET['id']; 
if(!empty($_POST["submit"])) {
	
foreach($_POST AS $key => $value) { $_POST[$key] = mysql_real_escape_string($value); } 
$sql = "UPDATE `Event` SET  `Name` =  '{$_POST['Name']}' ,  `E_Day` =  '{$_POST['E_Day']}' ,  `E_Date` =  '{$_POST['E_Date']}' ,  `E_Time` =  '{$_POST['E_Time']}' ,  `Description` =  '{$_POST['Description']}' ,  `Address` =  '{$_POST['Address']}' ,  `Address_2` =  '{$_POST['Address_2']}' ,  `City` =  '{$_POST['City']}' ,  `State` =  '{$_POST['State']}' ,  `Zip` =  '{$_POST['Zip']}' ,  `Phone` =  '{$_POST['Phone']}' ,  `Cost` =  '{$_POST['Cost']}' ,  `Location` =  '{$_POST['Location']}' ,  `Website` =  '{$_POST['Website']}' ,  `Rating` =  '{$_POST['Rating']}' ,  `Special_Note` =  '{$_POST['Special_Note']}'   WHERE `ID` = '$id' "; 
	

//echo $sql;

	$result = mysqli_query($db_handle->connectDB(), $sql) or die(mysqli_error()); 
	echo "Record Updated Successfully!<br />"; 
	echo "<a href='list.php'>Back To Listing</a>"; 


	if(!$result){
		$message = "Problem in Editing! Please Retry!";
	} else {
		//header("Location:index.php");
	}
}
?>
<link href="../style.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>

<form name="frmToy" method="post" action="" id="frmToy" ">
<div id="mail-status"></div>
<table>
<?php
$result = $db_handle->runQuery("SELECT * FROM Event WHERE ID='" . $_GET["id"] . "'");
$columns = mysqli_query($db_handle->connectDB(), "SHOW COLUMNS FROM Event");
if (!$columns) {
    echo 'Could not run query: ' . mysql_error();
    exit;
}
if (mysqli_num_rows($columns) > 0) {
    while ($row = mysqli_fetch_assoc($columns)) {
		if($row['Field'] == 'ID')
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" ><strong>{$row['Field']} :   </strong></label></td>";
			echo "<td><label for=\"ff-{$row['Field']}\" ><strong>{$result[0]['ID']}</strong></label></div></td></tr>";
		}
		else if($row['Field'] == "Special_Note" || $row['Field'] == "Location")
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label></td>";
			echo "<td><textarea rows=\"4\" cols=\"50\" id=\"ff-{$row['Field']}\" name=\"{$row['Field']}\" class=\"demoInputBox\" >{$result[0][$row['Field']]}</textarea></td></tr>";			
		}
		else{
				echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']} :  </label></td>";
				echo "<td><input id=\"ff-{$row['Field']}\" type=\"text\" name=\"{$row['Field']}\" class=\"demoInputBox\" value=\"{$result[0][$row['Field']]}\" /></td></tr>";		
				}

   }
}
?>
</table>
<div>
<input type="submit" name="submit" id="btnAddAction" value="Save" />
</div>
</div>