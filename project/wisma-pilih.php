<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  include 'coba.php';
  session_start();
?>

<?php
  if (isset($_POST['id_kamar']))
  {
    $_SESSION['id_kamar'] = $_POST['id_kamar'];
  }

  if (isset($_POST['nama_tamu'])
      and isset($_POST['no_hp_tamu'])
      and isset($_POST['alamat_tamu']))
  {
    $nama = $_POST['nama_tamu'];
    $no_hp = $_POST['no_hp_tamu'];
    $alamat = $_POST['alamat_tamu'];

    $query1 = "insert into tamu
              values (tamu_seq.nextval ,
              '$no_hp',
              '$nama',
              '$alamat')";
    $query1_parse = oci_parse($conn, $query1);
    oci_execute($query1_parse);

    $query_id_tamu = "select id_tamu
                      from tamu
                      where nama_tamu='$nama'
                      and telepon_tamu='$no_hp'";
    $query_id_tamu_parse = oci_parse($conn, $query_id_tamu);
    oci_execute($query_id_tamu_parse);
    $row_query_id_tamu = oci_fetch_array($query_id_tamu_parse);

    $query2 = "insert into transaksi_sewakamar
              (id_transaksi,
              id_tamu,
              id_petugas,
              tgl_transaksi,
              tgl_checkin)
              values
              (transaksi_sewakamar_seq.nextval,
              '".$row_query_id_tamu['ID_TAMU'] ."',
              '1',
              to_date('".date("d-m-Y")."','dd-mm-yyyy'),
              to_date('".date("d-m-Y")."','dd-mm-yyyy'))";
    $query2_parse = oci_parse($conn, $query2);
    oci_execute($query2_parse);

    $id_tamu = $row_query_id_tamu['ID_TAMU'];

    $query_id_transaksi = "select id_transaksi
                      from transaksi_sewakamar
                      where
                      tgl_checkin=to_date('".date("d-m-Y")."','dd-mm-yyyy')
                      and id_tamu='$id_tamu'";
    $query_id_transaksi_parse = oci_parse($conn, $query_id_transaksi);
    oci_execute($query_id_transaksi_parse);
    $row_query_id_transaksi = oci_fetch_array($query_id_transaksi_parse);

    $id_transaksi = $row_query_id_transaksi['ID_TRANSAKSI'];
    $id_kamar = $_SESSION['id_kamar'];

    $query_menyewa = "insert into menyewa
                      values (
                      '$id_transaksi',
                      '$id_kamar')";
    $query_menyewa_parse = oci_parse($conn, $query_menyewa);
    oci_execute($query_menyewa_parse);
  }
?>

<div class="container">
  <form class="form-horizontal" role="form" action="<?php $_PHP_SELF ?>" method="POST">
    <div class="form-group">
      <label class="control-label col-sm-2" for="nama">Nama :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="nama_tamu" placeholder="Masukkan nama">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">No. HP :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="no_hp_tamu" placeholder="Masukkan nomor HP">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Alamat :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="alamat_tamu" placeholder="Masukkan alamat">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <div class="icheckbox disabled">
          <input type="checkbox" id="flat-checkbox-1">
          <label for="flat-checkbox-1">Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>

<?php include("template/footer.php");?>

<style type="text/css">
.form-horizontal {
  max-width: 600px;
  padding: 15px;
  margin: 0 auto;
}
</style>
