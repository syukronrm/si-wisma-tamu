<?php
// Create connection to Oracle
<<<<<<< HEAD
$conn = oci_connect("FPFP", "FPFP", "//localhost/XE");
=======
$conn = oci_connect("fp", "fp", "//localhost/XE");
>>>>>>> c65de8546ace4113eb3c439c95c73ffd786f0b8e
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {
   
}
// Close the Oracle connection

?>