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
        <h3 align="center">DATA PETUGAS</h3>
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
                <th style="text-align:center;">ID Petugas</th>
                <th style="text-align:center;">Nama Petugas</th>
                <th style="text-align:center;">Telepon</th>
                <th style="text-align:center;">Alamat</th>
                <th style="text-align:center;">Edit</th>
                <th style="text-align:center;">Delete</th>
              </tr>
            </thead>
          <tbody>
           <?php
              $query = "select * from petugas";
              $stid = oci_parse($conn, $query);
              oci_execute($stid);

              while ($row = oci_fetch_array($stid))
              {?>
                <tr>
                <td><?php echo $row['ID_PETUGAS'];?></td>
                <td><?php echo $row['NAMA_PETUGAS'];?></td>
                <td><?php echo $row['TELEPON_PETUGAS'];?></td>
                <td><?php echo $row['ALAMAT_PETUGAS'];?></td>
                
                <td>
                  <div>
                    <form method="POST" action="update-petugas.php">
                      <center>
                        <button type="submit" class="btn btn-primary">Edit</button>
                        <input type="hidden" name="update_petugas" value="<?php echo $row['ID_PETUGAS'];?>"> </input>
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

          <div class="pull-right">
            <br>
            <a href="tambah-petugas.php">  <button class="btn">TAMBAH BARU</button> </a>
          </div>

         
       </div>
        <div>
           <?php
              if( isset($_GET['del_petugas']))
              {
                $idpetugas = $_GET['del_petugas'];
                echo '
                   <form method="POST" action="delete-petugas.php">
                    <div class="controls" style="display:none;">
                      <input class="form-control" type="text" name="id_petugas" value="'.$idpetugas.'">
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
<?php include("template/footer.php");?>3