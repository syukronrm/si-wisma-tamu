<?php include("template/header.php");?>
<?php include("template/navbar.php");?>

<div class="container">
  <div class="row" style="padding-top:20px;">
    <div class="panel panel-default" style="background-color:#eee">
      <div class="panel-body">
        <table class="table table-hover table-bordered table-striped">
          <thead>
            <tr>
              <th style="text-align:center;">Wisma</th>
              <th style="text-align:center;">Pendapatan Total</th>
            </tr>
          </thead>
          <tbody>
            <?php
            include 'coba.php';
            $query = "select temp2.nama_wisma, sum(bayar) as pendapatan
            from transaksi_sewakamar tr,
            (
              select m.id_transaksi, temp.nama_wisma
              from menyewa m,
                (
                select k.id_kamar, w.nama_wisma
                from kamar k,
                  (
                    select nama_wisma, id_wisma
                    from wisma
                  ) w
                where k.id_wisma=w.id_wisma
                ) temp
              where m.id_kamar in temp.id_kamar
            ) temp2
            where temp2.id_transaksi=tr.id_transaksi
            group by temp2.nama_wisma";
            $stid = oci_parse($conn, $query);
            oci_execute($stid);

            while ($row = oci_fetch_array($stid))
            {?>
              <tr>
                <td><?php echo $row['NAMA_WISMA'];?></td>
                <td><?php echo $row['PENDAPATAN'];?></td>
              </tr>
            <?php
            }
            ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>


<?php include("template/footer.php");?>
