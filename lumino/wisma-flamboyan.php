<?php
  include 'connect.php';
  session_start();
?>

<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<link rel="stylesheet" type="text/css" href="css/datepicker1.css">
<script type="text/javascript" src="js/bootstrap-datepicker1.js"></script>

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
          <h3 align="center">WISMA TAMU FLAMBOYAN</h3>
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

            function cekStatus($conn, $id_kamar, $tgl_checkin, $tgl_checkout)
            {
              $query_cekStatus = "select count(*) as count
                                  from transaksi_sewakamar tr,
                                    ( select *
                                    from menyewa
                                    where id_kamar='$id_kamar') m
                                  where m.id_transaksi = tr.id_transaksi
                                  and (
                                    (
                                      tgl_checkin <= to_date('$tgl_checkin','dd-mm-yyyy')
                                      and
                                      tgl_checkout > to_date('$tgl_checkin','dd-mm-yyyy')
                                    )
                                    or
                                    (
                                      tgl_checkin < to_date('$tgl_checkout', 'dd-mm-yyyy')
                                      and
                                      tgl_checkout >= to_date('$tgl_checkout', 'dd-mm-yyyy')
                                    )
                                    or
                                    (
                                      tgl_checkin >= to_date('$tgl_checkin', 'dd-mm-yyyy')
                                      and
                                      tgl_checkout <= to_date('$tgl_checkout', 'dd-mm-yyyy')
                                    )
                                  )";
              $query_cekStatus_parse = oci_parse($conn, $query_cekStatus);
              oci_execute($query_cekStatus_parse);
              $row = oci_fetch_array($query_cekStatus_parse);
              if ($row['COUNT'] != '0')
                return 1; // sudah dipesan
              else
                return 0; // kosong

            }

            if (isset($_POST['date-check-in']) and isset($_POST['date-check-out']))
            {
              $_SESSION['date-check-in'] = $_POST['date-check-in'];
              $_SESSION['date-check-out'] = $_POST['date-check-out'];
              $tgl_checkin = $_SESSION['date-check-in'];
              $tgl_checkout = $_SESSION['date-check-out'];
              $_SESSION['flag-pick-date'] = true;
            }
          ?>

          <?php
          if (!isset($_SESSION['flag-pick-date']))
          {?>

            <!-- Input tanggal check-in check-out -->
            <form class="form-horizontal" role="form" action="<?php $_PHP_SELF ?>" method="POST">
            <div class="form-group">
              <label class="control-label col-sm-2" for="date-check-in"> Check in : </label>
              <div class="col-sm-10">
                <input type="text" class="span2 form-control" value id="date-check-in" name="date-check-in" data-date-format="dd-mm-yyyy" required>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="date-check-out"> Check out : </label>
              <div class="col-sm-10">
                <input type="text" class="span2 form-control" value id="date-check-out" name="date-check-out" data-date-format="dd-mm-yyyy" required>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Submit</button>
              </div>
            </div>
          </form>
          <!-- Input tanggal check-in check-out -->
          <?php
          }
          else
          {
            ?>
            <table class="table table-hover table-bordered table-striped" data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true">
              <thead>
                <tr>
                  <th style="text-align:center;">ID Kamar</th>
                  <th style="text-align:center;">Jenis Kamar</th>
                  <th style="text-align:center;">Pilih</th>
                  <th style="text-align:center;">Edit</th>
                  <th style="text-align:center;">Delete</th>
                </tr>
              </thead>
            <tbody>
             <?php
                $query = "select kamar.id_kamar, jenis_kamar.nama_jenis, kamar.status_kamar
                          from kamar , wisma, jenis_kamar
                          where kamar.id_wisma=wisma.id_wisma
                          and kamar.id_jenis= jenis_kamar.id_jenis
                          and wisma.nama_wisma='Flamboyan'
                          order by kamar.id_kamar";
                $stid = oci_parse($conn, $query);
                oci_execute($stid);

                while ($row = oci_fetch_array($stid))
                {?>
                  <tr>
                  <td><?php echo $row['ID_KAMAR'];?></td>
                  <td><?php echo $row['NAMA_JENIS'];?></td>

                  <td>
                    <div>
                      <form method="POST" action="wisma-pilih.php">
                        <?php
                        if (cekStatus($conn, $row['ID_KAMAR'], $tgl_checkin, $tgl_checkout) ==  1)
                          $tombol = "btn btn-primary disabled";
                        else
                          $tombol = "btn btn-primary";
                        echo '
                        <center>
                          <button type="submit" class="'.$tombol.'" name="id_kamar" value="'.$row['ID_KAMAR'].'">Pilih</button>
                        </center>
                        ';
                        ?>
                      </form>
                    </div>
                  </td>
                    <td>
                    <div>
                      <form method="POST" action="wisma-update.php">
                        <center>
                          <button type="submit" class="btn btn-primary">Edit</button>
                          <input type="hidden" name="id_kam" value="<?php echo $row['ID_KAMAR'];?>"> </input>
                        </center>
                      </form>
                    </div>
                  </td>
                  <td>
                    <div>
                      <form method="GET" action="<?php $_PHP_SELF ?>">
                        <center>
                          <button type='submit' class="btn btn-primary" name='del_kam' value="<?php echo $row['ID_KAMAR'];?>">Delete</button>
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

          <?php
            unset($_SESSION['flag-pick-date']);
          }
          ?>

            <div>
             <?php
                if( isset($_GET['del_kam']))
                {
                  $idkam = $_GET['del_kam'];
                  echo '
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
                  ';
                }
             ?>
           </div>
         </div>
       </div>
       </div>
     </div>
  

</div>  <!--/.main-->


  <!-- datepicker -->

  <script type="text/javascript">
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    var checkin = $('#date-check-in').datepicker({
      onRender: function(date) {
        return date.valueOf() < now.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      if (ev.date.valueOf() > checkout.date.valueOf()) {
        var newDate = new Date(ev.date)
        newDate.setDate(newDate.getDate() + 1);
        checkout.setValue(newDate);
      }
      checkin.hide();
      $('#date-check-out')[0].focus();
    }).data('datepicker');
    var checkout = $('#date-check-out').datepicker({
      onRender: function(date) {
        return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      checkout.hide();
    }).data('datepicker');
  </script>
  <!-- datepicker -->

  <style type="text/css">
    .form-horizontal {
      max-width: 700px;
      padding: 15px;
      margin: 0 auto;
    }
  </style>

<?php include("template/footer.php");?>