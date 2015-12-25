<?php
session_start();
  if (isset($_POST['id_kam']))
  {
    $_SESSION['id_kamar'] = $_POST['id_kam'];
  }
  include 'coba.php';
      $id_kam = $_SESSION['id_kamar'];
  //    $_SESSION['id_kamar'] = $_POST['id_kam'];
//      $id_kamar = $_SESSION['id_kamar'];

?>
<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<div class="container">
      <div class="row" style="padding-top:20px;">
      <div class="col-md-12" >
        <div class="panel panel-default" style="background-color:#eaeae1">
          <div class="panel-body">
             <?php

      //      include "coba.php"
        //    $idkamar = $_POST['edit_kam'];
                        $query1 = "select kamar.id_jenis, jenis_kamar.nama_jenis, kamar.status_kamar, wisma.nama_wisma
                                  from kamar , wisma, jenis_kamar
                                  where kamar.id_wisma=wisma.id_wisma and kamar.id_jenis= jenis_kamar.id_jenis and wisma.nama_wisma='Flamboyan'
                                        and kamar.id_kamar='$id_kam'
                                  order by kamar.id_kamar";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $namawisma = $row['NAMA_WISMA'];
                        $namajenis = $row['NAMA_JENIS'];
                        $idjenis = $row['ID_JENIS'];
                        $statuskam = $row['STATUS_KAMAR'];

             
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="update_kamar.php">
                              <div class="form-group">
                                <label class="control-label">WISMA    : '.$namawisma.'</label>
                                <br>
                                <label class="control-label">ID KAMAR : '.$id_kam.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_peg" value="'.$id_kam.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA JENIS</label>
                                <div class="controls">
                                  <select style="btn-info;height:30px">
                                    <option value=""> Standar</option>
                                    <option value=""> Eksekutif</option>
                                    <option value=""> VIP</option>
                                  </select>
                       <!--           <input class="form-control" type="text" name="nama_jenis" value="'.$namajenis.'"> -->
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">STATUS</label>
                                  <div class="controls">
                                    <input class="form-control" type="text" name="status_kamar" value="'.$statuskam.'">
                                  </div>
                                </div>
                                <table style="width:15%">
                                  
                                    <tr>
                                      <td> <input class="btn btn-success" value="Update" type="submit"> </td>
                                      <td> <button class="btn btn-success" href="flamboyan.php">Batal</button> </td>
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
      <div class="footer" style="color:white">
        <center><p>&copy; TC 14</p></center>
      </div>
    </div>
    <!-- /container -->
  </body>

</html>

