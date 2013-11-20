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
}