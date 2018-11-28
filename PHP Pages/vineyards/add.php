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
	
	$myQuery = "INSERT INTO Vineyards VALUES ('NULL','$subject')";
//	echo $myQuery;
	$result = mysqli_query($db_handle->connectDB(), $myQuery) or die(mysqli_error()); 
	echo "Record Added.<br />"; 
	echo "<a href='list.php'>Back To Listing</a>"; 

	if(!$result){
			$message="Problem in Adding to database. Please Retry.";
	} else {
		//header("Location:index.php");
	}
 	
//$sql = "INSERT INTO `wines` ( `Winery_Number` ,  `Winery` ,  `Name` ,  `Vintage` ,  `Price_Public` ,  `Price_WC` ,  `Price_Case_Pub` ,  `Price_Case_WC` ,  `Price_Sale_Pub` ,  `Price_Sale_WC` ,  `Flavor_Notes` ,  `Tasting_Notes` ,  `Type` ,  `Varietal` ,  `Active` ,  `Wine_Maker` ,  `Region` ,  `Country` ,  `Website` ,  `Reviewer` ,  `Rating` ,  `Image_Location` ,  `Tasting_Date` ,  `Food_Pairing` ,  `Composition` ,  `Alcohol` ,  `Aging` ,  `Favorite`  ) VALUES(  '{$_POST['Winery_Number']}' ,  '{$_POST['Winery']}' ,  '{$_POST['Name']}' ,  '{$_POST['Vintage']}' ,  '{$_POST['Price_Public']}' ,  '{$_POST['Price_WC']}' ,  '{$_POST['Price_Case_Pub']}' ,  '{$_POST['Price_Case_WC']}' ,  '{$_POST['Price_Sale_Pub']}' ,  '{$_POST['Price_Sale_WC']}' ,  '{$_POST['Flavor_Notes']}' ,  '{$_POST['Tasting_Notes']}' ,  '{$_POST['Type']}' ,  '{$_POST['Varietal']}' ,  '{$_POST['Active']}' ,  '{$_POST['Wine_Maker']}' ,  '{$_POST['Region']}' ,  '{$_POST['Country']}' ,  '{$_POST['Website']}' ,  '{$_POST['Reviewer']}' ,  '{$_POST['Rating']}' ,  '{$_POST['Image_Location']}' ,  '{$_POST['Tasting_Date']}' ,  '{$_POST['Food_Pairing']}' ,  '{$_POST['Composition']}' ,  '{$_POST['Alcohol']}' ,  '{$_POST['Aging']}' ,  '{$_POST['Favorite']}'  ) "; 
//echo $sql;
	
/*	$result = mysql_query("INSERT INTO wines (name, code, category, price, stock_count) VALUES('".$_POST["name"]."','".$_POST["code"]."','".$_POST["category"]."','".$_POST["price"]."','".$_POST["stock_count"]."')");
	if(!$result){
			$message="Problem in Adding to database. Please Retry.";
	} else {
		header("Location:index.php");
	}
*/}


?>
<link href="../style.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
/*function validate() {
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
onClick="return validate();" //in form tag if want to use validation
*/</script>


<form name="frmToy" method="post" action="" id="frmToy">
<div id="mail-status"></div>
<table>
<tr>
<?php  
$columns = mysqli_query($db_handle->connectDB(),"SHOW COLUMNS FROM Vineyards");
if (!$columns) {
   	echo $columns;
    echo 'Could not run query: ' . mysqli_error();
    exit;
}
if (mysqli_num_rows($columns) > 0) {
    while ($row = mysqli_fetch_assoc($columns)) {
		if($row['Field'] == 'ID')
		{
			//echo "<input id=\"ff-{$row['Field']}\" type=\"hidden\" name=\"{$row['Field']}\" value=\"NULL\" class=\"demoInputBox\" />";
			 continue;
		}
		else if($row['Field'] == "Winery_Notes" || $row['Field'] == "Location")
		{
			echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
			echo "<textarea rows=\"4\" cols=\"50\" id=\"ff-{$row['Field']}\" name=\"txtBox[]\" class=\"demoInputBox\" ></textarea></div>";			
		}
/*		else if($row['Field'] == "Type")
		{
			echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
			echo "<select name='txtBox[]'><option selected>Select a Status</option>";
			echo "<option value='White'>White</option>";
			echo "<option value='Red'>Red</option>";
			echo "<option value='Sparkling'>Sparkling</option>";
			echo "<option value='Dessert'>Dessert</option>";
			echo "<option value='Sweet'>Sweet</option> </select></div>";

		}
		else if($row['Field'] == "Varietal")
		{
			$varietal = mysqli_query($db_handle->connectDB(), "SELECT * FROM Varietal");
			if (!$varietal) {
				echo 'Could not run query: ' . mysqli_error();
				exit;
			}
			if (mysqli_num_rows($varietal) > 0) 
			{
				echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";				
				echo "<select name=\"txtBox[]\">";
				
    			while ($list = mysqli_fetch_assoc($varietal)) 
				{
					echo "<option value=\"{$list['Varietal']}\">{$list['Varietal']}</option>";
				}
				echo "</select></div>";
			}

		}
		else if($row['Field'] == "Active")
		{
			echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
			echo "<select name='txtBox[]'>";
			echo "<option value='Y'>Yes</option>";
			echo "<option value='N'>No</option>";
			echo "</select></div>";			
		}
		else if($row['Field'] == "Country")
		{
			$country = mysqli_query($db_handle->connectDB(), "SELECT * FROM Country");
			if (!$country) {
				echo 'Could not run query: ' . mysqli_error();
				exit;
			}
			if (mysqli_num_rows($country) > 0) 
			{
				echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";				
				echo "<select name=\"txtBox[]\">";
				
    			while ($countrylist = mysqli_fetch_assoc($country)) 
				{
					echo "<option value=\"{$countrylist['Country']}\">{$countrylist['Country']}</option>";
				}
				echo "</select></div>";
			}

		}*/

		else{
			echo "<div><label for=\"ff-{$row['Field']}\" >{$row['Field']}</label><br />";
			echo "<input id=\"ff-{$row['Field']}\" type=\"text\" name=\"txtBox[]\" class=\"demoInputBox\" /></div>";
		}
    }
}
?>
<!--<div>
<label style="padding-top:20px;">Name</label>
<span id="name-info" class="info"></span><br/>
<input type="text" name="name" id="name" class="demoInputBox">
</div>
<div>
<label>Code</label>
<span id="code-info" class="info"></span><br/>
<input type="text" name="code" id="code" class="demoInputBox">
</div>
<div>
<label>Category</label> 
<span id="category-info" class="info"></span><br/>
<input type="text" name="category" id="category" class="demoInputBox">
</div>
<div>
<label>Price</label> 
<span id="price-info" class="info"></span><br/>
<input type="text" name="price" id="price" class="demoInputBox">
</div>
<div>
<label>Stock Count</label> 
<span id="stock_count-info" class="info"></span><br/>
<input type="text" name="stock_count" id="stock_count" class="demoInputBox">
</div>
--><div>
<input type="submit" name="submit" id="btnAddAction" value="Add" />
</div>
</div>