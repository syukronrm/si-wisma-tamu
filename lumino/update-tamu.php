<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  if (isset($_POST['update_tamu']))
  {
    $_SESSION['id_tamu'] = $_POST['update_tamu'];
  }
  include 'connect.php';
      $id_tam = $_SESSION['id_tamu'];
  //    $_SESSION['id_kamar'] = $_POST['id_kam'];
//      $id_kamar = $_SESSION['id_kamar'];

?>

<link rel="stylesheet" type="text/css" href="css/datepicker1.css">
<script type="text/javascript" src="js/bootstrap-datepicker1.js"></script>

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

             <?php

      //      include "coba.php"
        //    $idkamar = $_POST['edit_kam'];
                        $query1 = "select * from tamu where id_tamu='$id_tam'";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $nama_tamu = $row['NAMA_TAMU'];
                        $telepon_tamu = $row['TELEPON_TAMU'];
                        $alamat_tamu = $row['ALAMAT_TAMU'];
                        $tanggal_lahir = $row['TGL_LAHIR'];

             
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="cek-update-tamu.php">
                              <div class="form-group">
                                <label class="control-label">ID TAMU : '.$id_tam.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_tamu" value="'.$id_tam.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA TAMU</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="nama_tamu" value="'.$nama_tamu.'">
                                 </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NOMOR TELEPON</label>
                                  <div class="controls">
                                    <input class="form-control" type="text" name="no_hp_tamu" value="'.$telepon_tamu.'">
                                  </div>
                                </div>
                              <div class="form-group">
                                <label class="control-label">ALAMAT </label>
                                  <div class="controls">
                                    <input class="form-control" type="text" name="alamat_tamu" value="'.$alamat_tamu.'">
                                  </div>
                                </div>
                              <div class="form-group">
                                <label for="tanggal-lahir">TANGGAL LAHIR </label>
                                <div class="controls">
                                  <input type="text" class="span2 form-control" value id="tanggal-lahir" name="tanggal_lahir" value="'.$tanggal_lahir.'" data-date-format="dd-mm-yyyy" required>
                                </div>
                              </div>
                                <table style="width:15%">
                                  
                                    <tr>
                                      <td> <input class="btn btn-success" value="simpan" type="submit"> </td>
                                      <td><a href="data-tamu.php"><button name="batal"  value="batal" class="btn btn-success" >Batal</button> </a>
                                    </tr>
                                  
                                </table>
                               
                              </div>
                            </form>
                          </div>
                        </div>';
                      
          
            ?>
          </div>
        </div>
      </div>
      <!-- Site footer -->


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

<?php include("template/footer.php");?>