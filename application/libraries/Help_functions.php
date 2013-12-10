<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Help_functions{

   function is_logged_in(){
   
		$this->ci = & get_instance();
		if($this->ci->session->userdata('id')) {
			return true;
		} else {
			return false;
		}
	}

	/**
	* Function that return true if logged in user is admin
	* @author Vladimir Lalik
	* 
	* @return bool
	*/
	function is_admin(){
		$this->ci = & get_instance();
		if ($this->ci->session->userdata('role') === 'admin')
		{
			return true;
		}
		return false;
	}


	function is_admin_by_id($user_id)
	{
		$this->ci = & get_instance();
		$this->ci->load->model('tank_auth/users');
		$data = $this->ci->users->get_all_user_by_id($user_id);
		if ($data == NULL){
			return false;
		}
		if ($data->role == 'admin')
		{
			return true;
		}
		return false;
	}


	/** 
	* Create profile after import
	* @author Vladimir Lalik
	* @param string
	* @return int
	*/

	function __create_auto_profile($first_name="duro", $last_name="berky", $gender=NULL, $club=NULL, $birth_date=NULL)
	{
		$this->ci = & get_instance();
		$this->ci->load->model('tank_auth/users');
		// if (!$this->is_admin())
		// {
		// 	redirect();
		// }
		return $this->ci->users->__create_auto_profile($first_name, $last_name, $gender, $club, $birth_date);

	}

	/**
	* Function return id of user if his profile exits, else null
	*
	* @author Vladimir Lalik
	* @param string
	* @param string
	* @return int
	* 
	*/
	function exists_profile($first_name, $last_name, $birth_date)
	{

		$this->ci =&get_instance();
		$this->ci->load->model('tank_auth/users');
		// if (!$this->is_admin())
		// {
		// 	redirect();
		// }
		
		return $this->ci->users->__exists_profile($first_name, $last_name,$birth_date);
		
	}

	/**
	* Function that return true if profile was autocreated
	*
	* @author Vladimir Lalik
	* @param int
	* @return bool
	*/
	function is_auto_profile($id)
	{
		$this->ci = & get_instance();
		$this->ci->load->model('tank_auth/users');
		if ($this->ci->users->is_auto_profile($id)) return TRUE;
		return FALSE;
	}

}