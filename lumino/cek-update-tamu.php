
<?php
include 'connect.php';
  session_start();
$batal = $_POST['batal'];
$batal1 ="batal";
if($batal == $batal1){

  header("Location: data-tamu.php?batal");
}
else {
  $id_tamu = $_POST['id_tamu'];
  $query = "update tamu set nama_tamu = '$_POST[nama_tamu]',
  alamat_tamu = '$_POST[alamat_tamu]',
  telepon_tamu = '$_POST[no_hp_tamu]',
  tgl_lahir= '$_POST[tanggal_lahir]'
  where id_tamu='$id_tamu'";
//echo $query;
  $tmp = oci_parse($conn, $query);
  oci_execute($tmp);

  if($tmp)
  {
    header("Location:data-tamu.php?status=sukses"); 
  }
  else
  {
    header("Location:data-tamu.php?status=gagal"); 
//header("Location:wisma-flamboyan.php?status=gagal");
  }

}

?>