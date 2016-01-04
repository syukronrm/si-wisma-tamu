<?php
session_start();
  if (isset($_POST['update_transaksi']))
  {
    $_SESSION['id_transaksi'] = $_POST['update_transaksi'];
  }
  include 'connect.php';
      $id_transaksi = $_SESSION['id_transaksi'];
  //    $_SESSION['id_kamar'] = $_POST['id_kam'];
//      $id_kamar = $_SESSION['id_kamar'];

?>

<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

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

                        $query1 = "select ts.*, kw.nama_wisma, kw.nama_jenis, m.id_kamar, t.nama_tamu
                          from transaksi_sewakamar ts, menyewa m, tamu t,(
                              select w.nama_wisma, k.id_kamar, jk.nama_jenis
                              from kamar k, wisma w, jenis_kamar jk
                              where k.id_wisma=w.id_wisma and jk.id_jenis= k.id_jenis) kw
                          where ts.id_transaksi= m.id_transaksi and m.id_kamar=kw.id_kamar and t.id_tamu= ts.id_tamu and ts.id_transaksi='$id_transaksi'";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $nama_tamu = $row['NAMA_TAMU'];
                        $id_kamar = $row['ID_KAMAR'];
                        $nama_jenis = $row['NAMA_JENIS'];
                        $nama_wisma = $row['NAMA_WISMA'];
                        $tgl_transaksi = $row['TGL_TRANSAKSI'];
                        $tgl_checkin = $row['TGL_CHECKIN'];
                        $tgl_checkout = $row['TGL_CHECKOUT'];
                        $tgl_bayar = $row['TGL_BAYAR'];
                        $denda = $row['DENDA'];
             
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="cek-update-transaksi.php">
                              <div class="form-group">
                                <label class="control-label">ID TRANSAKSI &nbsp; : '.$id_transaksi.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_transaksi" value="'.$id_transaksi.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA TAMU &emsp; : '.$nama_tamu.'</label>
                              </div>
                              <div class="form-group">
                                <label class="control-label">ID KAMAR &emsp;&emsp; : '.$id_kamar.'</label>
                              </div>
                              <div class="form-group">
                                <label class="control-label" >JENIS KAMAR &ensp;: '.$nama_jenis.'</label>
                                </div>
                              <div class="form-group">
                                <label class="control-label">WISMA &emsp;&emsp;&emsp;&ensp; : '.$nama_wisma.' </label>
                              </div>
                              <div class="form-group">
                                <label class="control-label">TANGGAL TRANSAKSI</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="tgl_transaksi" value="'.$tgl_transaksi.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">TANGGAL CHECKIN</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="tgl_checkin" value="'.$tgl_checkin.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">TANGGAL CHECKOUT</label>
                                <div class="controls" >
                                  <input class="form-control" type="text" name="tgl_checkout" value="'.$tgl_checkout.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">TANGGAL BAYAR</label>
                                  <div class="controls">
                                  <input class="form-control" type="text" name="tgl_bayar" value="'.$tgl_bayar.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">DENDA</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="tgl_checkout" value="'.$denda.'">
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
<?php include("template/footer.php");?>