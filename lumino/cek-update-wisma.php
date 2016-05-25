
<?php
include 'connect.php';
  session_start();
$batal = $_POST['batal'];
$batal1 ="batal";
if($batal == $batal1){

  header("Location: data-wisma.php?batal");
}
else {
  $id_wisma = $_POST['id_wisma'];
  $query = "update wisma set nama_wisma = '$_POST[nama_wisma]',
  alamat_wisma = '$_POST[alamat_wisma]'
  where id_wisma='$id_wisma'";
//echo $query;
  $tmp = oci_parse($conn, $query);
  oci_execute($tmp);

  if($tmp)
  {
    header("Location:data-wisma.php?status=sukses"); 
  }
  else
  {
    header("Location:data-wisma.php?status=gagal"); 
//header("Location:wisma-flamboyan.php?status=gagal");
  }

}

?>