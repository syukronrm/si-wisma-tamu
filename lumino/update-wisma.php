<?php
session_start();
  if (isset($_POST['update_wisma']))
  {
    $_SESSION['id_wisma'] = $_POST['update_wisma'];
  }
  include 'connect.php';
    $id_wisma = $_SESSION['id_wisma'];
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

                       $query1 = "select * from wisma where id_wisma='$id_wisma'";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $nama_wisma = $row['NAMA_WISMA'];
                        $alamat_wisma = $row['ALAMAT_WISMA'];
                //        $alamat_petugas = $row['ALAMAT_PETUGAS'];
                      
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="cek-update-wisma.php">
                              <div class="form-group">
                                <label class="control-label">ID WISMA: '.$id_wisma.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_wisma" value="'.$id_wisma.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA WISMA</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="nama_wisma" value="'.$nama_wisma.'">
                                 </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">ALAMAT WISMA</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="alamat_wisma" value="'.$alamat_wisma.'">
                                 </div>
                              </div>
                                <table style="width:15%">
                                  
                                    <tr>
                                      <td> <input class="btn btn-success" value="simpan" type="submit"> </td>
                                      <td><button name="batal"  value="batal" class="btn btn-success" >Batal</button> 
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