<?php
	/**
	 * 
	 */
	class Authorize extends Database
	{
		public $conn;	
		public function __construct($conn)
		{
			$this->conn = $conn;
		}
		public function auth0($token = '')
		{
			$output = $this->select("SELECT * FROM fk_app WHERE app_token='$token'", true);
			return ($output !== "null") ? $output : $this->apierror(404, 'Requires authentication');
		}
	}