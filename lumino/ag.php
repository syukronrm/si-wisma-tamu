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
        <h3 align="center">DATA TAMU</h3>

          <table class="table table-hover table-bordered table-striped">
            <thead>
              <tr>
                <th style="text-align:center;">ID TAMU</th>
                <th style="text-align:center;">Nama TAMU</th>
                <th style="text-align:center;">Telepon</th>
                <th style="text-align:center;">Alamat</th>
                <th style="text-align:center;">Tgl Lahir</th>
                <th style="text-align:center;">Jumlah</th>

              </tr>
            </thead>
          <tbody>
           <?php
              $query = "select t.*, n.jumlah
                      from (
                        select t.id_tamu, count(t.nama_tamu) as jumlah
                        from tamu t, transaksi_sewakamar ts
                        where t.id_tamu=ts.id_tamu
                        group by t.id_tamu) n, tamu t
                      where t.id_tamu=n.id_tamu and jumlah>=4";
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
                <td><?php echo $row['JUMLAH'];?></td>

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
<?php include("template/footer.php");?>3