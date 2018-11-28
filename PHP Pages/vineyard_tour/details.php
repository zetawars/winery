<?php
require_once("../dbcontroller.php");
$db_handle = new DBController();
$id = (int) $_GET['id'];

?>

<link href="../style.css" type="text/css" rel="stylesheet" />
<form name="frmToy" method="post" action="" id="frmToy" ">
<div id="mail-status"></div>
<table cellpadding="5">

<?php
$result = $db_handle->runQuery("SELECT * FROM Vineyard_Tour WHERE ID='" . $_GET["id"] . "'");
$columns = mysqli_query($db_handle->connectDB(), "SHOW COLUMNS FROM Vineyard_Tour");
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
		else if($row['Field'] == "Winery_Logo")
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']} :   </label></td>";
			echo "<td><img src=\"{$result[0][$row['Field']]}\" alt=\"Smiley face\"></td>";
		}
/*		else if($row['Field'] == "Winery_Image")
		{
			echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']} :   </label></td>";
			echo "<td><img src=\"{$result[0][$row['Field']]}\" alt=\"Smiley face\"></td>";
		}
*/		else{
				echo "<tr><td><label for=\"ff-{$row['Field']}\" >{$row['Field']} :  </label></td>";
				echo "<td><label for=\"ff-{$row['Field']}\" ><strong>{$result[0][$row['Field']]}</strong></label></div></td></tr>";				}
    }
}
?>
</table>
<div>
			<a class="btnEditAction" href="edit.php?id=<?php echo $id; ?>">Edit</a> 
            
            <a class="btnDeleteAction" href="delete.php?action=delete&id=<?php echo $id; ?>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></div>
</div>