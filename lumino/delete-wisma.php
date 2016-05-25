<?php
	include ('connect.php');
	session_start();

	$idwisma = $_POST['id_wisma'];
     $query = "delete from wisma where id_wisma='$idwisma'";

	$stid = oci_parse($conn, $query);
	oci_execute($stid);	
	//$query = "delete from btab where id_pegawai=$idpeg";
//	$stid = oci_parse($conn, $query);
//	oci_execute($stid);
	if ($stid){
	  header("Location: data-wisma.php?status=sukses");
	}
	else {
	  header("Location: data-wisma.php?status=gagal");
	}
?>