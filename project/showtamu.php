<?php
include "coba.php";
//include "navbar.php";
$sql = "SELECT * from PETUGAS";
//$rooms= $conn->query($sql)->oci_fetch_all();
//$sql1 = $conn->prepare("select * from KAMAR");
$conn = oci_connect("FP", "FP", "//localhost/XE");

?>

<html>
	<head>
		
	</head>
	<body>
		<table>
			<thead>
				<tr>
					
				</tr>
			</thead>
			<tbody>
				<?php
					$stid = oci_parse($conn, $sql);
					oci_execute($stid);
				//	$row=oci_num_rows($stid);
				//	echo $row."<br>";
					//$sql1->execute();
					while ($res = oci_fetch_array($stid)){
						echo "<label>".$res['ID_PETUGAS']."</label><br>";			
					}

				?>
			</tbody>
		</table>

	</body>
</html>