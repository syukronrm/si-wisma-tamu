<?php
// Create connection to Oracle

$conn = oci_connect("FPFP", "FPFP", "//localhost/XE");

//$conn = oci_connect("fp", "fp", "//localhost/XE");

if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {
   
}
// Close the Oracle connection

?>