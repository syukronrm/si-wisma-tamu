<!doctype html>

<html>
  
  <head>
    <title>.:INFORMASI WISMA TAMU:.</title>
    <meta name="viewport" content="width=device-width">
     <link rel="stylesheet" type="text/css" href="cssku.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
                  <a href="#" style="color:white"> Home</a>
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
            <table class="table table-hover table-bordered table-striped">
               <thead>
                <tr>
                  <th style="text-align:center;">ID Kamar</th>
                  <th style="text-align:center;">Jenis Kamar</th>
                  <th style="text-align:center;">Status Kamar</th>
                  <th style="text-align:center;">Pilih</th>
                  <th style="text-align:center;">Delete</th> 
                </tr>
              </thead>
              <tbody>
                 <?php
                  include 'coba.php';
                  $query = "select kamar.id_kamar, jenis_kamar.nama_jenis, kamar.status_kamar
                            from kamar , wisma, jenis_kamar
                            where kamar.id_wisma=wisma.id_wisma and kamar.id_jenis= jenis_kamar.id_jenis
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
                          <button type='submit'  name='id_peg' value="<?php echo $row['id_kamar'];?>">Edit</button>
                        </form>
                      </div>
                    </td>
                    <td> 
                      <div>
                        <form method="GET" action="<?php $_PHP_SELF ?>"> 
                          <button type='submit'  name='del_peg' value="<?php echo $row['id_kamar'];?>">Delete</button>
                        </form>
                      </div>
                    </td>

                  <?php
                  }
                  ?>
              </tbody>
            </table>
            <div class="pull-right"> 
              <a href="formtmbhpeg.php">  <button class="btn">TAMBAH BARU</button> 
            </a> </div>
            <div> 
              <a href="kepegawaian.php">  <button class="btn">KEMBALI</button> 
            </a> </div>
            
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