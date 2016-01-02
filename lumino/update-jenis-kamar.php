<?php
session_start();
  if (isset($_POST['update_jenis']))
  {
    $_SESSION['id_jenis'] = $_POST['update_jenis'];
  }
  include 'connect.php';
      $id_jenis = $_SESSION['id_jenis'];
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

                        $query1 = "select * from jenis_kamar where id_jenis='$id_jenis'";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $nama_jenis = $row['NAMA_JENIS'];
                        $harga = $row['HARGA'];
                //        $alamat_petugas = $row['ALAMAT_PETUGAS'];
             
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="cek-update-jenis.php">
                              <div class="form-group">
                                <label class="control-label">ID jenis: '.$id_jenis.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_jenis" value="'.$id_jenis.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA JENIS</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="nama_jenis" value="'.$nama_jenis.'">
                                 </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">HARGA jenis</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="harga" value="'.$harga.'">
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