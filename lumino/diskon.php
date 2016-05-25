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
            if(isset($_GET['diskon']) && $_GET['diskon']=="ok")
            {
              echo "<h3> Diskon berhasil diupdate </h3>";
            }
            if(isset($_GET['diskon']) && $_GET['diskon']=="reset")
            {
              echo "<h3> Diskon berhasil direset </h3>";
            }
          ?>
          <form class="form-horizontal" role="form" action="diskon-check.php" method="POST">
            <div class="form-group">
              <label class="control-label col-sm-2" for="nama">Diskon :</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="diskon" placeholder="Jumlah diskon persentase">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Submit</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="row" style="padding-top:20px;">
    <div class="col-lg-12">
      <div class="panel panel-default" >
        <div class="panel-body">
          <form class="form-horizontal" role="form" action="diskon-reset.php" method="POST">
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Reset Diskon</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<?php include("template/footer.php");?>3