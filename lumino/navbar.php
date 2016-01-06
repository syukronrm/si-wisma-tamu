
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"><span>Wisma</span>Tamu</a>
        <ul class="user-menu">
          <li class="dropdown pull-right">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> User <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="login.php"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
              
    </div><!-- /.container-fluid -->
  </nav>
    
  <div id="sidebar-collapse" class="col-sm-1 col-lg-2 sidebar">
    <form role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
    </form>
    <ul class="nav menu">
      <li><a href="index.php"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Wisma Tamu</a></li>
      <li >
        <a data-toggle="collapse" href="#demo" class="dropdown" >
          <svg class="glyph stroked pencil"> <use xlink:href="#stroked-pencil"></use> </svg> 
          Reservasi
        </a>

        <div id="demo" class="collapse" style="padding-left:20px;">
          <ul class="nav menu">
          <li><a href="wisma-flamboyan.php"> 
            <svg class="glyph stroked chevron right"><use xlink:href="#stroked-chevron-right"/></svg>Wisma Flamboyan</a></li>
          <li><a href="wisma-bougenville.php">
            <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg>Wisma Bougenville</a></li>
          <li><a href="wisma-jasmine.php">
            <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg>Wisma Jasmine</a></li>
        </ul>
        </div>
        
      </li>
      <li class="parent">
        <a data-toggle="collapse" href="#sub1">
          <span >
            <svg class="glyph stroked chevron-down">
              <use xlink:href="#stroked-chevron-down"></use></svg></span> Data
        </a>
        <ul class="children collapse" id="sub1">
          <li>
            <a class="" href="data-transaksi.php">
              <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Data Transaksi</a>
          </li>
          <li>
            <a class="" href="data-wisma.php">
              <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Data Wisma</a>
          </li>
          <li>
            <a class="" href="data-kamar.php">
              <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Data Kamar</a>
          </li>
          <li>
            <a class="" href="data-jenis-kamar.php">
              <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Data Jenis Kamar</a>
          </li>
          <li>
            <a class="" href="data-fasilitas.php">
              <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Data Fasilitas Kamar</a>
          </li>
          <li>
            <a class="" href="data-tamu.php">
              <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Data Tamu</a>
          </li>
          <li>
            <a class="" href="data-petugas.php">
              <svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Data Petugas</a>
          </li>
        </ul>
      </li>

      <li role="presentation" class="divider"></li>
      <li><a href="ag1.php"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> ag 1</a></li>
      <li><a href="ag.php"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> ag 2</a></li>
    </ul>

  </div><!--/.sidebar-->