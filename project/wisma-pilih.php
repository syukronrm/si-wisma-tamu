<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<div class="container">
  <form class="form-horizontal" role="form" action="" method="POST">
    <div class="form-group">
      <label class="control-label col-sm-2" for="nama">Nama :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="nama_tamu" placeholder="Masukkan nama">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">No. KTP :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="id_tamu" placeholder="Masukkan nomor KTP">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">No. HP :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="no_hp_tamu" placeholder="Masukkan nomor HP">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Alamat :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="alamat_tamu" placeholder="Masukkan alamat">
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

<?php
  include 'coba.php';
  if (isset($_POST['id_kamar']))
  {
    $pilih = $_POST['id_kamar'];
  }
  if (isset($POST['nama_tamu'])
      and isset($_POST['id_tamu'])
      and isset($_POST['no_hp_tamu'])
      and isset($_POST['alamat_tamu']))
  {
    $nama = $_POST['nama_tamu'];
    $id = $_POST['id_tamu'];
    $no_hp = $_POST['no_hp_tamu'];
    $alamat = $_POST['alamat_tamu'];
  }
  else
  {
    # code...
  }
?>
