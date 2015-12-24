<?php
	include "coba.php";
    $query="select petugas.id_petugas
            from petugas
            where petugas.id_petugas='$_POST[ID]'";

    $stid=oci_parse($conn,$query);
    oci_execute($stid);

    $row=oci_fetch_array($stid);

	$pas=$_POST['pass'];
	//$ID=$_POST['ID'];
	if($row != NULL){
		if ($pas=="FPBASDAT"){
		  header("Location: index.php");
		}
		else {
		  header("Location: admin-login.php?status=gagal");
		}
	}
	else {
	  header("Location: admin-login.php?status=user_not_found");
	}
?>