
<?php
include 'connect.php';
$batal = $_POST['batal'];
$batal1 ="batal";
if($batal == $batal1){

  header("Location: data-fasilitas.php?batal");
}
else {
  $id_fasilitas = $_POST['id_fasilitas'];
  $query = "update fasilitas set nama_fasilitas='$_POST[nama_fasilitas]',
  harga_fasilitas='$_POST[harga_fasilitas]'
  where id_fasilitas='$id_fasilitas'";
//echo $query;
  $tmp = oci_parse($conn, $query);
  oci_execute($tmp);

  if($tmp)
  {
    header("Location:data-fasilitas.php?status=sukses$query"); 
  }
  else
  {
    header("Location:data-fasilitas.php?status=gagal"); 
//header("Location:wisma-flamboyan.php?status=gagal");
  }

}

?>