<?php
if(!session_start())
{
	session_start();
}
if(isset($_SESSION['username'])){
	header("location:wines/list.php");
}
require_once("dbcontroller.php");

	$error_message = "";
	if(isset($_POST['submit']))
	{
		$db_handle = new DBController();

		$username=$_POST['username'];
		$password=$_POST['password'];
		
		$clean_username = strip_tags(stripslashes(mysqli_real_escape_string($db_handle->connectDB(), $username)));
		$clean_password = strip_tags(stripslashes(mysqli_real_escape_string($db_handle->connectDB(), $password)));
		
		$sql="SELECT * FROM User_Accounts WHERE User_Name='$clean_username' AND Password='$clean_password'";
		//echo $sql;
		$rs = mysqli_query($db_handle->connectDB(), $sql) or die(mysqli_error());

		$numofrows = mysqli_num_rows($rs);
		
		if($numofrows==1){
			$_SESSION["username"] = $clean_username;
			//echo $_SESSION["username"];
			header("location: wines/list.php");
		}
		else {
			$error_message = "<p>Incorrect User Name or Password</p>";
		}
	}


?>


<link href="style.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
/*function validate() {s
	var valid = true;	
	$(".demoInputBox").css('background-color','');
	$(".info").html('');
	return valid;
}*/
</script>

<link href="style.css" type="text/css" rel="stylesheet" />
<form name="frmToy" method="post" action="" id="frmToy">
<div id="mail-status"><h2><strong>Login - <i>Wines</i> Database Administration</strong></h2></div>
<hr />
<br />
<div>
<label style="padding-top:20px;">User Name </label>
<span id="name-info" class="info"></span><br/>
<input type="text" name="username" id="name" class="demoInputBox" required>
</div>
<div>
<label>Password</label>
<span id="code-info" class="info"></span><br/>
<input type="password" name="password" id="password" class="demoInputBox" required>
</div>
<div> <?php echo $error_message; ?></div>
<div>
<input type="submit" name="submit" id="btnAddAction" value="Login" />
</div>
</div>