
<?php
include 'connect.php';
$batal = $_POST['batal'];
$batal1 ="batal";
if($batal == $batal1){

  header("Location: data-kamar.php?batal");
}
else {
  $id_kamar = $_POST['id_kamar'];
  $query = "update kamar set id_jenis = '$_POST[jenis_kamar]',
  id_wisma = '$_POST[wisma]'
  where id_kamar='$id_kamar'";
echo $query;
  $tmp = oci_parse($conn, $query);
  oci_execute($tmp);

  if($tmp)
  {
    header("Location:data-kamar.php?status=sukses"); 
  }
  else
  {
    header("Location:data-kamar.php?status=gagal"); 
//header("Location:wisma-flamboyan.php?status=gagal");
  }

}

?>