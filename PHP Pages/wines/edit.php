<?php
session_start();
if(!isset($_SESSION['username'])){
	header("location:../index.php");
}

require_once("../dbcontroller.php");
$db_handle = new DBController();
$id = (int) $_GET['id']; 
if(!empty($_POST["submit"])) {
	
	
$update = "UPDATE `Wines` SET  `Winery_Number` =  '{$_POST['Winery_Number']}' ,  `Winery` =  '{$_POST['Winery']}' ,  `Name` =  '{$_POST['Name']}' ,  `Vintage` =  '{$_POST['Vintage']}' ,  `Price_Public` =  '{$_POST['Price_Public']}' ,  `Price_WC` =  '{$_POST['Price_WC']}' ,  `Price_Case_Pub` =  '{$_POST['Price_Case_Pub']}' ,  `Price_Case_WC` =  '{$_POST['Price_Case_WC']}' ,  `Price_Sale_Pub` =  '{$_POST['Price_Sale_Pub']}' ,  `Price_Sale_WC` =  '{$_POST['Price_Sale_WC']}' ,  `Flavor_Notes` =  '{$_POST['Flavor_Notes']}' ,  `Tasting_Notes` =  '{$_POST['Tasting_Notes']}' ,  `Type` =  '{$_POST['Type']}' ,  `Varietal` =  '{$_POST['Varietal']}' ,  `Active` =  '{$_POST['Active']}' ,  `Wine_Maker` =  '{$_POST['Wine_Maker']}' ,  `Region` =  '{$_POST['Region']}' ,  `Country` =  '{$_POST['Country']}' ,  `Website` =  '{$_POST['Website']}' ,  `Reviewer` =  '{$_POST['Reviewer']}' ,  `Rating` =  '{$_POST['Rating']}' ,  `Image_Location` =  '{$_POST['Image_Location']}' ,  `Tasting_Date` =  '{$_POST['Tasting_Date']}' ,  `Food_Pairing` =  '{$_POST['Food_Pairing']}' ,  `Composition` =  '{$_POST['Composition']}' ,  `Alcohol` =  '{$_POST['Alcohol']}' ,  `Aging` =  '{$_POST['Aging']}' ,  `Favorite` =  '{$_POST['Favorite']}'   WHERE `ID` = '$id' ";

	//echo $update;
	$result = mysqli_query($db_handle->connectDB(), $update) or die(mysqli_error()); 
	echo "Record Updated Successfully!<br />"; 
	echo "<a href='list.php'>Back To Listing</a>"; 

	//$result = mysql_query("UPDATE toy set name = '".$_POST["name"]."', code = '".$_POST["code"]."', category = '".$_POST["category"]."', price = '".$_POST["price"]."', stock_count = '".$_POST["stock_count"]."' WHERE  id=".$_GET["id"]);
	if(!$result){
		$message = "Problem in Editing! Please Retry!";
	} else {
		//header("Location:index.php");
	}
}
?>
<link href="../style.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>/*
function validate() {
	var valid = true;	
	$(".demoInputBox").css('background-color','');
	$(".info").html('');
	
	if(!$("#name").val()) {
		$("#name-info").html("(required)");
		$("#name").css('background-color','#FFFFDF');
		valid = false;
	}
	if(!$("#code").val()) {
		$("#code-info").html("(required)");
		$("#code").css('background-color','#FFFFDF');
		valid = false;
	}
	if(!$("#category").val()) {
		$("#category-info").html("(required)");
		$("#category").css('background-color','#FFFFDF');
		valid = false;
	}
	if(!$("#price").val()) {
		$("#price-info").html("(required)");
		$("#price").css('background-color','#FFFFDF');
		valid = false;
	}	
	if(!$("#stock_count").val()) {
		$("#stock_count-info").html("(required)");
		$("#stock_count").css('background-color','#FFFFDF');
		valid = false;
	}	
	return valid;
}
onClick="return validate(); //in form tag
*/
</script>
<form name="frmToy" method="post" action="" id="frmToy" ">
<div id="mail-status"></div>
<table>
<?php
$result = $db_handle->runQuery("SELECT * FROM Wines WHERE ID='" . $_GET["id"] . "'");
$columns = mysqli_query($db_handle->connectDB(), "SHOW COLUMNS FROM Wines");
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
		else if($row['Field'] == "Tasting_Notes")
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label></td>";
			echo "<td><textarea rows=\"4\" cols=\"50\" id=\"ff-{$row['Field']}\" name=\"{$row['Field']}\" class=\"demoInputBox\" >{$result[0][$row['Field']]}</textarea></td></tr>";			
		}
		else if($row['Field'] == "Type")
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label></td>";
			echo "<td><select name='{$row['Field']}'><option selected value=\"{$result[0][$row['Field']]}\">{$result[0][$row['Field']]}</option>";
			echo "<option value='White'>White</option>";
			echo "<option value='Red'>Red</option>";
			echo "<option value='Sparkling'>Sparkling</option>";
			echo "<option value='Dessert'>Dessert</option>";
			echo "<option value='Sweet'>Sweet</option> </select></td></tr>";

		}
		else if($row['Field'] == "Varietal")
		{
			$varietal = mysqli_query($db_handle->connectDB(), "SELECT * FROM Varietal");
			if (!$varietal) {
				echo 'Could not run query: ' . mysql_error();
				exit;
			}
			if (mysqli_num_rows($varietal) > 0) 
			{
				echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label></td>";				
				echo "<td><select name=\"{$row['Field']}\">";
				echo "<option selected value=\"{$result[0][$row['Field']]}\">{$result[0][$row['Field']]}</option>";
				
    			while ($list = mysqli_fetch_assoc($varietal)) 
				{
					echo "<option value=\"{$list['Varietal']}\">{$list['Varietal']}</option>";
				}
				echo "</select></td></tr>";
			}

		}
		else if($row['Field'] == "Active")
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label></td>";
			echo "<td><select name='{$row['Field']}'>";
			echo "<option selected value=\"{$result[0][$row['Field']]}\">{$result[0][$row['Field']]}</option>";
			echo "<option value='Y'>Yes</option>";
			echo "<option value='N'>No</option>";
			echo "</select></td></tr>";			
		}
		else if($row['Field'] == "Country")
		{
			$country = mysqli_query($db_handle->connectDB(), "SELECT * FROM Country");
			if (!$country) {
				echo 'Could not run query: ' . mysql_error();
				exit;
			}
			if (mysqli_num_rows($country) > 0) 
			{
				echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label></td>";				
				echo "<td><select name=\"{$row['Field']}\">";
				echo "<option selected value=\"{$result[0][$row['Field']]}\">{$result[0][$row['Field']]}</option>";
				
    			while ($countrylist = mysqli_fetch_assoc($country)) 
				{
					echo "<option value=\"{$countrylist['Country']}\">{$countrylist['Country']}</option>";
				}
				echo "</select></td></tr>";
			}

		}
		else{
				echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']} :  </label></td>";
//				echo "<td><label for=\"ff-{$row['Field']}\" ><strong>{$result[0][$row['Field']]}</strong></label></div></td></tr>";
				echo "<td><input id=\"ff-{$row['Field']}\" type=\"text\" name=\"{$row['Field']}\" class=\"demoInputBox\" value=\"{$result[0][$row['Field']]}\" /></td></tr>";		
				}

/*			if($row['Field'] != "ID")
			{
				echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
				echo "<input id=\"ff-{$row['Field']}\" type=\"text\" name=\"{$row['Field']}\" class=\"demoInputBox\" value=\"{$result[0][$row['Field']]}\"/></div>";
			}
*/    }
}
?>
</table>
<div>
<input type="submit" name="submit" id="btnAddAction" value="Save" />
</div>
</div>