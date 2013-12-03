<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Users
 *
 * This model represents user authentication data. It operates the following tables:
 * - user account data,
 * - user profiles
 *
 * @package	Tank_auth
 * @author	Ilya Konyukhov (http://konyukhov.com/soft/)
 */
class Users extends CI_Model
{
	private $table_name			= 'users';			// user accounts
	private $profile_table_name	= 'user_profiles';	// user profiles

	function __construct()
	{
		parent::__construct();

		$ci =& get_instance();
		$this->table_name			= $ci->config->item('db_table_prefix', 'tank_auth').$this->table_name;
		$this->profile_table_name	= $ci->config->item('db_table_prefix', 'tank_auth').$this->profile_table_name;
	}

	/**
	* Function that check user role from email, return id if it's admin
	*
	* @param string
	* @return int
	*/

	function __is_admin($email)
	{
		$query = $this->db->select('id')
						  ->where('LOWER(email)', strtolower($email))
						  ->where('role', 'admin')
						  ->get($this->table_name);
		if ($query->num_rows == 1)
		{
			$data = $query->row_array();
			print_r($data['id']);
			//die(); 
			return $data['id'];
		}
		return NULL;
	}

	/** 
	* Function return number of all profiles
	*
	* @return int
	*/
	function get_nmbr_all()
	{
		$select = $this->db->get($this->table_name);
		return $select->num_rows();
	}

	/** 
	* Function return number of all profiles
	*
	* @param int
	* @return int
	*/
	function get_nmbr_activated($activated)
	{
			$select = $this->db->where('activated', $activated)
							   ->get($this->table_name);
			return $select->num_rows();
	}



	/**
	* Upload profile photo
	*
	*
	* @return boolean
	*/

	function update_photo($user_id, $filename, $thumb){
		$query = $this->db->select('photo, thumb')
						  ->where('user_id', $user_id)
						  ->get($this->profile_table_name);
		if ($query->num_rows == 1) 
		{
			$old_data = $query->row_array(); 
			if ($old_data['thumb'] != 'default-thumb.png' && $old_data['photo'] != 'default.png') 
			{
				unlink('uploads/images/'.$old_data['thumb']);
				unlink('uploads/images/'.$old_data['photo']);
			}
			$this->db->where('user_id', $user_id);
			$arr = array(
				'photo'=> $filename,
				'thumb' => $thumb
			);
			$this->db->update($this->profile_table_name, $arr);
			return TRUE;
		}
		return FALSE;
	}

	function is_auto_profile($id)
	{
		/*$this->db->where('id =', $id)
				 ->where('activated =', '2');
				 ->or_where('username =', 'auto');

		$query = $this->db->get($this->table_name);
		*/
		$query = $this->db->query("SELECT users.id 
								   FROM users 
								   WHERE (users.id = $id AND (users.username='auto' OR users.activated='2'))");

		if ($query->num_rows() == 1) return TRUE;
		return FALSE;
	}
	

	function get_inactive_users($from = 0, $count = 0)
	{
		$query = $this->db->query( "SELECT users.id as user_id, user_profiles.first_name, users.username, user_profiles.last_name, user_profiles.club, user_profiles.gender, user_profiles.birth_date, users.email 
									FROM users, user_profiles 
									WHERE users.activated = 0 AND users.id = user_profiles.user_id
									ORDER BY user_profiles.last_name
									LIMIT $from,$count");
		if ($query->num_rows > 0) return $query->result_array();
	}

	function __get_all_users($from = 0, $count = 0)
	{
		$query = $this->db->query( "SELECT users.id as user_id, 
									user_profiles.first_name, user_profiles.thumb, user_profiles.photo, user_profiles.last_name, user_profiles.club, user_profiles.gender, user_profiles.birth_date, users.email, users.activated, 
									users.created
									FROM users, user_profiles 
									WHERE users.id = user_profiles.user_id /*AND users.role!='admin'*/
									ORDER BY LOWER(user_profiles.last_name)  /*, users.activated*/
									LIMIT $from,$count");
		if ($query->num_rows() > 0) return $query->result_array();
		return NULL;
	}

	/**
	* Function return all profiles, activated, inactivated, auto-created
	*
	* @param int
	* @param int  
	* @return array
	*/
	function get_autocreated_profiles($from = 0, $count = 0)
	{

		$query = $this->db->query( "SELECT users.id as user_id, user_profiles.first_name, user_profiles.last_name, user_profiles.club, user_profiles.gender, user_profiles.birth_date  
									FROM users, user_profiles 
									WHERE users.activated = 2 AND users.id = user_profiles.user_id
									ORDER BY user_profiles.last_name
									LIMIT $from,$count");
		if ($query->num_rows > 0) return $query->result_array();

	}

	/** 
	* Check if player with first name and last name from parameters exists in db
	*
	* @param string
	* @param string
	* @return int
	*/
	function __exists_profile($first_name, $last_name)
	{
		$query = $this->db->query("SELECT users.id as user_id FROM users, user_profiles WHERE users.id = user_profiles.user_id AND LOWER(user_profiles.first_name) = '".strtolower($first_name)."' AND LOWER(user_profiles.last_name) = '".strtolower($last_name)."'");
		if ($query->num_rows == 1)
		{
			$data = $query->row_array();
			return $data['user_id'];
		}
		return NULL;
	}

	/** 
	* Activate player
	*
	* @param int
	* @param string
	* @return boolean
	*/

	function __activate_player($id)
	{
		$where = array ('id' => $id);
		$data = array ('activated' => '1', 'username' => '');

		$this->db->	where($where)
				 ->update($this->table_name, $data);
				 
		if ($this->db->affected_rows()==1){
			return true;
		}
		return false;

	}

	function __create_auto_profile($first_name, $last_name, $gender, $club, $birth_date)
	{
		$data = array ('activated' => 2,
						'created' => Date("Y-m-d H:i:s"),
						'username' => 'auto');


		$query = $this->db->insert($this->table_name, $data);
		
		$data_profile = array ('first_name'=> $first_name,
							   'last_name' => $last_name,
							   'gender' => $gender,
							   'club' => $club,
							   'birth_date' => $birth_date,
							   'user_id' => $this->db->insert_id()
		 					  );
		$query = $this->db->insert($this->profile_table_name, $data_profile);
		$select = $this->db->select('user_id')
						   ->where('id', $this->db->insert_id())
						   ->get($this->profile_table_name);
		$data = $select->row_array();
		print_r($data['user_id']);
		die();
		return $data['user_id'];
	}

	/**
	 * Get user record by Id
	 *
	 * @param	int
	 * @param	bool
	 * @return	object
	 */

	function get_user_by_id($user_id, $activated)
	{
		$this->db->where('id', $user_id);
		if ($activated === 2) {
			$this->db->where('activated','2');	
		} else {
			$this->db->where('activated', $activated ? 1 : 0);
		}

		$query = $this->db->get($this->table_name);
		if ($query->num_rows() == 1) return $query->row();
		return NULL;
	}

	/**
	 * Get user profile record by Id
	 *
	 * @param	int
	 * @return	array
	 */
	function get_user_profile($user_id)
	{
		$this->db->where('user_id', $user_id);

		$query = $this->db->get($this->profile_table_name);
		if ($query->num_rows() == 1) return $query->row_array();
		return NULL;
	}

	/**
	 * Get user record by login (username or email)
	 *
	 * @param	string
	 * @return	object
	 */
	function get_user_by_login($login)
	{
		$this->db->where('LOWER(username)=', strtolower($login));
		$this->db->or_where('LOWER(email)=', strtolower($login));

		$query = $this->db->get($this->table_name);
		if ($query->num_rows() == 1) return $query->row();
		return NULL;
	}

	/**
	 * Get user record by username
	 *
	 * @param	string
	 * @return	object
	 */
	function get_user_by_username($username)
	{
		$this->db->where('LOWER(username)=', strtolower($username));

		$query = $this->db->get($this->table_name);
		if ($query->num_rows() == 1) return $query->row();
		return NULL;
	}

	/**
	 * Get user record by email
	 *
	 * @param	string
	 * @return	object
	 */
	function get_user_by_email($email)
	{
		$this->db->where('LOWER(email)=', strtolower($email));

		$query = $this->db->get($this->table_name);
		if ($query->num_rows() == 1) return $query->row();
		return NULL;
	}

	/**
	 * Check if username available for registering
	 *
	 * @param	string
	 * @return	bool
	 */
	function is_username_available($username)
	{
		$this->db->select('1', FALSE);
		$this->db->where('LOWER(username)=', strtolower($username));

		$query = $this->db->get($this->table_name);
		return $query->num_rows() == 0;
	}

	/**
	 * Check if email available for registering
	 *
	 * @param	string
	 * @return	bool
	 */
	function is_email_available($email)
	{
		$this->db->select('1', FALSE);
		$this->db->where('LOWER(email)=', strtolower($email));
		$this->db->or_where('LOWER(new_email)=', strtolower($email));

		$query = $this->db->get($this->table_name);
		return $query->num_rows() == 0;
	}

	/**
	 * Create new user record
	 *
	 * @param	array
	 * @param	bool
	 * @return	array
	 */
	function create_user($data, $activated = TRUE)
	{
		$data['created'] = date('Y-m-d H:i:s');
		//$data['activated'] = $activated ? 1 : 0;
		$admin_activation = $this->config->item('activate_by_admin', 'tank_auth');
		$data['activated'] = $admin_activation ? 0 : 1;
		
		if ($this->db->insert($this->table_name, $data)) {
			$user_id = $this->db->insert_id();
			if ($activated)	$this->create_profile($user_id);
			return array('user_id' => $user_id);
		}
		return NULL;
	}

	/**
	 * Activate user if activation key is valid.
	 * Can be called for not activated users only.
	 *
	 * @param	int
	 * @param	string
	 * @param	bool
	 * @return	bool
	 */
	function activate_user($user_id, $activation_key, $activate_by_email)
	{
		$this->db->select('1', FALSE);
		$this->db->where('id', $user_id);
		if ($activate_by_email) {
			$this->db->where('new_email_key', $activation_key);
		} else {
			$this->db->where('new_password_key', $activation_key);
		}
		$this->db->where('activated', 0);
		$query = $this->db->get($this->table_name);

		if ($query->num_rows() == 1) {

			$this->db->set('activated', 1);
			$this->db->set('new_email_key', NULL);
			$this->db->where('id', $user_id);
			$this->db->update($this->table_name);

			$this->create_profile($user_id);
			return TRUE;
		}
		return FALSE;
	}

	/**
	 * Purge table of non-activated users
	 *
	 * @param	int
	 * @return	void
	 */
	function purge_na($expire_period = 172800)
	{
		$this->db->where('activated', 0);
		$this->db->where('UNIX_TIMESTAMP(created) <', time() - $expire_period);
		$this->db->delete($this->table_name);
	}

	/**
	 * Delete user record
	 *
	 * @param	int
	 * @return	bool
	 */
	function __delete_user($user_id)
	{
		if ($this->__delete_profile($user_id))
		{
			$this->db->where('id', $user_id)
					 ->where('role !=', 'admin');
			$this->db->delete($this->table_name);
			if ($this->db->affected_rows() > 0) {
				return TRUE;
			}
		}
		return FALSE;
	}

	/**
	 * Set new password key for user.
	 * This key can be used for authentication when resetting user's password.
	 *
	 * @param	int
	 * @param	string
	 * @return	bool
	 */
	function set_password_key($user_id, $new_pass_key)
	{
		$this->db->set('new_password_key', $new_pass_key);
		$this->db->set('new_password_requested', date('Y-m-d H:i:s'));
		$this->db->where('id', $user_id);

		$this->db->update($this->table_name);
		return $this->db->affected_rows() > 0;
	}

	/**
	 * Check if given password key is valid and user is authenticated.
	 *
	 * @param	int
	 * @param	string
	 * @param	int
	 * @return	void
	 */
	function can_reset_password($user_id, $new_pass_key, $expire_period = 900)
	{
		$this->db->select('1', FALSE);
		$this->db->where('id', $user_id);
		$this->db->where('new_password_key', $new_pass_key);
		$this->db->where('UNIX_TIMESTAMP(new_password_requested) >', time() - $expire_period);

		$query = $this->db->get($this->table_name);
		return $query->num_rows() == 1;
	}

	/**
	 * Change user password if password key is valid and user is authenticated.
	 *
	 * @param	int
	 * @param	string
	 * @param	string
	 * @param	int
	 * @return	bool
	 */
	function reset_password($user_id, $new_pass, $new_pass_key, $expire_period = 900)
	{
		$this->db->set('password', $new_pass);
		$this->db->set('new_password_key', NULL);
		$this->db->set('new_password_requested', NULL);
		$this->db->where('id', $user_id);
		$this->db->where('new_password_key', $new_pass_key);
		$this->db->where('UNIX_TIMESTAMP(new_password_requested) >=', time() - $expire_period);

		$this->db->update($this->table_name);
		return $this->db->affected_rows() > 0;
	}

	/**
	 * Change user password
	 *
	 * @param	int
	 * @param	string
	 * @return	bool
	 */
	function change_password($user_id, $new_pass)
	{
		$this->db->set('password', $new_pass);
		$this->db->where('id', $user_id);

		$this->db->update($this->table_name);
		return $this->db->affected_rows() > 0;
	}

	/**
	 * Set new email for user (may be activated or not).
	 * The new email cannot be used for login or notification before it is activated.
	 *
	 * @param	int
	 * @param	string
	 * @param	string
	 * @param	bool
	 * @return	bool
	 */
	function set_new_email($user_id, $new_email, $new_email_key, $activated)
	{
		//$this->db->set($activated ? 'new_email' : 'email', $new_email);
		//$this->db->set('new_email_key', $new_email_key);
		$this->db->set('email', $new_email);
		$this->db->where('id', $user_id);
		$this->db->where('activated', $activated ? 1 : 0);

		$this->db->update($this->table_name);
		return $this->db->affected_rows() > 0;
	}

	/**
	 * Activate new email (replace old email with new one) if activation key is valid.
	 *
	 * @param	int
	 * @param	string
	 * @return	bool
	 */
	function activate_new_email($user_id, $new_email_key)
	{
		$this->db->set('email', 'new_email', FALSE);
		$this->db->set('new_email', NULL);
		$this->db->set('new_email_key', NULL);
		$this->db->where('id', $user_id);
		$this->db->where('new_email_key', $new_email_key);

		$this->db->update($this->table_name);
		return $this->db->affected_rows() > 0;
	}

	/**
	 * Update user login info, such as IP-address or login time, and
	 * clear previously generated (but not activated) passwords.
	 *
	 * @param	int
	 * @param	bool
	 * @param	bool
	 * @return	void
	 */
	function update_login_info($user_id, $record_ip, $record_time)
	{
		$this->db->set('new_password_key', NULL);
		$this->db->set('new_password_requested', NULL);

		if ($record_ip)		$this->db->set('last_ip', $this->input->ip_address());
		if ($record_time)	$this->db->set('last_login', date('Y-m-d H:i:s'));

		$this->db->where('id', $user_id);
		$this->db->update($this->table_name);
	}

	/**
	 * Ban user
	 *
	 * @param	int
	 * @param	string
	 * @return	void
	 */
	function ban_user($user_id, $reason = NULL)
	{
		$this->db->where('id', $user_id);
		$this->db->update($this->table_name, array(
			'banned'		=> 1,
			'ban_reason'	=> $reason,
		));
	}

	/**
	 * Unban user
	 *
	 * @param	int
	 * @return	void
	 */
	function unban_user($user_id)
	{
		$this->db->where('id', $user_id);
		$this->db->update($this->table_name, array(
			'banned'		=> 0,
			'ban_reason'	=> NULL,
		));
	}

	/**
	 * Create an empty profile for a new user
	 *
	 * @param	int
	 * @return	bool
	 */
	private function create_profile($user_id)
	{
		$this->db->set('user_id', $user_id);
		return $this->db->insert($this->profile_table_name);
	}

	/**
	*
	*
	*
	*/
	function __reject_activation($id)
	{
		if (!($this->help_functions->is_admin()) || !($this->help_functions->is_auto_profile($id)))
		{
			redirect();
		}
		$data = array('password' => '',
					  'email' => '',
					  'activated' => '2'
		);

		$this->db->where('id', $id)
				 ->update($this->table_name, $data);
	}

	/**
	* 
	* Update profile
	*
	* @return boolean
	*/
	 function update_profile($user_id, $data)
	{
		$this->db->where('user_id', $user_id)
				 ->update($this->profile_table_name, $data);
		if ($this->db->affected_rows()==1){
			return TRUE;
		}
		return FALSE;
	}

	function update_auto_profile($user_id, $user_data, $activated = TRUE, $profile_data)
	{

		$user_data['created'] = date('Y-m-d H:i:s');
		//$user_data['activated'] = $activated ? 1 : 0; // activation by email
		$admin_activation = $this->config->item('activate_by_admin', 'tank_auth'); // activation by admin
		$user_data['activated'] = $admin_activation ? 0 : 1;
		$user_data['username'] = 'auto';
	
		if (!$this->help_functions->is_auto_profile($user_id)){
			return NULL;
		}
		
		$this->db->where('user_id', $user_id)
				 ->where('LOWER(first_name)', strtolower($profile_data['first_name']))
				 ->update($this->profile_table_name, $profile_data);
		//if ($this->db->affected_rows()==1){
		$this->db->where('id',$user_id)
			     ->update($this->table_name, $user_data);
		if ($this->db->affected_rows()==1){
			return (array('user_id' => $user_id));
		}	
		return NULL;
	}

	/**
	 * Delete user profile
	 *
	 * @param	int
	 * @return	void
	 */
	private function __delete_profile($user_id)
	{

		$data = $this->get_user_by_id($user_id);
		if ($data->role != 'admin') 
		{	
			$this->db->where('user_id', $user_id);
			$this->db->delete($this->profile_table_name);
			if ($this->db->affected_rows() > 0) {	
				// delete user data
				// register for toournament		
				$this->db->where('user_id', $user_id);
				$this->db->delete('registered_players');
				// results
				$this->db->where('user_id', $user_id);
				$this->db->delete('baskets');

				$this->db->where('user_id', $user_id);
				$this->db->delete('players_has_tournaments');
				return TRUE;
			}
		}
		return FALSE;
	}
  
  /*
  function get_users() {
    $u = $this -> db -> order_by('username')
                     -> where('activated', 1) 
					           -> get('users');
	
	return $u -> result_array();
}

    function get_match($tournament_id, $users_id) {
    if (($tournament_id == '0') and ($users_id == '0')) {
   //      $d = $this-> db -> order_by('tournament_id')
  //                       -> get('players_has_tournaments');
                         
                         $d = $this->db->query( "SELECT users.username as username, categories.category as category
									FROM players_has_tournaments, users, categories 
									WHERE players_has_tournaments.user_id = users.id AND players_has_tournaments.category_id = categories.category_id AND players_has_tournaments.tournamet_id = tournaments.tournament_id 
									ORDER BY username");
                     
                         
         } 
         
    if (($tournament_id == '0') and ($users_id <> '0')) {
   //      $d = $this-> db -> order_by('tournament_id')
   //                      -> where('user_id', $users_id)
   //                      -> get('players_has_tournaments');
                        $d = $this->db->query( "SELECT users.username as username, categories.category as category
									FROM players_has_tournaments, users, categories 
									WHERE $users_id = users.id AND players_has_tournaments.category_id = categories.category_id AND players_has_tournaments.tournamet_id = tournaments.tournament_id 
									ORDER BY username");
   
                              
         } 
    if (($tournament_id <> '0') and ($users_id == '0')) {
   //     $d = $this-> db -> order_by('tournament_id')
   //                      -> where('tournament_id', $tournament_id)
   //                      -> get('players_has_tournaments');   
                        $d = $this->db->query( "SELECT users.username as username, categories.category as category
									FROM players_has_tournaments, users, categories 
									WHERE players_has_tournaments.user_id = users.id AND players_has_tournaments.category_id = categories.category_id AND $tournament_id = tournaments.tournament_id 
									ORDER BY username"); 
   
          
          }  else {
  //        $d = $this-> db -> order_by('tournament_id')
  //                        -> where('user_id', $users_id)
	//                        -> where('tournament_id', $tournament_id)
  //                        -> get('players_has_tournaments'); 
                         $d = $this->db->query( "SELECT users.username as username, categories.category as category
									FROM players_has_tournaments, users, categories 
									WHERE $users_id = users.id AND players_has_tournaments.category_id = categories.category_id AND $tournament_id = tournaments.tournament_id 
									ORDER BY username");
         
         }
	return $d -> result();  
}
  
  
  */
  
}

/* End of file users.php */
/* Location: ./application/models/auth/users.php */