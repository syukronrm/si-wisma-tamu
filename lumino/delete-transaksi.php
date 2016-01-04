<?php
	include ('connect.php');

	$idtransaksi = $_POST['id_transaksi'];
     $query = "delete from transaksi_sewakamar where id_transaksi='$idtransaksi'";

	$stid = oci_parse($conn, $query);
	oci_execute($stid);	
	//$query = "delete from btab where id_pegawai=$idpeg";
//	$stid = oci_parse($conn, $query);
//	oci_execute($stid);
	if ($stid){
	  header("Location: data-transaksi.php?status=sukses");
	}
	else {
	  header("Location: data-transaksi.php?status=gagal");
	}
?>