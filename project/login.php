<?php include("template/header.php");?>
<?php include("template/navbar.php");?>


<div class="container">
  <form class="form-signin" action="ceklogin.php" method="POST">
    <h2 class="form-signin-heading">Please sign in</h2>
    <label for="inputEmail" class="sr-only">ID Petugas</label>
    <input type="text" id="inputEmail" class="form-control" placeholder="ID Petugas" name="ID" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="pass" required>
    <div class="checkbox">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  </form>
</div> <!-- /container -->

<style type="text/css">
.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>

<?php
   if(isset($_GET['status']) && $_GET['status']=="gagal"){
    echo "<div class='alert alert-dismissable alert-danger'>
    <button type='button' class='close' data-dismiss='alert'>&times;</button>
    <center><b>Password Salah!</b></center>
    </div>";
   } 
   else if(isset($_GET['status']) && $_GET['status']=="user_not_found"){
    echo "<div class='alert alert-dismissable alert-danger'>
    <button type='button' class='close' data-dismiss='alert'>&times;</button>
    <center><b>ID TIDAK TERDAFTAR!</b></center>
    </div>";
   } 
?>

<script type="text/javascript">
  function capLock(e){
    kc = e.keyCode?e.keyCode:e.which;
    sk = e.shiftKey?e.shiftKey:((kc == 16)?true:false);
    if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk))
    document.getElementById('divCaps').style.visibility = 'visible';
    else
    document.getElementById('divCaps').style.visibility = 'hidden';
  }

  function etrLogin(e) {
    var ev= (window.event) ? window.event: e;
    var key = (ev.keyCode) ? ev.keyCode : ev.which;
    
    if (key == 13)
      procLogin();
  }

  function procLogin() {
     
    document.getElementById('login_form').submit();
  }

</script>

<?php include("template/footer.php");?>