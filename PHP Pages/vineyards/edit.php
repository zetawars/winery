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
$sql = "UPDATE `Vineyards` SET  `Winery_Name` =  '{$_POST['Winery_Name']}' ,  `Winery_Logo` =  '{$_POST['Winery_Logo']}' ,  `Winery_Image` =  '{$_POST['Winery_Image']}' ,  `Location` =  '{$_POST['Location']}' ,  `Winery_Notes` =  '{$_POST['Winery_Notes']}' ,  `Winery_Phone` =  '{$_POST['Winery_Phone']}' ,  `Website` =  '{$_POST['Website']}' ,  `E_Mail` =  '{$_POST['E_Mail']}' ,  `Key_Amenities` =  '{$_POST['Key_Amenities']}' ,  `Restaurant` =  '{$_POST['Restaurant']}' ,  `Hours` =  '{$_POST['Hours']}' ,  `Established` =  '{$_POST['Established']}' ,  `Tastings` =  '{$_POST['Tastings']}' ,  `Wine_Types` =  '{$_POST['Wine_Types']}' ,  `Trail` =  '{$_POST['Trail']}' ,  `Favorite` =  '{$_POST['Favorite']}' ,  `Wine_Shop_URL` =  '{$_POST['Wine_Shop_URL']}' ,  `Wine_Shop_Yes` =  '{$_POST['Wine_Shop_Yes']}' ,  `Food_Yes` =  '{$_POST['Food_Yes']}' ,  `Music_Yes` =  '{$_POST['Music_Yes']}' ,  `Patio_Yes` =  '{$_POST['Patio_Yes']}' ,  `Lodging_Yes` =  '{$_POST['Lodging_Yes']}'   WHERE `ID` = '$id' "; 
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
$result = $db_handle->runQuery("SELECT * FROM Vineyards WHERE ID='" . $_GET["id"] . "'");
$columns = mysqli_query($db_handle->connectDB(), "SHOW COLUMNS FROM Vineyards");
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
		else if($row['Field'] == "Winery_Notes" || $row['Field'] == "Location")
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