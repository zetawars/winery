<?php
if(!session_start())
{
	session_start();
}
if(!isset($_SESSION['username'])){
	header("location:index.php");
}
	require_once("perpage.php");	
	require_once("dbcontroller.php");
	$db_handle = new DBController();
	
	$name = "";
	$winery = "";
	
	$queryCondition = "";
	if(!empty($_POST["search"])) {
		foreach($_POST["search"] as $k=>$v){
			if(!empty($v)) {

				$queryCases = array("name","winery");
				if(in_array($k,$queryCases)) {
					if(!empty($queryCondition)) {
						$queryCondition .= " AND ";
					} else {
						$queryCondition .= " WHERE ";
					}
				}
				switch($k) {
					case "name":
						$name = $v;
						$queryCondition .= "name LIKE '" . $v . "%'";
						break;
					case "winery":
						$winery = $v;
						$queryCondition .= "winery LIKE '" . $v . "%'";
						break;
				}
			}
		}
	}
	$orderby = " ORDER BY id desc"; 
	$sql = "SELECT * FROM Wines " . $queryCondition;
	$href = 'list.php';					
		
	$perPage = 5; 
	$page = 1;
	if(isset($_POST['page'])){
		$page = $_POST['page'];
	}
	$start = ($page-1)*$perPage;
	if($start < 0) $start = 0;
		
	$query =  $sql . $orderby .  " limit " . $start . "," . $perPage; 
	//echo $query;
	$result = $db_handle->runQuery($query);
	
	if(!empty($result)) {
		$result["perpage"] = showperpage($db_handle->connectDB(),$sql, $perPage, $href);
	}else{
		$result["perpage"] = "No record found!";
	}
?>
<html>
	<head>
	<title>Wines - Database Administration</title>
	<link href="style.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<h2>Wines - Database Administration</h2>
<hr />
<?php 
	echo "Welcome <strong>" .$_SESSION['username'] . "</strong>"; 
?> <a href="logout.php">Logout</a>
		<div style="text-align:right;margin:20px 0px 10px;">
		<a id="btnAddAction" href="add.php">Add New</a>
		</div>
    <div id="toys-grid">      
			<form name="frmSearch" method="post" action="list.php">
			<div class="search-box">
			<p>
            <input type="text" placeholder="winery" name="search[winery]" class="demoInputBox" value="<?php echo $winery; ?>"/>
            <input type="text" placeholder="Name" name="search[name]" class="demoInputBox" value="<?php echo $name; ?>"	/>
            <input type="submit" name="go" class="btnSearch" value="Search"><input type="reset" class="btnSearch" value="Reset" onClick="window.location='list.php'"></p>
			</div>
			
			<table cellpadding="5" cellspacing="1">
        <thead>
					<tr>
                    	<th><strong>Action</strong></th> 
                        <th><strong>Key</strong></th> 
                        <th><strong>Winery Number</strong></th> 
                        <th><strong>Winery</strong></th> 
                        <th><strong>Name</strong></th> 
                        <th><strong>Vintage</strong></th> 
                        <th><strong>Price Public</strong></th> 
                        <th><strong>Price WC</strong></th> 
                        <th><strong>Price Case Pub</strong></th> 
                        <th><strong>Price Case WC</strong></th> 
                        <th><strong>Flavor Notes</strong></th> 
                        <th><strong>Type</strong></th> 
                        <th><strong>Varietal</strong></th> 
                        <th><strong>Active</strong></th> 
                        <th><strong>Wine Maker</strong></th> 
                        <th><strong>Region</strong></th> 
                        <th><strong>Country</strong></th> 
                        <th><strong>Food Pairing</strong></th> 
                        <th><strong>Composition</strong></th> 
                        <th><strong>Alcohol</strong></th> 
                        <th><strong>Aging</strong></th> 
                        <th><strong>Favorite</strong></th> 
					
					</tr>
				</thead>
				<tbody>
					<?php
						foreach($result as $k => $v) {
						if(is_numeric($k)) {
					?>
          <tr>
					<td>
					<a class="btnEditAction" href="edit.php?id=<?php echo $result[$k]["ID"]; ?>">Edit</a> 
                    <a class="btnDeleteAction" href="delete.php?action=delete&id=<?php echo $result[$k]["ID"]; ?>" onClick="return confirm('Are you sure you want to delete this item?');">Delete</a>
					</td>
                    <td>
					<a class="btnViewAction" href="details.php?id=<?php echo $result[$k]["ID"]; ?>"><?php echo $result[$k]["ID"]; ?></a> </td>
                  <?php
                    echo "<td>" . nl2br( $result[$k]['Winery_Number']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Winery']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Name']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Vintage']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Price_Public']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Price_WC']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Price_Case_Pub']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Price_Case_WC']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Flavor_Notes']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Type']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Varietal']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Active']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Wine_Maker']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Region']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Country']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Food_Pairing']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Composition']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Alcohol']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Aging']) . "</td>";  
                    echo "<td>" . nl2br( $result[$k]['Favorite']) . "</td>";  
                  ?>  
					</tr>
					<?php
						}
					}
					if(isset($result["perpage"])) {
					?>
					<tr>
					<td colspan="5" align=right> <?php echo $result["perpage"]; ?></td>
					</tr>
					<?php } ?>
				<tbody>
			</table>
			</form>	
		</div>
	</body>
</html>