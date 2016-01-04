<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  include 'connect.php';
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
        <h3 align="center">DATA TRANSAKSI</h3>
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
          <table class="table table-hover table-bordered table-striped" data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true">
            <thead>
              <tr>
                <th style="text-align:center;">Nama Tamu</th>
                <th style="text-align:center;">ID Kamar</th>
                <th style="text-align:center;">Jenis Kamar</th>
                <th style="text-align:center;">Wisma</th>
                <th data-align="center">Tanggal <br>Transaksi &nbsp;</th>
                <th data-align="center">Tanggal <br> Check In</th>
                <th data-align="center">Tanggal <br>Check Out</th>
                <th data-align="center">Tanggal Bayar</th>
                <th style="text-align:center;">Denda</th>
                <th style="text-align:center;">Edit</th>
                <th style="text-align:center;">Delete</th>
              </tr>
            </thead>
          <tbody>
           <?php
              $query = "select ts.*, kw.nama_wisma, kw.nama_jenis, m.id_kamar, t.nama_tamu
                        from transaksi_sewakamar ts, menyewa m, tamu t,(
                            select w.nama_wisma, k.id_kamar, jk.nama_jenis
                            from kamar k, wisma w, jenis_kamar jk
                            where k.id_wisma=w.id_wisma and jk.id_jenis= k.id_jenis) kw
                        where ts.id_transaksi= m.id_transaksi and m.id_kamar=kw.id_kamar and t.id_tamu= ts.id_tamu";
              $stid = oci_parse($conn, $query);
              oci_execute($stid);

              while ($row = oci_fetch_array($stid))
              {?>
                <tr>
                <td><?php echo $row['NAMA_TAMU'];?></td>
                <td><?php echo $row['ID_KAMAR'];?></td>
                <td><?php echo $row['NAMA_JENIS'];?></td>
                <td><?php echo $row['NAMA_WISMA'];?></td>
                <td><?php echo $row['TGL_TRANSAKSI'];?></td>
                <td><?php echo $row['TGL_CHECKIN'];?></td>
                <td><?php echo $row['TGL_CHECKOUT'];?></td>
                <td><?php echo $row['TGL_BAYAR'];?></td>
                <td><?php echo $row['DENDA'];?></td>
                
                <td>
                  <div>
                    <form method="POST" action="update-transaksi.php">
                      <center>
                        <button type="submit" class="btn btn-primary">Edit</button>
                        <input type="hidden" name="update_transaksi" value="<?php echo $row['ID_TRANSAKSI'];?>"> </input>
                      </center>
                    </form>
                  </div>
                </td>
                <td>
                  <div>
                    <form method="GET" action="<?php $_PHP_SELF ?>">
                      <center>
                        <button type='submit' class="btn btn-primary" name='del_transaksi' value="<?php echo $row['ID_TRANSAKSI'];?>">Delete</button>
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
           <?php
              if( isset($_GET['del_transaksi']))
              {
                $idtransaksi = $_GET['del_transaksi'];
                echo '
                   <form method="POST" action="delete-transaksi.php">
                    <div class="controls" style="display:none;">
                      <input class="form-control" type="text" name="id_transaksi" value="'.$idtransaksi.'">
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
</div>

<?php include("template/footer.php");?>
