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
$sql = "UPDATE `User_Accounts` SET  `User_ID` =  '{$_POST['User_ID']}' ,  `User_Name` =  '{$_POST['User_Name']}' ,  `Password` =  '{$_POST['Password']}' ,  `Login` =  '{$_POST['Login']}' ,  `F_Name` =  '{$_POST['F_Name']}' ,  `L_Name` =  '{$_POST['L_Name']}' ,  `E-Mail` =  '{$_POST['E-Mail']}' ,  `Address1` =  '{$_POST['Address1']}' ,  `Address2` =  '{$_POST['Address2']}' ,  `City` =  '{$_POST['City']}' ,  `State` =  '{$_POST['State']}' ,  `Zip` =  '{$_POST['Zip']}' ,  `Phone` =  '{$_POST['Phone']}'   WHERE `ID` = '$id' "; 

	

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
$result = $db_handle->runQuery("SELECT * FROM User_Accounts WHERE ID='" . $_GET["id"] . "'");
$columns = mysqli_query($db_handle->connectDB(), "SHOW COLUMNS FROM User_Accounts");
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
		else if($row['Field'] == "Visit_Date")
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label></td>";
			echo "<td><input id=\"ff-{$row['Field']}\" name=\"txtBox[]\" type=\"date\" class=\"demoInputBox\" /></td></tr>";			
		}

		else if($row['Field'] == "Address1" || $row['Field'] == "Address2")
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