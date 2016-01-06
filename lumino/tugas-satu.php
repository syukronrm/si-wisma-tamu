<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<?php
  	include 'connect.php';

  	$query = "select p.nama_petugas, t.tgl_transaksi
			from transaksi_sewakamar t,
			(
			  select id_petugas, nama_petugas
			  from petugas
			  where alamat_petugas like '%Dian Park%'
			) p
			where p.id_petugas= t.id_petugas";

	$query_parse = oci_parse($conn, $query);
	oci_execute($query_parse);
	
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
      			<h3 align="center"></h3>
      			<h5 align="center">Menampilkan nama petugas yang tinggal di Dian Park Regency dan tanggal transaksi yang dilakukan</h5>
      			<table class="table table-hover table-bordered table-striped" data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true">
		            <thead>
		              <tr>
		                <th style="text-align:center;">Nama Petugas</th>
		                <th style="text-align:center;">Tanggal Transaksi</th>
		              </tr>
		            </thead>
		          <tbody>
		          <?php 
		          while($row = oci_fetch_array($query_parse))
		          {?>
			      	<tr>
			      		<td><?php echo $row['NAMA_PETUGAS'] ?></td>
			      		<td><?php echo $row['TGL_TRANSAKSI'] ?></td>
			      	</tr>
		      	<?php
		          }
		          ?>
		          </tbody>
			</div>
		</div>
	</div>
</div>
</div>

<?php include("template/footer.php");?>