<?php
	include ('connect.php');
	session_start();

	$idjenis= $_POST['id_jenis'];
     $query = "delete from jenis_kamar where id_jenis='$idjenis'";

	$stid = oci_parse($conn, $query);
	oci_execute($stid);	
	//$query = "delete from btab where id_pegawai=$idpeg";
//	$stid = oci_parse($conn, $query);
//	oci_execute($stid);
	if ($stid){
	  header("Location: data-jenis-kamar.php?status=sukses");
	}
	else {
	  header("Location: data-jenis-kamar.php?status=gagal");
	}
?>