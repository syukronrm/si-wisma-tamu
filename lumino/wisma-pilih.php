<?php
  include 'connect.php';
?>

<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<link rel="stylesheet" type="text/css" href="css/datepicker1.css">
<script type="text/javascript" src="js/bootstrap-datepicker1.js"></script>

<?php
  echo $_SESSION['test'];
  if (isset($_POST['id_kamar']))
  {
    $_SESSION['id_kamar'] = $_POST['id_kamar'];
  }

  if (isset($_POST['nama_tamu'])
      and isset($_POST['no_hp_tamu'])
      and isset($_POST['alamat_tamu'])
      and isset($_SESSION['date-check-in'])
      and isset($_SESSION['date-check-out']))
  {
    $nama = $_POST['nama_tamu'];
    $no_hp = $_POST['no_hp_tamu'];
    $alamat = $_POST['alamat_tamu'];
    $check_in = $_SESSION['date-check-in'];
    $check_out = $_SESSION['date-check-out'];

    $query1 = "insert into tamu
              values ('TA'||to_char(tamu_seq.nextval,'FM000') ,
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
              tgl_checkin,
              tgl_checkout)
              values
              ('TR'||to_char(transaksi_sewakamar_seq.nextval,'FM000'),
              '".$row_query_id_tamu['ID_TAMU'] ."',
              'PE001',
              to_date('".date("d-m-Y")."','dd-mm-yyyy'),
              to_date('$check_in','dd-mm-yyyy'),
              to_date('$check_out', 'dd-mm-yyyy'))";
    $query2_parse = oci_parse($conn, $query2);
    oci_execute($query2_parse);

    $id_tamu = $row_query_id_tamu['ID_TAMU'];

    $query_id_transaksi = "select id_transaksi
                      from transaksi_sewakamar
                      where
                      tgl_checkin=to_date('$check_in','dd-mm-yyyy')
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

    $query_update = "update transaksi_sewakamar set lama=extract(day from (tgl_checkout-tgl_checkin)) where id_transaksi='$id_transaksi'";
    $query_update_parse = oci_parse($conn, $query_update);
    oci_execute($query_update_parse);

    $query = "DECLARE
                ID_TR VARCHAR2(200);
                v_Return NUMBER;
              BEGIN
                ID_TR := NULL;

                v_Return := SETHARGA(
                  ID_TR => '$id_transaksi'
                );
                
                UPDATE transaksi_sewakamar
                SET harga=v_return
                where id_transaksi='$id_transaksi';
              END;";
    $query_function_parse = oci_parse($conn, $query);
    oci_execute($query_function_parse);
  }
?>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">     
    <div class="row">
      <ol class="breadcrumb">
        <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
        <li class="active">Icons</li>
      </ol>
    </div><!--/.row-->

  
    <div class="row" style="padding-top:20px;">
      <div class="col-lg-12">
      <div class="panel panel-default" >
        <div class="panel-body">
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
          <!--   <div class="icheckbox disabled">
                <input type="checkbox" id="flat-checkbox-1">
                <label for="flat-checkbox-1">Remember me</label>
              </div> -->
            </div>
          </div>
          <!-- <div class="form-group">
            <label class="control-label col-sm-2" for="tanggal-lahir">Tanggal Lahir: </label>
            <div class="col-sm-10">
              <input type="text" class="span2 form-control" value id="tanggal-lahir" name="tanggal-lahir" data-date-format="dd-mm-yyyy" required>
            </div>
          </div> -->
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="submit" class="btn btn-default">Submit</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

</div>
<?php include("template/footer.php");?>

<script type="text/javascript">
var nowTemp = new Date();
var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

var checkin = $('#tanggal-lahir').datepicker({
  onRender: function(date) {
    return date.valueOf() < now.valueOf() ? 'disabled' : '';
  }
}).on('changeDate', function(ev) {
  if (ev.date.valueOf() > checkout.date.valueOf()) {
    var newDate = new Date(ev.date)
    newDate.setDate(newDate.getDate() + 1);
    checkout.setValue(newDate);
  }
  checkin.hide();
  $('#date-check-out')[0].focus();
}).data('datepicker');
var checkout = $('#date-check-out').datepicker({
  onRender: function(date) {
    return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
  }
}).on('changeDate', function(ev) {
  checkout.hide();
}).data('datepicker');
</script>
<!-- datepicker -->

<style type="text/css">
.form-horizontal {
  max-width: 700px;
  padding: 15px;
  margin: 0 auto;
}
</style>
