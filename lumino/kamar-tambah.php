
<?php
  include 'connect.php';        

  if (isset($_POST['jenis_kamar'])
      and isset($_POST['wisma']))
  {
    $jenis = $_POST['jenis_kamar'];
    $wisma = $_POST['wisma'];

     $query = "insert into kamar
              values ('KM'||to_char(kamar_seq.nextval,'FM000') ,
              '$jenis',
              '$wisma')";
    $query_parse = oci_parse($conn, $query);
    oci_execute($query_parse);
    echo $query;
    ?>
      <script type="text/javascript">
      window.location = "data-kamar.php";
      </script> 
    <?php
  }
  if(isset($_POST['batal'])){
      ?>
      <script type="text/javascript">
      window.location = "data-kamar.php";
      </script> 
      <?php
  }

?>