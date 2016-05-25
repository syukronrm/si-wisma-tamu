
<?php
include 'connect.php';
  session_start();
$batal = $_POST['batal'];
$batal1 ="batal";
if($batal == $batal1){
  header("Location: data-jenis-kamar.php?batal");
}
else {
  $id_jenis = $_POST['id_jenis'];
  $nama= $_POST['harga'];
  $query = "update jenis_kamar set nama_jenis='$_POST[nama_jenis]',
  harga='$_POST[harga]'
  where id_jenis='$id_jenis'";
//echo $query;
  $tmp = oci_parse($conn, $query);
  oci_execute($tmp);

  if($tmp)
  {
    header("Location:data-jenis-kamar.php?status=sukses"); 
  }
  else
  {
    header("Location:data-jenis-kamar.php?status=gagal"); 
//header("Location:wisma-flamboyan.php?status=gagal");
  }

}

?>