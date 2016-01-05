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
          <?php 
          if( isset($_GET['pendapatan'])){
            $query2 = "select sum(jk.harga*q.lama) as pendapatan, w.nama_wisma
                        from (
                          select id_transaksi, tgl_checkin, tgl_checkout, (tgl_checkout- tgl_checkin) as lama
                          from transaksi_sewakamar
                          where id_tamu in(
                            select id_tamu from tamu)) q, menyewa m, kamar k, jenis_kamar jk, wisma w
                        where q.id_transaksi=m.id_transaksi and m.id_kamar= k.id_kamar and k.id_jenis=jk.id_jenis and k.id_wisma=w.id_wisma
                        group by w.nama_wisma
                        order by pendapatan desc";
            $stid2 = oci_parse($conn, $query2);
            oci_execute($stid2);
            echo '
            <div>
         <h3 align="center">PENDAPATAN WISMA</h3>
         <table class="table table-hover table-bordered table-striped">
           <thead>
             <tr>
               <th style="text-align:center;">Wisma</th>
               <th style="text-align:center;">Pendapatan Total</th>
             </tr>
           </thead>';
        
            while ($row1 = oci_fetch_array($stid2))
             {
              echo '
              <tr>
               <td>'.$row1['NAMA_WISMA'].'</td>
               <td>'.$row1['PENDAPATAN'].'</td>
              </tr>';
            }
            echo '
            </tbody>
          </table>
        </div>';
          if (isset($_GET['close']) );?>
          </form>
        <form method="GET" action="<?php $_PHP_SELF ?>">
          <div class="pull-right">
              <button type="submit" class="btn" name='close'>close</button>
          </div>
        </form>
        <br>
          <?php
          }

          ?>
          <br>
          
         <form method="GET" action="<?php $_PHP_SELF ?>">
          <div class="pull-right">
              <button type="submit" class="btn" name='pendapatan'>Pendapatan</button>
          </div>
        </form>
          <br>
        
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
                    <form method="POST" action="update-wisma.php">
                      <center>
                        <button type="submit" class="btn btn-primary">Edit</button>
                        <input type="hidden" name="update_wisma" value="<?php echo $row['ID_WISMA'];?>"> </input>
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
            <br>
            <a href="tambah-wisma.php">  <button class="btn">TAMBAH BARU</button> </a>
          </div>
       <div>
           <?php
              if( isset($_GET['del_wisma']))
              {
                $idwisma = $_GET['del_wisma'];
                echo '
                   <form method="POST" action="delete-wisma.php">
                    <div class="controls" style="display:none;">
                      <input class="form-control" type="text" name="id_wisma" value="'.$idwisma.'">
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