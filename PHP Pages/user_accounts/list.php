<?php
if(!session_start())
{
	session_start();
}
if(!isset($_SESSION['username'])){
	header("location:../index.php");
}
	require_once("perpage.php");	
	require_once("../dbcontroller.php");
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
	$orderby = " ORDER BY ID desc"; 
	$sql = "SELECT * FROM User_Accounts " . $queryCondition;
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
	<link href="../style.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<h2>Wines - Database Administration</h2>
<hr />
<?php 
	echo "Welcome <strong>" .$_SESSION['username'] . "</strong>"; 
?> <a href="../logout.php">Logout</a>
<?php require_once("../navbar.php"); ?>
		<div style="text-align:right;margin:20px 0px 10px;">
		<a id="btnAddAction" href="add.php">Add New</a>
		</div>
        
			<!--<form name="frmSearch" method="post" action="list.php">
			<div class="search-box">
			<p>
            <input type="text" placeholder="winery" name="search[winery]" class="demoInputBox" value="<?php //echo $winery; ?>"/>
            <input type="text" placeholder="Name" name="search[name]" class="demoInputBox" value="<?php //echo $name; ?>"	/>
            <input type="submit" name="go" class="btnSearch" value="Search"><input type="reset" class="btnSearch" value="Reset" onClick="window.location='list.php'"></p>-->
			</div>
	<div id="toys-grid"> 
			<table cellpadding="5" cellspacing="1">
        <thead>
					<tr>
                    
	                    <td><b>Action</b></td>
                        <td><b>ID</b></td> 
                        <td><b>User ID</b></td> 
                        <td><b>User Name</b></td> 
                        <td><b>Password</b></td> 
                        <td><b>Login</b></td> 
                        <td><b>F Name</b></td> 
                        <td><b>L Name</b></td> 
                        <td><b>E-Mail</b></td> 
                        <td><b>Address1</b></td> 
                        <td><b>Address2</b></td> 
                        <td><b>City</b></td> 
                        <td><b>State</b></td> 
                        <td><b>Zip</b></td> 
                        <td><b>Phone</b></td>
                     </tr>
				</thead>
				<tbody>
					<?php
						foreach($result as $k => $v) {
						if(is_numeric($k)) {
					?>
          <tr>
					<td>
					<a href="edit.php?id=<?php echo $result[$k]["ID"]; ?>"><img alt="Edit" src="../images/btn_edit.gif" /></a> |
                    <a href="delete.php?action=delete&id=<?php echo $result[$k]["ID"]; ?>" onClick="return confirm('Are you sure you want to delete this item?');"><img alt="Delete" src="../images/btn_delete.gif" /></a>
					</td>
                    <td>
					<a href="details.php?id=<?php echo $result[$k]["ID"]; ?>"><?php echo $result[$k]["ID"]; ?></a> </td>
                  <?php
						echo "<td valign='top'>" . nl2br( $result[$k]['User_ID']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['User_Name']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['Password']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['Login']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['F_Name']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['L_Name']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['E-Mail']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['Address1']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['Address2']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['City']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['State']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['Zip']) . "</td>";  
						echo "<td valign='top'>" . nl2br( $result[$k]['Phone']) . "</td>";  
						
					
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