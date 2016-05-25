<?php
	include "connect.php";
	session_start();

	$jml = $_POST['diskon'];
	echo $jml;
	
    $query="BEGIN UpdateDiskonKamar($jml); END;";
    $stid=oci_parse($conn,$query);
    oci_execute($stid);

    header("Location: diskon.php?diskon=ok");
?>