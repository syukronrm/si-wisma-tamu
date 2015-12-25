<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  include 'coba.php';
?>

<div class="container">
  <div class="row" style="padding-top:20px;">
    <div class="panel panel-default" style="background-color:#eee">
      <div class="panel-body">
        <?php 
          if( isset($_GET['cari_tamu'])){
            echo '<div> 
            <form method="POST" action="hasil-cari-tamu.php">
                <b>Nama : </b>
            <input type="text" class="form-control" style="width:300px" name="namatamu">
                  <b>Tanggal Lahir :</b>
                  <br>
            <input type="text" maxlength="2" placeholder="tanggal" style="height:30px;width:100px" name="tanggallahir"></input>
            <select name="bulanlahir" style="btn-info;height:30px" placeholder="bulan">
              <option value="0"> Bulan </option>
              <option value="1"> Januari </option>
              <option value="2"> Februari </option>
              <option value="3"> Maret </option>
              <option value="4"> April </option>
              <option value="5"> Mei </option>
              <option value="6"> Juni </option>
              <option value="7"> Juli </option>
              <option value="8"> Agustus </option>
              <option value="9"> September </option>
              <option value="10"> Oktober </option>
              <option value="11"> Nopember </option>
              <option value="12"> Desember </option>
            </select> 
            <input type="text" maxlength="4" placeholder="tahun" style="height:30px;width:100px" name="tahunlahir"></input>         
                  <br>
                   <b>Tanggal Masuk :</b>
            <br>
            <input type="text" maxlength="2" placeholder="tanggal" style="height:30px;width:100px" name="tanggalmasuk"></input>
            <select name="bulanmasuk" style="btn-info;height:30px" placeholder="bulan">
              <option value="0"> Bulan </option>
              <option value="1"> Januari </option>
              <option value="2"> Februari </option>
              <option value="3"> Maret </option>
              <option value="4"> April </option>
              <option value="5"> Mei </option>
              <option value="6"> Juni </option>
              <option value="7"> Juli </option>
              <option value="8"> Agustus </option>
              <option value="9"> September </option>
              <option value="10"> Oktober </option>
              <option value="11"> Nopember </option>
              <option value="12"> Desember </option>
            </select> 
            <input type="text" maxlength="4" placeholder="tahun" style="height:30px;width:100px" name="tahunmasuk"></input>         
                  <br>
                  <br>
                  <button type="submit" class="btn" name="cari">Cari</button>
            </form>
                  </div>';
          }

        ?>
        <form method="GET" action="<?php $_PHP_SELF ?>">
          <div class="pull-right">
              <button type="submit" class="btn" name='cari_tamu'>Cari Tamu</button>
          </div>
        </form>
        <h3 align="center">DATA TAMU</h3>
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
                <th style="text-align:center;">ID Tamu</th>
                <th style="text-align:center;">Nama Tamu</th>
                <th style="text-align:center;">Telepon</th>
                <th style="text-align:center;">Alamat</th>
                <th style="text-align:center;">Tanggal Lahir</th>
                <th style="text-align:center;">Edit</th>
                <th style="text-align:center;">Delete</th>
              </tr>
            </thead>
          <tbody>
           <?php
              $query = "select * from tamu order by ID_TAMU asc";
              $stid = oci_parse($conn, $query);
              oci_execute($stid);

              while ($row = oci_fetch_array($stid))
              {?>
                <tr>
                <td><?php echo $row['ID_TAMU'];?></td>
                <td><?php echo $row['NAMA_TAMU'];?></td>
                <td><?php echo $row['TELEPON_TAMU'];?></td>
                <td><?php echo $row['ALAMAT_TAMU'];?></td>
                <td><?php echo $row['TGL_LAHIR'];?></td>
                
                <td>
                  <div>
                    <form method="POST" action="#">
                      <center>
                        <button type="submit" class="btn btn-primary">Edit</button>
                        <input type="hidden" name="id_petugas" value="<?php echo $row['ID_PETUGAS'];?>"> </input>
                      </center>
                    </form>
                  </div>
                </td>
                <td>
                  <div>
                    <form method="GET" action="<?php $_PHP_SELF ?>">
                      <center>
                        <button type='submit' class="btn btn-primary" name='del_petugas' value="<?php echo $row['ID_PETUGAS'];?>">Delete</button>
                      </center>
                    </form>
                  </div>
                </td>
                <?php
                }
                ?>
              </tbody>
          </table>

          <div>
            <a href="#">  <button class="btn">KEMBALI</button>
          </a> </div>

          <div>
           <?php
              if( isset($_GET['del_petugas']))
              {
                $idpetugas = $_GET['del_petugas'];
               /* echo '
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
                ';*/
              }
           ?>
         </div>
       </div>
     </div>
   </div>
</div>

<?php include("template/footer.php");?>3