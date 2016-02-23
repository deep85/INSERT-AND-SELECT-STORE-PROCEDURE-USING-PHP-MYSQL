<?php
include_once('config_store_procedure.php'); 
if(isset($POST['submit']))

	 {
		 $insert_data=$mysqli->query("CALL insertCountry('".$POST["country_name"]."')");
		 if ($insert_data){			 
			 header('location:php_store_procedure.php');
			 
			 }
		 
		 }


 ?>