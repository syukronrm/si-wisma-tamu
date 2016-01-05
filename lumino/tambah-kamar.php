
<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  include 'connect.php';        

  if (isset($_POST['nama_jenis'])
      and isset($_POST['harga'])
       and strcmp($_POST['nama_jenis'], "")!=0)
  {
    $nama = $_POST['nama_jenis'];
    $harga = $_POST['harga'];

     $query = "insert into JENIS_KAMAR
              values ('JK'||to_char(fasilitas_seq.nextval,'FM000') ,
              '$nama',
              '$harga')";
    $query_parse = oci_parse($conn, $query);
    oci_execute($query_parse);
    ?>
      <script type="text/javascript">
      window.location = "data-jenis-kamar.php";
      </script> 
    <?php
  }
  if(isset($_POST['batal'])){
      ?>
      <script type="text/javascript">
      window.location = "data-jenis-kamar.php";
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
                  <label class="control-label">NAMA JENIS</label>
                  <div class="controls">
                    <input class="form-control" type="text" name="nama_jenis" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label">HARGA </label>
                  <div class="controls">
                    <input class="form-control" type="text" name="harga">
                  </div>
                </div>
                
                <table style="width:15%">
                  <tr>
                    <td> <button name="simpan"  value="simpan" class="btn btn-success" >Simpan</button> </td>
                    <td><button name="batal"  value="batal" class="btn btn-success" >Batal</button> </td>
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