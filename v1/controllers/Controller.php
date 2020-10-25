<?php
	/**
	 * 
	 */
	class Controller
	{
		public $conn;
		private $name;
		private $version;
		public function __construct($conn)
		{
			$this->conn = $conn ;
			$this->app_name = "Fluk Inc" ;
			$this->app_version = 1.0 ;
		}
		public function name()
		{
			return $this->app_name;
		}
		public function version()
		{
			return $this->app_version;
		}
		public function structure()
		{
			$output = array(
		        'authorizations_url' => '/v1/authorize/{:token}', 
		        'current_user_url' => '/v1/user', 
		        'emails_url' => '/v1/user/emails', 
		        'group_url' => '/v1/group/{:id}', 
		        'groups_url' => '/v1/groups', 
		        'group_members_url' => '/v1/group/members/{:id}', 
		        'issues_url' => '/v1/dispute/{:userid}', 
		        'login_url' => '/v1/login/{:data}', 
		        'notifications_url' => '/v1/notification/{:userID}', 
		        'search_user_url' => '/v1/user/{:username}', 
		        'setting_url' => '/v1/setting/{:userid}', 
		        'signup_url' => '/v1/signup/{:data}', 
		        'status_setting_url' => '/v1/status/setting/{:userID}', 
		        'status_url' => '/v1/status/{:userid}', 
		        'users_url' => '/v1/users',
		    );
		    echo json_encode($output, true);
		}
		public function jsonheader()
		{
			return header("Content-type: application/json");
		}
		public function setSession($name = '', $value = '')
		{
			$_SESSION[$name] = $value;
		}
		public function updateSession($name = '', $value = '')
		{
			$_SESSION[$name] = $value;
		}
		public function getSession($name = '')
		{
			return (!isset($_SESSION[$name])) ? NULL : $_SESSION[$name] ;
		}
		public static function cleanurl($str = '')
		{
			list($i, $e) = explode(".", $str);
			return $i;
		}
		public function apierror($status = '', $msg = '')
		{
			return json_encode(array(
				'message' => $msg, 
				'status' => $status, 
				'documentation_url' => DOC_URL
			), true);
		}
		public function killallsession($name = '')
		{
			unset($_SESSION[$name]);
			session_destroy();
			session_unset();
			return 200;
		}
		public function time_elapsed_string($datetime, $full = false)
	    {
			$now = new DateTime;
			$ago = new DateTime($datetime);
			$diff = $now->diff($ago);

			$diff->w = floor($diff->d / 7);
			$diff->d -= $diff->w * 7;

			$string = array(
				'y' => '/v1year',
				'm' => '/v1month',
				'w' => '/v1week',
				'd' => '/v1day',
				'h' => '/v1hour',
				'i' => '/v1min',
				's' => '/v1sec',
			);
			foreach ($string as $k => &$v) {
				if ($diff->$k) {
					$v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
				} else {
					unset($string[$k]);
				}
			}

			if (!$full) $string = array_slice($string, 0, 1);
			return $string ? implode(', ', $string) . ' ago' : 'Just now';
	    }
	}