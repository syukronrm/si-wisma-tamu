<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  include 'connect.php';
  if (isset($_POST['bulan']) and isset($_POST['jenis']))
  {
  	$bulan = $_POST['bulan'];
  	$jenis = $_POST['jenis'];

  	echo "string";
  	echo $bulan;
  	echo $jenis;

  	$query = "SELECT count_tamu($bulan, '$jenis') FROM dual";
	$query_parse = oci_parse($conn, $query);
	oci_execute($query_parse);
	$row = oci_fetch_array($query_parse);
  }
?>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">     
    <div class="row">
      <ol class="breadcrumb">
        <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
        <li class="active">Icons</li>
      </ol>
    </div><!--/.row-->

  
  <div class="row" style="padding-top:20px;">
    <div class="col-lg-12">
      <div class="panel panel-default" >
        <div class="panel-body">
			<form role="form" method="POST" action="<?php $_PHP_SELF ?>">
			    <div class="form-group">
			      <label for="sel1">Pilih Bulan:</label>
			      <select class="form-control" id="sel1" name="bulan">
			        <option>1</option>
			        <option>2</option>
			        <option>3</option>
			        <option>4</option>
			        <option>5</option>
			        <option>6</option>
			        <option>7</option>
			        <option>8</option>
			        <option>9</option>
			        <option>10</option>
			        <option>11</option>
			        <option>12</option>
			      </select>
			    </div>
			    <br>
			    <div class="form-group">
			      <label for="sel1">Pilih Jenis Kamar:</label>
			      <select class="form-control" id="sel1" name="jenis">
			        <option>Standar</option>
			        <option>Eksekutif</option>
			        <option>VIP</option>
			      </select>
			    </div>
			    <div class="form-group">
	              <div class="col-sm-offset-2 col-sm-10">
	                <button type="submit" class="btn btn-default">Submit</button>
	              </div>
	            </div>
			  </form>
			  <?php 
			  	if (isset($row[0]))
			  	{
			  		echo "<br>";
			  		echo "<br>";
			  		echo "<h3>Jumlahnya adalah $row[0]</h3>";
			  	}
			  ?>
		 </div>
      </div>
    </div>
  </div>

<?php include("template/footer.php");?>