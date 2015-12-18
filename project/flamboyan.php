<?php include("template/header.php");?>
  
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
                  <a href="home.php" style="color:white"> Home</a>
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
	<!--	    <ul class="nav nav-justified">
          <li class="active">
            <a href="home.html">Home</a>
          </li>
          <li >
                  <a href="#">Reservasi</a>            

          </li>
        </ul>
      <!-- Example row       </div>
      <!-- Jumbotron -->

      <div class="row" style="padding-top:20px;">
      <div class="col-md-12" >
        <div class="panel panel-default" style="background-color:#eaeae1">
          <div class="panel-body">
            <h3 align="center">WISMA TAMU FLAMBOYAN</h3>
            
            <?php
               if(isset($_GET['status']) && $_GET['status']=="sukses")
               {
                echo "<div class='alert alert-dismissable alert-success'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <center><b>Tabel Berhasil Diupdate!</b></center>
                </div>";
               }
               else if(isset($_GET['status']) && $_GET['status']=="gagal"){
                echo "<div class='alert alert-dismissable alert-danger'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <center><b>Tabel Gagal Diupdate!</b></center>z
                </div>";
               } 
            ?>
            <table class="table table-hover table-bordered table-striped">
               <thead>
                <tr>
                  <th style="text-align:center;">ID Kamar</th>
                  <th style="text-align:center;">Jenis Kamar</th>
                  <th style="text-align:center;">Status Kamar</th>
                  <th style="text-align:center;">Pilih</th>
                  <th style="text-align:center;">Edit</th>
                  <th style="text-align:center;">Delete</th> 
                </tr>
              </thead>
              <tbody>
                 <?php
                  include 'coba.php';
                  $query = "select kamar.id_kamar, jenis_kamar.nama_jenis, kamar.status_kamar
                            from kamar , wisma, jenis_kamar
                            where kamar.id_wisma=wisma.id_wisma and kamar.id_jenis= jenis_kamar.id_jenis and wisma.nama_wisma='Flamboyan'
                            order by kamar.id_kamar";
                  $stid = oci_parse($conn, $query);
                  oci_execute($stid);

                  while ($row = oci_fetch_array($stid)) 
                  {?>

                    <tr>
                      <td><?php echo $row['ID_KAMAR'];?></td>
                    <td><?php echo $row['NAMA_JENIS'];?></td>
                    <td><?php echo $row['STATUS_KAMAR'];?></td>
                    <td>
                      <div>

                        <form method="GET" action="<?php $_PHP_SELF ?>"> 
                          <?php 

                          if (strcmp($row['STATUS_KAMAR'],"KOSONG")==1)
                            $tombol= "btn btn-primary disabled";
                          else  $tombol= "btn btn-primary";
                          echo '
                          <button type="submit" class="'.$tombol.'" name="pilih_kam" value="'.$row['ID_KAMAR'].'">Pilih</button>';
                          ?>
                        </form>
                      </div>
                    </td>
                    <td>
                      <div>
                        <form method="POST" action="update.php"> 
                          <center>
                          <button type="submit" class="btn btn-primary">Edit</button>
                          <input type="hidden" name="id_kam" value="<?php echo $row['ID_KAMAR'];?>"> </input>
                          </center>
                        </form>
                      </div>
                    </td>
                    <td> 
                      <div>
                        <form method="GET" action="<?php $_PHP_SELF ?>"> 
                          <button type='submit' class="btn btn-primary" name='del_kam' value="<?php echo $row['ID_KAMAR'];?>">Delete</button>
                        </form>
                      </div>
                    </td>

                       
                  <?php
                  }
                  ?>
              </tbody>

            </table>
            <div class="pull-right"> 
              <a href="#">  <button class="btn">TAMBAH BARU</button> 
            </a> </div>
            
            <div> 
              <a href="#">  <button class="btn">KEMBALI</button> 
            </a> </div>

            <div>
             <?php
                include "coba.php";

                if( isset($_GET['del_kam']))
                {
                  $idkam = $_GET['del_kam'];
                  echo ' 
                     <form method="POST" action="delkamar.php">
                      <div class="controls" style="display:none;">
                        <input class="form-control" type="text" name="id_kam" value="'.$idkam.'">
                      </div>
                      <div class="alert alert-dismissable">
                        <center><b> Melanjutkan Penghapusan ? </b> <br><br>
                        <button type="submit" style="width:70px"> Ya </button> &nbsp &nbsp &nbsp
                        <button type="button" data-dismiss="alert" submit style="width:70px"> Tidak </button> 
                        </center>
                      </div>
                    </form>
                  ';
                }
                 /*               
                    if( isset($_GET['edit_kam']))
                      {

                        $idkamar = $_GET['edit_kam'];
                        $query1 = "select kamar.id_jenis, jenis_kamar.nama_jenis, kamar.status_kamar
                                  from kamar , wisma, jenis_kamar
                                  where kamar.id_wisma=wisma.id_wisma and kamar.id_jenis= jenis_kamar.id_jenis and wisma.nama_wisma='Flamboyan'
                                        and kamar.id_kamar='edit_kam'
                                  order by kamar.id_kamar";
                        $stid = oci_parse($conn, $query1);
                        oci_execute($stid);
                        $row = oci_fetch_array($stid);
                        $namajenis = $row['NAMA_JENIS'];
                        $idjenis = $row['ID_JENIS'];
                        $statuskam = $row['STATUS_KAMAR'];

                        echo '
                        <div class="panel panel-default">
                          <div class="panel-body">
                            <form method="POST" action="update_kamar.php">
                              <div class="form-group">
                                <label class="control-label">ID KAMAR : '.$idkamar.'</label>
                                <div class="controls" style="display:none;">
                                  <input class="form-control" type="text" name="id_peg" value="'.$idkamar.'">
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
                        
                        }*/
                      
              //  else 
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