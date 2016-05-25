<?php
	include "connect.php";
	session_start();
    $query="select id_petugas, nama_petugas
            from petugas
            where petugas.id_petugas='$_POST[ID]'";

    $stid=oci_parse($conn,$query);
    oci_execute($stid);

    $row=oci_fetch_array($stid);

	$pas=$_POST['pass'];

	if($row != NULL){
		if ($pas=="fpmbd"){
		  header("Location: index.php");
		  $_SESSION['admin-login'] = $row['NAMA_PETUGAS'];
		}
		else {
		  	header("Location: admin-login.php?status=gagal");
		}
	}
	else {
	  header("Location: admin-login.php?status=user_not_found");
	}
?>