<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  session_start();
  include 'coba.php';
  if (isset($_POST['namatamu']))
  {
    $_SESSION['namatamu'] = $_POST['namatamu'];
  }
  if (isset($_POST['tanggalmasuk']))
  {
    $_SESSION['tanggalmasuk'] = $_POST['tanggalmasuk'];
  }
  if (isset($_POST['bulanmasuk']))
  {
    $_SESSION['bulanmasuk'] = $_POST['bulanmasuk'];
  }
  if (isset($_POST['tahunmasuk']))
  {
    $_SESSION['tahunmasuk'] = $_POST['tahunmasuk'];
  }
  if (isset($_POST['tanggalmasuk']))
  {
    $_SESSION['tanggallahir'] = $_POST['tanggallahir'];
  }
  if (isset($_POST['tanggallahir']))
  {
    $_SESSION['bulanlahir'] = $_POST['bulanlahir'];
  }
  if (isset($_POST['tahunlahir']))
  {
    $_SESSION['tahunlahir'] = $_POST['tahunlahir'];
  }
  $namatamu = $_SESSION['namatamu'];
  $tanggalmasuk = $_SESSION['tanggalmasuk'];
  $bulanmasuk= $_SESSION['bulanmasuk'];
  $tahunmasuk=$_SESSION['tahunmasuk'];
  $tanggallahir=$_SESSION['tanggallahir'];
  $bulanlahir=$_SESSION['bulanlahir'];
  $tahunlahir=$_SESSION['tahunlahir'];
?>

<div class="container">
  <div class="row" style="padding-top:20px;">
    <div class="panel panel-default" style="background-color:#eee">
      <div class="panel-body">
   
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

          if($namatamu==NULL and $bulanmasuk==0 and $bulanlahir==0){
            $query="select t.*, ts.id_transaksi from tamu t, transaksi_sewakamar ts where t.id_tamu=ts.id_tamu";
          }
          else if($namatamu == NULL and $tanggalmasuk==NULL and $bulanmasuk==0 and $tahunmasuk==NULL and $tanggallahir==NULL and $tahunlahir==NULL){
                //hanya bulan lahir
                  $query = "select t.* from tamu t, transaksi_sewakamar ts
                            where extract(month from t.tgl_lahir) = '$bulanlahir' and t.id_tamu= ts.id_tamu ";
              }
              else if($namatamu == NULL and $bulanmasuk==0 and $tanggalmasuk==NULL & $tahunmasuk==NULL){
                //hanya tgl, bulan, tahun lahir
                  $query = "select t.* from tamu t, transaksi_sewakamar ts 
                            where extract(month from t.tgl_lahir) = '$bulanlahir' and extract(day from t.tgl_lahir) = '$tanggallahir' and extract(year from t.tgl_lahir) = '$tahunlahir'and t.id_tamu= ts.id_tamu ";
              }
              else if($namatamu == NULL and $bulanlahir==0 and $tanggallahir==NULL & $tahunlahir==NULL){
                //hanya tgl, bulan, tahun masuk
                  $query = "select t.* from tamu t, transaksi_sewakamar ts
                            where extract(month from ts.tgl_checkin) = '$bulanmasuk' and extract(day from ts.tgl_checkin) = '$tanggalmasuk' and extract(year from ts.tgl_checkin) = '$tahunmasuk'and t.id_tamu= ts.id_tamu ";
              }
              else if($namatamu == NULL and $tanggalmasuk==NULL and $tahunmasuk==NULL and $tanggallahir==NULL and $tahunlahir==NULL){
                //hanya bulan lahir dan bulan masuk
                  $query = "select t.*, ts.id_transaksi from tamu t, transaksi_sewakamar ts
                            where extract(month from t.tgl_lahir) = '$bulanlahir' and extract(month from ts.tgl_checkin) = '$bulanmasuk' and t.id_tamu= ts.id_tamu ";
              }
      
              else {
                $query="select t.*, ts.id_transaksi from tamu t, transaksi_sewakamar ts 
                        where t.nama_tamu='$namatamu' and t.id_tamu=ts.id_tamu";
              }
             // $query = "select * from tamu order by ID_TAMU asc";
              $stid = oci_parse($conn, $query);
              oci_execute($stid);
              
        ?>

        <?php 
          $query1 = "select nama_wisma from wisma order by nama_wisma";
          $stid1 = oci_parse($conn, $query1);
          oci_execute($stid1);
          while ($row1 = oci_fetch_array($stid1)){
        ?>
          <h3><?php echo $row1['NAMA_WISMA']?> </h3>
          <table class="table table-hover table-bordered table-striped">
            <thead>
              <tr>
                <th style="text-align:center;">ID Tamu</th>
                <th style="text-align:center;">Nama Tamu</th>
                <th style="text-align:center;">Telepon</th>
                <th style="text-align:center;">Alamat</th>
                <th style="text-align:center;">Edit</th>
                <th style="text-align:center;">Delete</th>
              </tr>
            </thead>
          <tbody>
           <?php
             $nm = $row1['NAMA_WISMA'];
              $query2 = "select e.*, w.nama_wisma
                        from ( select q.*, m.id_kamar
                                from ($query) q, menyewa m
                                where q.id_transaksi=m.id_transaksi
                              ) e, kamar k, wisma w
                        where e.id_kamar= k.id_kamar and k.id_wisma=w.id_wisma and w.nama_wisma='$nm'
                         order by w.nama_wisma";
           //   echo $query2;
//echo $query2;
              $stid2 = oci_parse($conn, $query2);
              oci_execute($stid2);
              while ($row = oci_fetch_array($stid2))
              {?>
                <tr>
                <td><?php echo $row['ID_TAMU'];?></td>
                <td><?php echo $row['NAMA_TAMU'];?></td>
                <td><?php echo $row['TELEPON_TAMU'];?></td>
                <td><?php echo $row['ALAMAT_TAMU'];?></td>
                
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
          <?php } ?>
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

<?php include("template/footer.php");?>