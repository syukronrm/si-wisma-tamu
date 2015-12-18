<?php

      include 'coba.php';
      $id_kam = $_POST['id_kam'];
      //echo $id_kam
 //     $query=oci_parse($conn,"select blobdata from btab where id_pegawai = $id_peg");
   //   oci_execute($query);
   //   $row=oci_fetch_array($query,OCI_ASSOC+OCI_RETURN_NULLS);
      
     // $size = $row['BLOBDATA']->size();        
     // $ret = $row['BLOBDATA']->read($size);
     // $str_img = "<img src='data:image/jpeg;base64,". base64_encode($ret) ."' />";
    //  echo $str_img;
      
    //  oci_commit($conn)
?>

<html>
  
  <head>
    <title>.:INFORMASI WISMA TAMU:.</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" type="text/css" href="cssku.css">
    <script type="text/javascript" src="aset/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
 
  </head>
  
  <body style="background-image: url(back.jpg); background-attachment:fixed; " >
    <div class="container">
      <div class="masthead">
        <h1 style="text-align:right;color:white">
           <i><b>WISMA TAMU</b></i>
        </h1>
        <h3 style="text-align:right;color:white"> 
            <i><b>Institut Teknologi Sepuluh Nopember</b></i>
        </h3>
          <ul class="nav nav-tabs" >
              <li >
                  <a href="home.html" style="color:white"> Home</a>
              </li>
              <li class="active"> 
                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="color:black">Reservasi <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="#">Famboyan</a>
                  </li>
                  <li>
                    <a href="#">Bougenville</a>
                  </li>
                  <li>
                    <a href="#">Jasmine</a>
                  </li>
                  <li>
                    <a href="#">Tambah Wisma</a>
                  </li>
                </ul>
              </li>
          </ul>
  <!--      <ul class="nav nav-justified">
          <li class="active">
            <a href="home.html">Home</a>
          </li>
          <li >
                  <a href="#">Reservasi</a>            

          </li>
        </ul>
       Example row       </div>
       Jumbotron -->

      <div class="row" style="padding-top:20px;">
      <div class="col-md-12" >
        <div class="panel panel-default" style="background-color:#eaeae1">
          <div class="panel-body">
             <?php

      //      include "coba.php"
        //    $idkamar = $_POST['edit_kam'];
                        $query1 = "select kamar.id_jenis, jenis_kamar.nama_jenis, kamar.status_kamar
                                  from kamar , wisma, jenis_kamar
                                  where kamar.id_wisma=wisma.id_wisma and kamar.id_jenis= jenis_kamar.id_jenis and wisma.nama_wisma='Flamboyan'
                                        and kamar.id_kamar='$id_kam'
                                  order by kamar.id_kamar";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $namajenis = $row['NAMA_JENIS'];
                        $idjenis = $row['ID_JENIS'];
                        $statuskam = $row['STATUS_KAMAR'];

                        echo $namajenis;
                        echo $id_kam;
                        echo $idjenis;
                        echo $statuskam;
                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="update_kamar.php">
                              <div class="form-group">
                                <label class="control-label">ID KAMAR : '.$id_kam.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_peg" value="'.$id_kam.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">NAMA JENIS</label>
                                <div class="controls">
                                  <input class="form-control" type="text" name="nama_jenis" value="'.$namajenis.'">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label">STATUS</label>
                                  <div class="controls">
                                    <input class="form-control" type="text" name="status_kamar" value="'.$statuskam.'">
                                  </div>
                                </div>
                                <div class="pull-right">
                                  <input class="btn btn-success" value="Update" type="submit">
                                </div>
                                <div class="pull-right">
                                  <button class="btn btn-success" href="flamboyan.php">Batal</button>
                                </div>
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

