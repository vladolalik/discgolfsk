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

	function is_admin(){
		$this->ci = & get_instance();
		if ($this->ci->session->userdata('role') === 'admin')
		{
			return true;
		}
		return false;
	}

	/** 
	* Create profile after import
	*  @param string
	*/

	function create_auto_profile($first_name, $last_name, $gender=NULL, $club=NULL, $birth_date=NULL)
	{
		$this->ci = & get_instance();
		$this->ci->load->model('tank_auth/users');
		if (!$this->is_admin())
		{
			redirect();
		}
		$this->ci->users->__create_auto_profile($first_name, $last_name, $gender, $club, $birth_date);

	}

		/**
	* Function return id of user if his profile exits, else null
	*
	* @param string
	* @param string
	* @return int
	* 
	*/
	function exists_profile($first_name, $last_name)
	{
		$this->ci = & get_instance();
		$this->ci->load->model('tank_auth/users');
		if (!$this->is_admin())
		{
			redirect();
		}
		
		return $this->ci->users->__exists_profile($first_name, $last_name);
		
	}

}