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
        <h3 align="center">DATA FASILITAS KAMAR</h3>
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
                <th style="text-align:center;">ID Log</th>
                <th style="text-align:center;">ID Transaksi</th>
                <th style="text-align:center;">Tanggal Transaksi</th>
                <th style="text-align:center;">Operasi</th>
              </tr>
            </thead>
          <tbody>
           <?php
              $query = "select log.id_log, log.id_transaksi, log.tgl_transaksi, log.operasi
                        from log_transaksi log";
              $stid = oci_parse($conn, $query);
              oci_execute($stid);

              while ($row = oci_fetch_array($stid))
              {?>
                <tr>
                <td><?php echo $row['ID_LOG'];?></td>
                <td><?php echo $row['ID_TRANSAKSI'];?></td>
                <td><?php echo $row['TGL_TRANSAKSI'];?></td>
                <td><?php echo $row['OPERASI'];?></td>
              <?php
              }
              ?>
              </tbody>
          </table>
       </div>
     </div>
   </div>
</div>
</div>
<?php include("template/footer.php");?>
