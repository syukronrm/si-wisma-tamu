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
               <th style="text-align:center;">ID Tamu</th>
                <th style="text-align:center;">Nama Tamu</th>
                <th style="text-align:center;">Telepon</th>
                <th style="text-align:center;">Alamat</th>
                <th style="text-align:center;">Tanggal Lahir</th>
                <th style="text-align:center;">Nama Petugas</th>

              </tr>
            </thead>
          <tbody>
           <?php
              $query = "select distinct t.*, z.nama_petugas
                    from (
                      select ts.id_tamu,d.jumlah, p.nama_petugas
                      from (
                        select p.id_petugas, count(id_tamu) as jumlah
                        from petugas p, transaksi_sewakamar ts
                        where p.id_petugas=ts.id_petugas
                        group by p.id_petugas) d, transaksi_sewakamar ts, petugas p
                      where d.id_petugas=ts.id_petugas and p.id_petugas= ts.id_petugas and d.id_petugas= p.id_petugas
                      order by ts.id_transaksi) z, tamu t
                    where t.id_tamu=z.id_tamu and jumlah>8";
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
                <td><?php echo $row['NAMA_PETUGAS'];?></td>

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