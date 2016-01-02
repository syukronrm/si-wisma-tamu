
<?php
include 'connect.php';
$batal = $_POST['batal'];
$batal1 ="batal";
if($batal == $batal1){

  header("Location: data-petugas.php?batal");
}
else {
  $id_petugas = $_POST['id_petugas'];
  $query = "update petugas set nama_petugas = '$_POST[nama_petugas]',
  alamat_petugas = '$_POST[alamat_petugas]',
  telepon_petugas = '$_POST[no_hp_petugas]'
  where id_petugas='$id_petugas'";
//echo $query;
  $tmp = oci_parse($conn, $query);
  oci_execute($tmp);

  if($tmp)
  {
    header("Location:data-petugas.php?status=sukses"); 
  }
  else
  {
    header("Location:data-petugas.php?status=gagal"); 
//header("Location:wisma-flamboyan.php?status=gagal");
  }

}

?>