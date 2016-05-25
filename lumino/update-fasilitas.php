<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  if (isset($_POST['update_fasilitas']))
  {
    $_SESSION['id_fasilitas'] = $_POST['update_fasilitas'];
  }
  include 'connect.php';
      $id_fasilitas = $_SESSION['id_fasilitas'];
  //    $_SESSION['id_kamar'] = $_POST['id_kam'];
//      $id_kamar = $_SESSION['id_kamar'];

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

             <?php

                        $query1 = "select distinct f.*, jk.nama_jenis, w.nama_wisma 
                        from fasilitas f, jenis_kamar jk, kamar k, wisma w 
                        where f.id_fasilitas='$id_fasilitas' and f.id_jenis= jk.id_jenis and jk.id_jenis= k.id_jenis and w.id_wisma=k.id_wisma";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $nama_fasilitas = $row['NAMA_FASILITAS'];
                        $harga_fasilitas = $row['HARGA_FASILITAS'];
                //        $alamat_petugas = $row['ALAMAT_PETUGAS'];
             
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="cek-update-fasilitas.php">
                              <div class="form-group">
                                <label class="control-label">ID FASILITAS: '.$id_fasilitas.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_fasilitas" value="'.$id_fasilitas.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA FASILITAS</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="nama_fasilitas" value="'.$nama_fasilitas.'">
                                 </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">HARGA FASILITAS</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="harga_fasilitas" value="'.$harga_fasilitas.'">
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