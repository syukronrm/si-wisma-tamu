<?php
	session_start();
	include ('connect.php');

	$idpetugas = $_POST['id_petugas'];
     $query = "delete from petugas where id_petugas='$idpetugas'";

	$stid = oci_parse($conn, $query);
	oci_execute($stid);	
	//$query = "delete from btab where id_pegawai=$idpeg";
//	$stid = oci_parse($conn, $query);
//	oci_execute($stid);
	if ($stid){
	  header("Location: data-petugas.php?status=sukses");
	}
	else {
	  header("Location: data-petugas.php?status=gagal");
	}
?>