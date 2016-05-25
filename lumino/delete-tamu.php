<?php
	include ('connect.php');
	session_start();

	$idtamu = $_POST['id_tamu'];
     $query = "delete from tamu where id_tamu='$idtamu'";

	$stid = oci_parse($conn, $query);
	oci_execute($stid);	
	//$query = "delete from btab where id_pegawai=$idpeg";
//	$stid = oci_parse($conn, $query);
//	oci_execute($stid);
	if ($stid){
	  header("Location: data-tamu.php?status=sukses");
	}
	else {
	  header("Location: data-tamu.php?status=gagal");
	}
?>