<?php
	include ('coba.php');
	$idkam = $_POST['id_kam'];

	$query = "delete from kamar where id_kamar='$idkam'";
	$stid = oci_parse($conn, $query);
	oci_execute($stid);	
	//$query = "delete from btab where id_pegawai=$idpeg";
//	$stid = oci_parse($conn, $query);
//	oci_execute($stid);
	if ($stid){
	  header("Location: flamboyan.php?status=sukses");
	}
	else {
	  header("Location: flamboyan.php?status=gagal");
	}
?>