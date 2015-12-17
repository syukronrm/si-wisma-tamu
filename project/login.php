<!doctype html>

<html>
  
  <head>
    <title>.:INFORMASI WISMA TAMU:.</title>
    <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap.min.css">
         <link rel="stylesheet" type="text/css" href="cssku.css">
    <script type="text/javascript" src="aset/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
     
    </style>
  </head>
  
  <body style="background-image: url(back.jpg); background-attachment:fixed; " >
    <div class="container">
      <div class="masthead">
        <h1 style="text-align:right;color:white">
           <i><b>WISMA TAMU</b></i>
        </h1>
        <h3 style="text-align:right;color:white"> 
            <i><b>Institut Teknologi Sepuluh Nopember</b></i>
        </h3>
        <ul class="nav nav-justified">
          <li class="active">
            <a href="login.php">Admin Login</a>
          </li>
        </ul>
      </div>
      <div class="container">
        <div class="row" style="padding-top:50px;">
          <div class="col-md-4 col-md-offset-4">
              <div class="panel-body">
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
                <form class="form-signin" action="ceklogin.php" method="POST">
         <!--         <center>
                    <h3 class="form-signin-heading" style="color:white">Admin Login</h3><br>
                  </center> -->
                    <input type="text" class="form-control" placeholder="ID_Petugas" name="ID"><br>
                    <input type="password" class="form-control" placeholder="Password" name="pass" onkeypress="capLock(event)"><br>
                  <center><div id="divCaps"
                        style="visibility:hidden;margin-top:4px;color:red;font-weight:bold;">Caps Lock is on !
                    </div>
                    <br>
                  <button class="btn" type="submit">Sign in</button></center>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /container -->

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
  </body>



</html>