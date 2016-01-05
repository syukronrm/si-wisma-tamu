
<?php
  session_start();
  include 'connect.php';
  if (isset($_POST['bulan']))
  {
    $_SESSION['bulan'] = $_POST['bulan'];
  }
  $bulan = $_SESSION['bulan'];

?>


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
                <th style="text-align:center;">WISMA</th>
                <th style="text-align:center;">TOTAL</th>
              </tr>
            </thead>
          <tbody>
           <?php
           $query = "SELECT W.NAMA_WISMA, Y.TOTAL 
             FROM (
                  SELECT Z.WISMA AS WISMAA, COUNT(Z.WISMA) AS TOTAL 
                  FROM (
                    SELECT M.ID_TRANSAKSI, K.ID_WISMA AS WISMA,K.ID_KAMAR, TS.TGL_CHECKIN 
                    FROM KAMAR K, MENYEWA M, TRANSAKSI_SEWAKAMAR TS 
                    WHERE K.ID_KAMAR=M.ID_KAMAR AND TS.ID_TRANSAKSI=M.ID_TRANSAKSI AND extract(month from ts.tgl_transaksi)='$bulan') Z 
                  GROUP BY Z.WISMA) Y, WISMA W 
              WHERE W.ID_WISMA=Y.WISMAA AND Y.TOTAL>5";
              $stid = oci_parse($conn, $query);
              oci_execute($stid);
            //  echo $query;
              while ($row = oci_fetch_array($stid))
              {?>
                <tr>
                <td><?php echo $row['NAMA_WISMA'];?></td>
                <td><?php echo $row['TOTAL'];?></td>
                

                
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