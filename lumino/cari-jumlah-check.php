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
	echo $row[0];
  }
?>
