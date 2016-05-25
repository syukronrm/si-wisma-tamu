<?php session_start() ?>
<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<div class="container">
  <div class="row">
    <div class="col-md-3">
      <a href="admin-users.php" class="thumbnail">
        <h4>Users</h4>
      </a>
    </div>
    <div class="col-md-3">
      <a href="admin-jenis.php" class="thumbnail">
        <h4>Jenis</h4>
      </a>
   </div>
    <div class="col-md-3">
      <a href="admin-pesan.php" class="thumbnail">
        <h4>Pesanan</h4>
      </a>
    </div>
    <div class="col-md-3">
      <a href="admin-admin.php" class="thumbnail">
      	<h4>Admin</h4>        
      </a>
    </div>
  </div>
</div>

<?php include("template/footer.php");?>