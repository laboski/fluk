<?php
	include_once 'config.php';
	$conn = mysqli_connect(DATABASE_HOST, DATABASE_USER, DATABASE_CODE);
	$res = (mysqli_select_db($conn, DATABASE_NAME)) ? "connected" : "disconnected" ;