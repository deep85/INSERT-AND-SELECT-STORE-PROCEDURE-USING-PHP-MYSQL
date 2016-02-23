<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<link href="css/bootstrap.css" media="all" rel="stylesheet" type="text/css">
<link href="css/animate.css" media="all" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jsjquery-1.10.2.min.js"></script>
</head>

<body style="background:#000000; padding:25px;">
<div class="wrapper" style="width:980px; background:#fff; margin:0px auto; padding:10px;">
<div class="jumbotron">
  <div class="container">
    <form method="post">
      <div class="form-group">
        <label class="control-label">Country Name</label>
        <input type="text" name="country_name" id="country_name" class="form-control">
      </div>
      <input type="submit" value="submit" name="submit" class="btn btn-success">
    </form>
    
  </div>
</div>
<div class="table-responsive">
      <table class="table table-striped table-bordered">
        <tr>
          <th>Country Name</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
        <?php 
	 
	 include_once('config_store_procedure.php');  
	 if(isset($_POST['submit']))

	 {
		 $insert_data=$mysqli->query("CALL insertCountry('".$_POST['country_name']."')");
		 
		 if ($insert_data){			 
			 echo" successfully inserted";
			 
			 }
		 
		 }
	 
	 $results=$mysqli->query("CALL selectCountry()");
	 
	 if (mysqli_num_rows($results) > 0){
		 while($row=mysqli_fetch_array($results))
		 {
			  ?>
        <tr>
          <td><?php echo $row['country_name'];?></td>
          <td><a href="php_store_procedure.php?edit=1&country_id=<?php echo $row['country_id']; ?>" class="btn btn-default">Edit</a></td>
          <td><a href="#" class="btn btn-danger" id="<?php echo $row['country_id']; ?>">Delete</a></td>
        </tr>
        <?php
			 }
		 
		 }
	 
	 else{
		 ?>
        <tr>
          <td colspan="3">No data found</td>
        </tr>
        <?php 
		 }
	 
	 
	 
	 ?>
      </table>
    </div>
    </div>

<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>