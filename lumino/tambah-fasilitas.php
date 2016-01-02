
<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<?php
  include 'connect.php';        

  if (isset($_POST['nama_fasilitas'])
      and isset($_POST['harga'])
      and isset($_POST['jenis']))
  {
    $nama = $_POST['nama_fasilitas'];
    $harga = $_POST['harga'];
    $jenis = $_POST['jenis'];  

     $query = "insert into FASILITAS
              values ('FA'||to_char(fasilitas_seq.nextval,'FM000') ,
              '$jenis',
              '$nama',
              '$harga')";
    $query_parse = oci_parse($conn, $query);
    oci_execute($query_parse);
    ?>
      <script type="text/javascript">
      window.location = "data-fasilitas.php";
      </script> 
    <?php
  }
  if(isset($_POST['batal'])){
      ?>
      <script type="text/javascript">
      window.location = "data-fasilitas.php";
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
                  <label class="control-label">NAMA FASILITAS</label>
                  <div class="controls">
                    <input class="form-control" type="text" name="nama_fasilitas" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label">HARGA </label>
                  <div class="controls">
                    <input class="form-control" type="text" name="harga">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label">JENIS</label>
                  <div class="controls">
                    <select name="jenis" style="btn-info;height:30px">
                      <?php 
                      $query1 = "select distinct jk.*, w.nama_wisma
                                from jenis_kamar jk, kamar k, wisma w
                                where jk.id_jenis=k.id_jenis and k.id_wisma=w.id_wisma
                                order by w.nama_wisma";

                      $stid1 = oci_parse($conn, $query1);
                      oci_execute($stid1);
                      //echo $query1;
                      while ($row1 = oci_fetch_array($stid1)){
                      ?>
                        <option value="<?php echo $row1['ID_JENIS'];?>"><?php echo $row1['NAMA_JENIS'];?> - <?php echo $row1['NAMA_WISMA'];?></option>
                      <?php 
                      }
                      ?>
                    </select>
                    <!--           <input class="form-control" type="text" name="nama_jenis" value="'.$namajenis.'"> -->
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