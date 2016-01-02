<?php
session_start();
  if (isset($_POST['update_petugas']))
  {
    $_SESSION['id_petugas'] = $_POST['update_petugas'];
  }
  include 'connect.php';
      $id_petugas = $_SESSION['id_petugas'];
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

                        $query1 = "select * from petugas where id_petugas='$id_petugas'";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $nama_petugas = $row['NAMA_PETUGAS'];
                        $telepon_petugas = $row['TELEPON_PETUGAS'];
                        $alamat_petugas = $row['ALAMAT_PETUGAS'];
             
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="cek-update-petugas.php">
                              <div class="form-group">
                                <label class="control-label">ID PETUGAS: '.$id_petugas.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_petugas" value="'.$id_petugas.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA PETUGAS</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="nama_petugas" value="'.$nama_petugas.'">
                                 </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NOMOR TELEPON</label>
                                  <div class="controls">
                                    <input class="form-control" type="text" name="no_hp_petugas" value="'.$telepon_petugas.'">
                                  </div>
                                </div>
                              <div class="form-group">
                                <label class="control-label">ALAMAT </label>
                                  <div class="controls">
                                    <input class="form-control" type="text" name="alamat_petugas" value="'.$alamat_petugas.'">
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