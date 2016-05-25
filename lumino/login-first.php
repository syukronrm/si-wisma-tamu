<?php
	if(!isset($_SESSION['admin-login']))
	{
		header("Location: admin-login.php?status=login_first");
	}
?>