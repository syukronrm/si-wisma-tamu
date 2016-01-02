
<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  include 'connect.php';
  if (isset($_POST['nama_petugas'])
      and isset($_POST['no_hp_petugas'])
      and isset($_POST['alamat_petugas']))
  {
    $nama = $_POST['nama_petugas'];
    $no_hp = $_POST['no_hp_petugas'];
    $alamat = $_POST['alamat_petugas'];

     $query = "insert into petugas
              values ('PE'||to_char(petugas_seq.nextval,'FM000') ,
              '$nama',
              '$alamat',
              '$no_hp')";
    $query_parse = oci_parse($conn, $query);
    oci_execute($query_parse);
    ?>
      <script type="text/javascript">
      window.location = "data-petugas.php";
      </script> 
    <?php
    //header("Location:data-petugas.php?status=sukses"); 
  }
  if(isset($_POST['batal'])){
      ?>
      <script type="text/javascript">
      window.location = "data-petugas.php";
      </script> 
      <?php
  }
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

          <div class="panel panel-default">
            <div class="panel-body">
              <form method="POST" action="<?php $_PHP_SELF ?>">
                <div class="form-group">
                  <label class="control-label">NAMA PETUGAS</label>
                  <div class="controls">
                    <input class="form-control" type="text" name="nama_petugas" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label">NOMOR TELEPON</label>
                  <div class="controls">
                    <input class="form-control" type="text" name="no_hp_petugas">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label">ALAMAT </label>
                  <div class="controls">
                    <input class="form-control" type="text" name="alamat_petugas">
                  </div>
                </div>
                <table style="width:15%">
                  <tr>
                    <td> <button name="simpan"  value="simpan" class="btn btn-success" >Simpan</button> </td>
                    <td><a href="data-tamu.php"><button name="batal"  value="batal" class="btn btn-success" >Batal</button> </a>
                    </tr>

                  </table>

                </div>
              </form>
            </div>
          </div>';

          

          </div>
        </div>
      </div>
      <!-- Site footer -->
<?php include("template/footer.php");?>