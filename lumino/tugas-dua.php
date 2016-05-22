<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<?php
  	include 'connect.php';
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
      			<h3 align="center">DATA TRANSAKSI</h3>
      			<h5 align="center">Menampilkan jumlah penyewaan kamar tertentu</h5>

      			
	            <?php
	            if (isset($_POST['id_kamar']))
	            {
	            	$id_kamar = $_POST['id_kamar'];

	            	$query = "select count(*) as jumlah
							from transaksi_sewakamar tr, menyewa m
							where tr.id_transaksi=m.id_transaksi
							and m.id_kamar='$id_kamar'
							group by m.id_kamar";

					$query_parse = oci_parse($conn, $query);
					oci_execute($query_parse);
					$row = oci_fetch_array($query_parse);
	            	$jml = $row['JUMLAH'];
	            	echo "<h4 align='center'>Jumlah penyewaan = $jml pada kamar $id_kamar</h4>";
	            }
	            else
	            {?>
	            	<form method="POST" action="<?php $_PHP_SELF ?>">
		                <div class="form-group">
		                  <label class="control-label">ID KAMAR</label>
		                  <div class="controls">
		                    <input class="form-control" type="text" name="id_kamar" >
		                  </div>
		                </div>
	            	</form>
	            <?php
	            }
	             ?>
			</div>
		</div>
	</div>
</div>
</div>

<?php include("template/footer.php");?>