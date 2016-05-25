
<?php include("template/header.php");?>
<?php include("template/navbar.php");?>


<?php
session_start();
  if (isset($_POST['update_kamar']))
  {
    $_SESSION['id_kamar'] = $_POST['update_kamar'];
  }
  include 'connect.php';
      $id_kam = $_SESSION['id_kamar'];
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
            /*            $query1 = "select k.id_kamar, jk.nama_jenis, w.nama_wisma 
                    from kamar k, jenis_kamar jk, wisma w 
                    where k.id_wisma=nama_w.wisma and k.id_jenis=jk.id_jenis and k.id_kamar='$id_kam'";
                        $stid1 = oci_parse($conn, $query1);
                        oci_execute($stid1);
                        $row = oci_fetch_array($stid1);
                        $nama_tamu = $row['NAMA_JENIS'];
                        $telepon_tamu = $row['TELEPON_TAMU'];
                        $alamat_tamu = $row['ALAMAT_TAMU'];
                        $tanggal_lahir = $row['TGL_LAHIR'];*/

                  $query="select id_jenis, nama_jenis from jenis_kamar";
                  $stid = oci_parse($conn, $query);
                  oci_execute($stid);

                  $query2="select id_wisma, nama_wisma from wisma";
                  $stid2 = oci_parse($conn, $query2);
                  oci_execute($stid2);
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="cek-update-kamar.php">
                              <div class="form-group">
                                <label class="control-label">ID KAMAR : '.$id_kam.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_kamar" value="'.$id_kam.'">
                                </div>
                              </div>
                              <div class="form-group">
                               <select name="wisma" style="btn-info;height:30px" placeholder="WISMA">';
                                 while ($row2 = oci_fetch_array($stid2))
                                 {?>
                                    <option value="<?php echo $row2['ID_WISMA'];?>"> <?php echo $row2['NAMA_WISMA'];?> </option>
                                <?php  } 
                                  echo'
                              </select> 
                              </div>
                              <div class="form-group">
                               <select name="jenis_kamar" style="btn-info;height:30px" placeholder="JENIS KAMAR">';
                                 while ($row = oci_fetch_array($stid))
                                 {?>
                                    <option value="<?php echo $row['ID_JENIS'];?>"> <?php echo $row['NAMA_JENIS']; ?> </option>
                                <?php  } 
                                  echo'
                              </select> 
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