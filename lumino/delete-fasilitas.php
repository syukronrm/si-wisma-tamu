<?php
	include ('connect.php');
	session_start();

	$idfasilitas = $_POST['id_fasilitas'];
     $query = "delete from fasilitas where id_fasilitas='$idfasilitas'";

	$stid = oci_parse($conn, $query);
	oci_execute($stid);	
	//$query = "delete from btab where id_pegawai=$idpeg";
//	$stid = oci_parse($conn, $query);
//	oci_execute($stid);
	if ($stid){
	  header("Location: data-fasilitas.php?status=sukses");
	}
	else {
	  header("Location: data-fasilitas.php?status=gagal");
	}
?>