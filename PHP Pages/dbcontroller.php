<?php
class DBController {
/*	private $host = "localhost";
	private $user = "root";
	private $password = "";
	private $database = "test";
*/
	private $host = "97.74.31.61";
	private $user = "TemeculaDB";
	private $password = "Wine!Admin2016";
	private $database = "TemeculaDB";

	function __construct() {
		$conn = $this->connectDB();
		if(!empty($conn)) {
			$this->selectDB($conn);
		}
	}
	
	function connectDB() {
		$conn = mysqli_connect($this->host,$this->user,$this->password, $this->database) or die(mysqli_error());
		return $conn;
	}
	
	function selectDB($conn) {
		mysqli_select_db($conn, $this->database);
	}
	
	function runQuery($query) {
		$result = mysqli_query($this->connectDB(),$query);
		while($row=mysqli_fetch_assoc($result)) {
			$resultset[] = $row;
		}		
		if(!empty($resultset))
			return $resultset;
	}
	
	function numRows($query) {
		$result  = mysqli_query($query);
		$rowcount = mysqli_num_rows($result);
		return $rowcount;	
	}
}
?>