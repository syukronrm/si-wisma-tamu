<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<<<<<<< HEAD
<?php
  include 'coba.php';
?>

=======
>>>>>>> 52ac95c6cf86fde11577fff93adb077269b7e58c
<div class="container">
  <div class="row" style="padding-top:20px;">
    <div class="panel panel-default" style="background-color:#eee">
      <div class="panel-body">
<<<<<<< HEAD
        <h3 align="center">DATA WISMA</h3>
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
                <th style="text-align:center;">ID Wisma</th>
                <th style="text-align:center;">Nama Wisma</th>
                <th style="text-align:center;">Alamat</th>
                <th style="text-align:center;">Edit</th>
                <th style="text-align:center;">Delete</th>
              </tr>
            </thead>
          <tbody>
           <?php
              $query = "select * from wisma";
              $stid = oci_parse($conn, $query);
              oci_execute($stid);

              while ($row = oci_fetch_array($stid))
              {?>
                <tr>
                <td><?php echo $row['ID_WISMA'];?></td>
                <td><?php echo $row['NAMA_WISMA'];?></td>
                <td><?php echo $row['ALAMAT_WISMA'];?></td>
                
                <td>
                  <div>
                    <form method="POST" action="#">
                      <center>
                        <button type="submit" class="btn btn-primary">Edit</button>
                        <input type="hidden" name="id_wisma" value="<?php echo $row['ID_WISMA'];?>"> </input>
                      </center>
                    </form>
                  </div>
                </td>
                <td>
                  <div>
                    <form method="GET" action="<?php $_PHP_SELF ?>">
                      <center>
                        <button type='submit' class="btn btn-primary" name='del_wisma' value="<?php echo $row['ID_WISMA'];?>">Delete</button>
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
              if( isset($_GET['del_wisma']))
              {
                $idkam = $_GET['del_wisma'];
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
=======
        <table class="table table-hover table-bordered table-striped">
          <thead>
            <tr>
              <th style="text-align:center;">Wisma</th>
              <th style="text-align:center;">Pendapatan Total</th>
            </tr>
          </thead>
          <tbody>
            <?php
            include 'coba.php';
            $query = "select temp2.nama_wisma, sum(bayar) as pendapatan
            from transaksi_sewakamar tr,
            (
              select m.id_transaksi, temp.nama_wisma
              from menyewa m,
                (
                select k.id_kamar, w.nama_wisma
                from kamar k,
                  (
                    select nama_wisma, id_wisma
                    from wisma
                  ) w
                where k.id_wisma=w.id_wisma
                ) temp
              where m.id_kamar in temp.id_kamar
            ) temp2
            where temp2.id_transaksi=tr.id_transaksi
            group by temp2.nama_wisma";
            $stid = oci_parse($conn, $query);
            oci_execute($stid);

            while ($row = oci_fetch_array($stid))
            {?>
              <tr>
                <td><?php echo $row['NAMA_WISMA'];?></td>
                <td><?php echo $row['PENDAPATAN'];?></td>
              </tr>
            <?php
            }
            ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

>>>>>>> 52ac95c6cf86fde11577fff93adb077269b7e58c

<?php include("template/footer.php");?>
