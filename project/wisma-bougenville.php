<?php include("template/header.php");?>
<?php include("template/navbar.php");?>
<div class="container">
  <div class="row" style="padding-top:20px;">
    <div class="panel panel-default" style="background-color:#eee">
      <div class="panel-body">
        <h3 align="center">WISMA TAMU BOUGENVILLE</h3>
        <?php
           if(isset($_GET['status']) && $_GET['status']=="sukses")
           {
            echo "
            <div class='alert alert-dismissable alert-success'>
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
                        where kamar.id_wisma=wisma.id_wisma
                        and kamar.id_jenis= jenis_kamar.id_jenis
                        and wisma.nama_wisma='Bougenville'
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
                    <form method="POST" action="wisma-pilih.php">
                      <?php
                      if (strcmp($row['STATUS_KAMAR'],"KOSONG")==1)
                        $tombol= "btn btn-primary disabled";
                      else
                        $tombol= "btn btn-primary";
                      echo '
                      <center>
                        <button type="submit" class="'.$tombol.'" name="id_kamar" value="'.$row['ID_KAMAR'].'">Pilih</button>
                      </center>
                      ';
                      ?>
                    </form>
                  </div>
                </td>
                <td>
                  <div>
                    <form method="POST" action="wisma-update.php">
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
                      <center>
                        <button type='submit' class="btn btn-primary" name='del_kam' value="<?php echo $row['ID_KAMAR'];?>">Delete</button>
                      </center>
                    </form>
                  </div>
                </td>
                <?php
                }
                ?>
              </tbody>
          </table>

          <div class="pull-right">
            <a href="#">  <button class="btn">TAMBAH BARU</button> </a>
          </div>

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
           ?>
         </div>
       </div>
     </div>
   </div>
</div>
<?php include("template/footer.php");?>
