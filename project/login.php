<!doctype html>

<html>
  
  <head>
    <title>.:INFORMASI WISMA TAMU:.</title>
    <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="aset/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
      body {
        padding-top: 20px;
      }
      .footer {
        border-top: 1px solid #eee;
        margin-top: 40px;
        padding-top: 40px;
        padding-bottom: 40px;
      }
      /* Main marketing message and sign up button */
      .jumbotron {
        text-align: center;
        background-color: transparent;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 10px 20px;
      }
      /* Customize the nav-justified links to be fill the entire space of the .navbar */
      .nav-justified {
        background-color: #eee;
        border-radius: 5px;
        border: 1px solid #ccc;
      }
      .nav-justified > li > a {
        padding-top: 15px;
        padding-bottom: 15px;
        color: #777;
        font-weight: bold;
        text-align: center;
        border-bottom: 1px solid #d5d5d5;
        background-color: #e5e5e5;
        /* Old browsers */
        background-repeat: repeat-x;
        /* Repeat the gradient */
        background-image: -moz-linear-gradient(top, #f5f5f5 0%, #e5e5e5 100%);
        /* FF3.6+ */
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #e5e5e5));
        /* Chrome,Safari4+ */
        background-image: -webkit-linear-gradient(top, #f5f5f5 0%, #e5e5e5 100%);
        /* Chrome 10+,Safari 5.1+ */
        background-image: -ms-linear-gradient(top, #f5f5f5 0%, #e5e5e5 100%);
        /* IE10+ */
        background-image: -o-linear-gradient(top, #f5f5f5 0%, #e5e5e5 100%);
        /* Opera 11.10+ */
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5f5f5', endColorstr='#e5e5e5', GradientType=0);
        /* IE6-9 */
        background-image: linear-gradient(top, #f5f5f5 0%, #e5e5e5 100%);
        /* W3C */
      }
      .nav-justified > .active > a, .nav-justified > .active > a:hover, .nav-justified > .active > a:focus {
        background-color: #ddd;
        background-image: none;
        box-shadow: inset 0 3px 7px rgba(0, 0, 0, .15);
      }
      .nav-justified > li:first-child > a {
        border-radius: 5px 5px 0 0;
      }
      .nav-justified > li:last-child > a {
        border-bottom: 0;
        border-radius: 0 0 5px 5px;
      }
      @media(min-width: 768px) {
        .nav-justified {
          max-height: 52px;
        }
        .nav-justified > li > a {
          border-left: 1px solid #fff;
          border-right: 1px solid #d5d5d5;
        }
        .nav-justified > li:first-child > a {
          border-left: 0;
          border-radius: 5px 0 0 5px;
        }
        .nav-justified > li:last-child > a {
          border-radius: 0 5px 5px 0;
          border-right: 0;
        }
      }
      /* Responsive: Portrait tablets and up */
      @media screen and(min-width: 768px) {
        /* Remove the padding we set earlier */
        .masthead, .marketing, .footer {
          padding-left: 0;
          padding-right: 0;
        }
      }
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