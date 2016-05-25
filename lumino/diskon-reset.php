<?php
	include "connect.php";
	session_start();
	
    $query="BEGIN UPDATEKEHARGAAWAL(); END;";
    $stid=oci_parse($conn,$query);
    oci_execute($stid);

    header("Location: diskon.php?diskon=reset");
?>