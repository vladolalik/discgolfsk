<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Auth extends CI_Controller
{
	function __construct()
	{
		parent::__construct();

		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		$this->load->library('security');
		$this->load->library('tank_auth');
		$this->lang->load('tank_auth');
		$this->load->model('tank_auth/users');
	}

	function index()
	{
		//$this->help_functions->__create_auto_profile();
		if ($message = $this->session->flashdata('message')) {
			//$this->load->view('auth/general_message', array('message' => $message));
			redirect('tournaments/view_results');
		} else {
			redirect('/auth/login/');
		}
	}

	/**
	* Function that view profile of logged in user
	*
	* @return void
	*
	*/
	function my_profile()
	{
		if (!$this->tank_auth->is_logged_in())
		{
			redirect();
		}
		$profile_data = $this->users->get_user_profile($this->tank_auth->get_user_id());
		$this->load->view('my_profile', $profile_data);
	}


	/**
	* Function provide upload of profile 
	*
	*
	* @return void
	*/

	function do_upload() {	
 
	/* Upload Settings */
	$config['upload_path'] = './uploads/images';
	$config['allowed_types'] = 'gif|jpg|png';
	$config['max_size']	= '1024';
	$config['max_width']  = '1024';
	$config['width'] = '128';
	$config['max_height']  = '768';
	/* Encrypting helps prevent the file name from being discerned once its saved */
	$config['encrypt_name'] = 'TRUE';
 
	/* Load the CodeIgniter upload library, feed it the config from above */
	$this->load->library('upload', $config);
 
	/* Checks if the do_upload function has been successfully executed ...
	... and if not, shows the upload form and any errors (if they exist) */
	if (!$this->upload->do_upload()){
 
		/* Loads the model (predefined database instructions, see below) ...
		... and assigns it a nickname, I went with 'foo' */
		//$this->load->model('tank_auth/users','foo');
	 
		/* Makes the logged-in user's id a nice, clean variable */
		$user_id = $this->tank_auth->get_user_id();
	 
		/* Use the model to gather all user profile information for that user_id */
		$profile_data =  $this->users->get_user_profile($user_id);
	 
		/* Pass that data into the data variable (for the views) */
		$data = $profile_data;
	 
		/* Process errors if they exist */
		$error = array('error' => $this->upload->display_errors());
	 
		/* Pass everything into the views */
		//$this->load->view('templates/header', $data);
		$this->load->view('auth/upload_picture', $error);
		//$this->load->view('upload_form', $error);
		//$this->load->view('templates/footer', $data);
	 
		/* ... if the file passes validation ... */ 
	} else { 
	 
		/* Load the users model, assign it alias 'foo' (or whatever you want) */
		$this->load->model('tank_auth/users','foo');
	 
		/* Assign logged-in user ID to a nice, clean variable */
		$user_id = $this->tank_auth->get_user_id();
	 
		/* Assign the upload's metadata (size, dimensions, destination, etc.) ...
		... to an array with another nice, clean variable */
		$upload = (array) $this->upload->data();
	 
		/* Assign's the user's profile data to yet another nice, clean variable */
		$profile_data =  $this->users->get_user_profile($user_id);
	 
		/* Uses two upload library features to assemble the file name (the name, and extension) */
		$filename = $upload['raw_name'].$upload['file_ext'];
	 
		/* Same with the thumbnail we'll generate, but with the suffix '_thumb' */
		$thumb = $upload['raw_name']."_thumb".$upload['file_ext'];
	 
		/* Set the rules for the upload */
		$config['image_library'] = 'gd2';
		$config['source_image']	= "./uploads/images/".$filename;
		$config['create_thumb'] = TRUE;
		$config['maintain_ratio'] = TRUE;
		$config['width']	 = 128;
		$config['height']	= 128;
	 
		/* Load "image manipulation library", see CodeIgniter user guide */
		$this->load->library('image_lib', $config);
	 
		/* Resize the image! */
		$this->image_lib->resize();
	 
		/* Assign upload_data to $data variable */
		$data['upload_data'] = $this->upload->data();
	 
		/* Assign profile_data to $data variable */
		$data['profile_data'] = $profile_data;
	 
		/* Runs the users model (update_photo function, see below) and ...
		... loads the location of the photo new photo into user's profile */
		if ($this->users->update_photo($user_id, $filename, $thumb))
		{
			/* Load "success" view with all the data! */
			//$this->load->view('auth/upload_success', $data);
			$this->session->set_flashdata('message', '<p class="success">Your profile picture was successfully changed!</p>');		
			redirect('auth/my_profile');
		} 
		else
	 	{
	 		//$data['fail'] = 'Upload has failed';
			/* Load "success" view with all the data, but something went wrong in database */
			//$this->load->view('auth/upload_success', $data);
			$this->session->set_flashdata('message', '<p class="fail">Something went wrong, please try again :) </p>');
			redirect('auth/do_upload');		
	 
		}
	}
}


	/**
	* Function reject request for activation
	* auto created will be set to default and others will be deleted
	*
	*
	*/
	function admin_reject_activation()
	{
		$id = $this->uri->segment(3);
		if (!($this->help_functions->is_admin()))
		{
			redirect();
		}
		if ($this->help_functions->is_auto_profile($id))
		{
			if ($this->users->__reject_activation($id))
			{
				$this->session->set_flashdata('message', '<p class="success">Request for activation rejected</p>');
			} 
			else 
			{
				$this->session->set_flashdata('message', '<p>Reqeust was not rejected</p>');
			}
			redirect('auth/admin_get_inactive_players');	
		}
		 else
		{
			redirect('auth/admin_delete_player/'.$id);
		}
	}


	/**
	* Function for update user's profile
	*
	*
	* @return void
	*/

	function update_profile()
	{
		if ($this->tank_auth->is_logged_in(TRUE)) // ak je prihlaseny
		{
			$id = $this->session->userdata('id');
			$data = $this->users->get_user_profile($id);
			$this->form_validation->set_rules('country', 'Country', 'trim|xss_clean');
			$this->form_validation->set_rules('about', 'About', 'trim|xss_clean');
			$this->form_validation->set_rules('club', 'Club', 'trim|xss_clean');
			$this->form_validation->set_rules('gender', 'Gender', 'trim|required|xss_clean');
			$this->form_validation->set_rules('first_name', 'First name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('last_name', 'Last name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('birth_date', 'Day of birth', 'trim|required|xss_clean');
			
			if ($this->form_validation->run())  // update profile
			{	
				$profile_data = array(
					'first_name' => $this->form_validation->set_value('first_name'),
					'last_name' => $this->form_validation->set_value('last_name'),
					'country' => $this->form_validation->set_value('country'),
					'club' => $this->form_validation->set_value('club'),
					'gender' => $this->form_validation->set_value('gender'),
					'birth_date' => $this->form_validation->set_value('birth_date'),
					'about' => $this->form_validation->set_value('about')
					);
				if ($this->users->update_profile($id, $profile_data))
				{	
					$this->session->set_userdata( $profile_data );
					$this->session->set_flashdata('message', '<p class="success"> Update was succesfull!</p>');
				} 
				else 
				{
					$this->session->set_flashdata('message', '<p class="fail"> Update has failed!</p>');
				}
				redirect();

			} 
			else
			{
				$this->load->view('auth/update_profile', $data);// load update view
			} 
		} 
		else 
		{
			redirect();
		}
	}

	/**
	* Function for provide changes in auto created profiles
	*
	* @return boolean
	*/
	function admin_update_auto_profile()
	{
		$id = $this->uri->segment(3);
		if (!($this->help_functions->is_admin()) || !($this->help_functions->is_auto_profile($id)))
		{
			redirect();
		}
		
		$this->form_validation->set_rules('club', 'Club', 'trim|xss_clean');
		$this->form_validation->set_rules('gender', 'Gender', 'trim|xss_clean');
		$this->form_validation->set_rules('first_name', 'First name', 'trim|required|xss_clean');
		$this->form_validation->set_rules('last_name', 'Last name', 'trim|required|xss_clean');
		$this->form_validation->set_rules('birth_date', 'Day of birth', 'trim|xss_clean');

		if ($this->form_validation->run()){
			$data = array(
					'first_name' => $this->form_validation->set_value('first_name'),
					'last_name' => $this->form_validation->set_value('last_name'),
					'club' => $this->form_validation->set_value('club'),
					'gender' => $this->form_validation->set_value('gender'),
					'birth_date' => $this->form_validation->set_value('birth_date')
				);
			$this->users->update_profile($id, $data);
			$this->session->set_flashdata('message', '<p class="success">Update was succesfull</p>');
			redirect('auth/admin_get_autocreated_profile');

		} else {
	
			$data = $this->users->get_user_profile($id);
			$this->load->view('auth/update_auto_profile', $data);
		}


	}


	/**
	* Function for delete user and all his data
	*
	*
	*
	*/
	function admin_delete_player()
	{
		if (!$this->help_functions->is_admin())
		{
			redirect();
		}
		$id = $this->uri->segment(3);
		if ($this->users->__delete_user($id))
		{
			$this->session->set_flashdata('message', '<p class="succes"> User was succesfully deleted!</p>');
		} else {
			$this->session->set_flashdata('message', '<p class="fail"> User was not deleted.</p>');
		}
		redirect('auth/admin_get_all_players');
			
	}


	/** 
	* View list of inactive_players profiles
	*
	* @return void
	*/

	function admin_get_inactive_players()
	{
		if (!$this->help_functions->is_admin())
		{
			redirect();
		}

		$this->load->library('pagination');
		$config['base_url'] = base_url().'index.php/auth/admin_get_inactive_players/'	;
		$config['total_rows'] = $this->users->get_nmbr_activated(0);
		$config['per_page'] = 3; 
		$config['full_tag_open'] = '<div id="pagination">';
		$config['full_tag_close'] = '</div>';
				
		$config['first_link'] = FALSE;
		$config['last_link'] = FALSE;
				
		$config['next_tag_open'] = '<span class="next">';
		$config['next_tag_close'] = '</span>';
				
		$config['prev_tag_open'] = '<span class="prev">';
		$config['prev_tag_close']= '</span>';
		
		//print_r($config);
		//die();	
		//$config['display_pages'] = FALSE;
				
		$this->pagination->initialize($config); 
		if ($this->uri->segment(3) == NULL)
		{
			$number = 0;
		} 
		else 
		{
			$number= $this->uri->segment(3);
		}

		$players['players'] = $this->users->get_inactive_users($number, $config['per_page']);
		$this->load->view('activate_players', $players);
	}

	/**
	* Get auto-created profiles from import
	*
	* @return void
	*/

	function get_autocreated_profile()
	{
	
		$this->load->library('pagination');
		$config['base_url'] = base_url().'index.php/auth/get_autocreated_profile/'	;
		$config['total_rows'] = $this->users->get_nmbr_activated(0);
		$config['per_page'] = 3; 
		$config['full_tag_open'] = '<div id="pagination">';
		$config['full_tag_close'] = '</div>';
				
		$config['first_link'] = FALSE;
		$config['last_link'] = FALSE;
				
		$config['next_tag_open'] = '<span class="next">';
		$config['next_tag_close'] = '</span>';
				
		$config['prev_tag_open'] = '<span class="prev">';
		$config['prev_tag_close']= '</span>';

		$this->pagination->initialize($config); 
		if ($this->uri->segment(3) == NULL)
		{
			$number = 0;
		} 
		else 
		{
			$number= $this->uri->segment(3);
		}

		$data['players'] = $this->users->get_autocreated_profiles($number, $config['per_page']);
		$this->load->view('autocreated_profiles', $data);

	}


	/**
	* Function display all players
	*
	* @return void
	*
	*/
	function admin_get_all_players()
	{
	
		$this->load->library('pagination');
		$config['base_url'] = base_url().'index.php/auth/admin_get_all_players/'	;
		$config['total_rows'] = $this->users->get_nmbr_all();
		$config['per_page'] = 3; 
		$config['full_tag_open'] = '<div id="pagination">';
		$config['full_tag_close'] = '</div>';
				
		$config['first_link'] = FALSE;
		$config['last_link'] = FALSE;
				
		$config['next_tag_open'] = '<span class="next">';
		$config['next_tag_close'] = '</span>';
				
		$config['prev_tag_open'] = '<span class="prev">';
		$config['prev_tag_close']= '</span>';
		
		//print_r($config);
		//die();	
		//$config['display_pages'] = FALSE;
				
		$this->pagination->initialize($config); 
		if ($this->uri->segment(3) == NULL)
		{
			$number = 0;
		} 
		else 
		{
			$number= $this->uri->segment(3);
		}

		$data['players'] = $this->users->__get_all_users($number, $config['per_page']);
		$this->load->view('auth/admin_all_profiles', $data);

	}

	function admin_get_autocreated_profile()
	{
		if (!$this->help_functions->is_admin())
		{
			redirect();
		}

		$this->load->library('pagination');
		$config['base_url'] = base_url().'index.php/auth/admin_get_autocreated_profile/'	;
		$config['total_rows'] = $this->users->get_nmbr_activated(2);
		$config['per_page'] = 3; 
		$config['full_tag_open'] = '<div id="pagination">';
		$config['full_tag_close'] = '</div>';
				
		$config['first_link'] = FALSE;
		$config['last_link'] = FALSE;
				
		$config['next_tag_open'] = '<span class="next">';
		$config['next_tag_close'] = '</span>';
				
		$config['prev_tag_open'] = '<span class="prev">';
		$config['prev_tag_close']= '</span>';
		
		//print_r($config);
		//die();	
		//$config['display_pages'] = FALSE;
				
		$this->pagination->initialize($config); 
		if ($this->uri->segment(3) == NULL)
		{
			$number = 0;
		} 
		else 
		{
			$number= $this->uri->segment(3);
		}

		$data['players'] = $this->users->get_autocreated_profiles($number, $config['per_page']);
		$this->load->view('auth/admin_auto_cr_prof', $data);

	}	

	/**
	* Activate player
	*
	* @return boolean
	*/

	function admin_activate_player()
	{
		if (!$this->help_functions->is_admin())
		{
			redirect();
		}
		$id = $this->uri->segment(3);
	
		if ($this->users->__activate_player($id))
		{
			$this->session->set_flashdata('message', '<p class="succes"> Activation succed</p>');
		} else {
			$this->session->set_flashdata('message', '<p class="fail"> Activation failed</p>');
		}
		redirect('auth/admin_get_inactive_players');
	}


	/**
	* Function for registring existing profile
	*
	*
	*
	*/
	function register_existing_profile(){
		$id = $this->uri->segment(3);
		if ($this->tank_auth->is_logged_in()) {	
											// logged in
			redirect('');

		} elseif ($this->tank_auth->is_logged_in(FALSE)) {						// logged in, not activated
			
			redirect('/auth/send_again/');

		} elseif (!$this->config->item('allow_registration', 'tank_auth')) {	// registration is off
			$this->_show_message($this->lang->line('auth_message_registration_disabled'));
		} elseif (!($this->help_functions->is_auto_profile($id))) { // it must be autocreated profile
			
			redirect('');

		} else {
			$use_username = $this->config->item('use_username', 'tank_auth');
			if ($use_username) {
				$this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean|min_length['.$this->config->item('username_min_length', 'tank_auth').']|max_length['.$this->config->item('username_max_length', 'tank_auth').']|alpha_dash');
			}
			$this->form_validation->set_rules('country', 'Country', 'trim|xss_clean');
			$this->form_validation->set_rules('club', 'Club', 'trim|xss_clean');
			$this->form_validation->set_rules('about', 'About', 'trim|xss_clean');
			$this->form_validation->set_rules('gender', 'Gender', 'trim|required|xss_clean');
			$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean|valid_email');
			$this->form_validation->set_rules('first_name', 'First name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('last_name', 'Last name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('birth_date', 'Day of birth', 'trim|required|xss_clean');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean|min_length['.$this->config->item('password_min_length', 'tank_auth').']|max_length['.$this->config->item('password_max_length', 'tank_auth').']|alpha_dash');
			$this->form_validation->set_rules('confirm_password', 'Confirm Password', 'trim|required|xss_clean|matches[password]');

			$captcha_registration	= $this->config->item('captcha_registration', 'tank_auth');
			$use_recaptcha			= $this->config->item('use_recaptcha', 'tank_auth');
			if ($captcha_registration) {
				if ($use_recaptcha) {
					$this->form_validation->set_rules('recaptcha_response_field', 'Confirmation Code', 'trim|xss_clean|required|callback__check_recaptcha');
				} else {
					$this->form_validation->set_rules('captcha', 'Confirmation Code', 'trim|xss_clean|required|callback__check_captcha');
				}
			}
			$data['errors'] = array();

			$email_activation = $this->config->item('email_activation', 'tank_auth');
			/* edit by Vlado profile attributes for user*/
			$user_info = array(
				'first_name' =>  $this->input->post('first_name'),
				'last_name'  => $this->input->post('last_name'),
				'birth_date' => $this->input->post('birth_date'),
				'gender' => $this->input->post('gender'),
				'club' => $this->input->post('club'),
				'about' => $this->input->post('about'),
				'country' => $this->input->post('country'),
			);	

			$user_data = array(
				'password' => $this->form_validation->set_value('password'),
				'email' => $this->form_validation->set_value('password'),
				'activated' => '1'
			);

			
			if ($this->form_validation->run()){
		
			//update profile
			//echo "update profile";
			//if($this->users->update_auto_profile($id, $user_info, $user_data)){
				if (!is_null($data = $this->tank_auth->create_auto($id, 
						$use_username ? $this->form_validation->set_value('username') : '',
						$this->form_validation->set_value('email'),
						$this->form_validation->set_value('password'),
						$email_activation, $user_info))) {

				if ($email_activation) {									// send "activate" email
						$data['activation_period'] = $this->config->item('email_activation_expire', 'tank_auth') / 3600;

						$this->_send_email('activate', $data['email'], $data);

						unset($data['password']); // Clear password (just for any case)

						$this->_show_message($this->lang->line('auth_message_registration_completed_1'));

					} else {
						//if ($this->config->item('email_account_details', 'tank_auth')) {	// send "welcome" email

					///		$this->_send_email('welcome', $data['email'], $data);
					//	}
						unset($data['password']); // Clear password (just for any case)

						$this->_show_message($this->lang->line('auth_message_registration_completed_2').' '.anchor('/auth/login/', 'Login'));
					}
				} else {
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}
			}
			
		} 
		//print_r($id);
		$data = $this->users->get_user_profile($id);
		if ($captcha_registration) {
				if ($use_recaptcha) {
					$data['recaptcha_html'] = $this->_create_recaptcha();
				} else {
					$data['captcha_html'] = $this->_create_captcha();
				}
		}
		$data['use_username'] = $use_username;
		$data['captcha_registration'] = $captcha_registration;
		$data['use_recaptcha'] = $use_recaptcha;
		$this->load->view('auth/register_exist_prof_form', $data);
}
		
	


	/**
	 * Login user on the site
	 *
	 * @return void
	 */
	function login()
	{
		if ($this->tank_auth->is_logged_in()) {									// logged in
			redirect('');

		} elseif ($this->tank_auth->is_logged_in(FALSE)) {						// logged in, not activated
			$this->session->set_flashdata('message', '<p class="fail">Your profile is inactive. Contact admin.</p>');
			redirect('/auth/logout');
			//redirect('/auth/send_again/');  // uncomment for email activation
		} else {
			$data['login_by_username'] = ($this->config->item('login_by_username', 'tank_auth') AND
					$this->config->item('use_username', 'tank_auth'));
			$data['login_by_email'] = $this->config->item('login_by_email', 'tank_auth');

			$this->form_validation->set_rules('login', 'Login', 'trim|required|xss_clean');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');
			$this->form_validation->set_rules('remember', 'Remember me', 'integer');

			// Get login for counting attempts to login
			if ($this->config->item('login_count_attempts', 'tank_auth') AND
					($login = $this->input->post('login'))) {
				$login = $this->security->xss_clean($login);
			} else {
				$login = '';
			}

			$data['use_recaptcha'] = $this->config->item('use_recaptcha', 'tank_auth');
			if ($this->tank_auth->is_max_login_attempts_exceeded($login)) {
				if ($data['use_recaptcha'])
					$this->form_validation->set_rules('recaptcha_response_field', 'Confirmation Code', 'trim|xss_clean|required|callback__check_recaptcha');
				else
					$this->form_validation->set_rules('captcha', 'Confirmation Code', 'trim|xss_clean|required|callback__check_captcha');
			}
			$data['errors'] = array();

			if ($this->form_validation->run()) {								// validation ok
				if ($this->tank_auth->login(
						$this->form_validation->set_value('login'),
						$this->form_validation->set_value('password'),
						$this->form_validation->set_value('remember'),
						$data['login_by_username'],
						$data['login_by_email'])) {	// success

					//create user seesion		
					$user_session = $this->users->get_user_by_login($this->form_validation->set_value('login'));
					$email = $user_session->email;
					$id = $user_session->id;
					$role = $user_session->role;
					$user_profile = $this->users->get_user_profile($id);
					$user_profile['id'] = $id;
					$user_profile['email'] = $email;
					$user_profile['role'] = $role;
					unset($user_session);		
					$this->session->set_userdata($user_profile);
					if ($this->help_functions->is_admin())
					{
						redirect('auth/admin_get_all_players');
					}
					redirect('');

				} else {
					$errors = $this->tank_auth->get_error_message();
					if (isset($errors['banned'])) {								// banned user
						$this->_show_message($this->lang->line('auth_message_banned').' '.$errors['banned']);

					} elseif (isset($errors['not_activated'])) {				// not activated user
						//redirect('/auth/send_again/');

					} else {													// fail
						foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
					}
				}
			}
			$data['show_captcha'] = FALSE;
			if ($this->tank_auth->is_max_login_attempts_exceeded($login)) {
				$data['show_captcha'] = TRUE;
				if ($data['use_recaptcha']) {
					$data['recaptcha_html'] = $this->_create_recaptcha();
				} else {
					$data['captcha_html'] = $this->_create_captcha();
				}
			}
			$this->load->view('auth/login_form', $data);
		}
	}

	/**
	 * Login admin on the site
	 * @author Vladimir Lalik
	 * @return void
	 */
	function admin_login()
	{
		if ($this->tank_auth->is_logged_in()) {									// logged in
			redirect('');

		} elseif (!($this->users->__is_admin($this->input->post('login')))) { // must be admin
			
			$this->session->set_flashdata('message', '<p class="fail">Access forbidden!</p>');
			redirect('auth/admin_login');

		} elseif ($this->tank_auth->is_logged_in(FALSE)) {						// logged in, not activated
			$this->session->set_flashdata('message', '<p class="fail">Your profile is inactive. Contact admin.</p>');
			redirect('/auth/logout');
			//redirect('/auth/send_again/');  // uncomment for email activation
		} else {
			$data['login_by_username'] = ($this->config->item('login_by_username', 'tank_auth') AND
					$this->config->item('use_username', 'tank_auth'));
			$data['login_by_email'] = $this->config->item('login_by_email', 'tank_auth');

			$this->form_validation->set_rules('login', 'Login', 'trim|required|xss_clean');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');
			$this->form_validation->set_rules('remember', 'Remember me', 'integer');

			// Get login for counting attempts to login
			if ($this->config->item('login_count_attempts', 'tank_auth') AND
					($login = $this->input->post('login'))) {
				$login = $this->security->xss_clean($login);
			} else {
				$login = '';
			}

			$data['use_recaptcha'] = $this->config->item('use_recaptcha', 'tank_auth');
			if ($this->tank_auth->is_max_login_attempts_exceeded($login)) {
				if ($data['use_recaptcha'])
					$this->form_validation->set_rules('recaptcha_response_field', 'Confirmation Code', 'trim|xss_clean|required|callback__check_recaptcha');
				else
					$this->form_validation->set_rules('captcha', 'Confirmation Code', 'trim|xss_clean|required|callback__check_captcha');
			}
			$data['errors'] = array();

			if ($this->form_validation->run()) {								// validation ok
				if ($this->tank_auth->login(
						$this->form_validation->set_value('login'),
						$this->form_validation->set_value('password'),
						$this->form_validation->set_value('remember'),
						$data['login_by_username'],
						$data['login_by_email'])) {	// success

					//create user seesion		
					$user_session = $this->users->get_user_by_login($this->form_validation->set_value('login'));
					$email = $user_session->email;
					$id = $user_session->id;
					$role = $user_session->role;
					$user_profile = $this->users->get_user_profile($id);
					$user_profile['id'] = $id;
					$user_profile['email'] = $email;
					$user_profile['role'] = $role;
					unset($user_session);		
					$this->session->set_userdata($user_profile);
					if ($this->help_functions->is_admin())
					{
						redirect('auth/admin_get_all_players');
					}
					//redirect('');

				} else {
					$errors = $this->tank_auth->get_error_message();
					if (isset($errors['banned'])) {								// banned user
						$this->_show_message($this->lang->line('auth_message_banned').' '.$errors['banned']);

					} elseif (isset($errors['not_activated'])) {				// not activated user
						//redirect('/auth/send_again/');

					} else {													// fail
						foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
					}
				}
			}
			$data['show_captcha'] = FALSE;
			if ($this->tank_auth->is_max_login_attempts_exceeded($login)) {
				$data['show_captcha'] = TRUE;
				if ($data['use_recaptcha']) {
					$data['recaptcha_html'] = $this->_create_recaptcha();
				} else {
					$data['captcha_html'] = $this->_create_captcha();
				}
			}

			$this->load->view('auth/admin_login_view', $data);
		}
	}

	/**
	 * Logout user
	 *
	 * @return void
	 */
	function logout()
	{
		$this->tank_auth->logout();

		$this->_show_message($this->lang->line('auth_message_logged_out'));
	}

	/**
	 * Register user on the site
	 *
	 * @return void
	 */
	function register()
	{
		if ($this->tank_auth->is_logged_in()) {									// logged in
			redirect('');

		} elseif ($this->tank_auth->is_logged_in(FALSE)) {						// logged in, not activated
			//redirect('/auth/send_again/'); // uncomment for email activation
			$this->session->set_flashdata('message', '<p class="fail">Your profile is inactive. Contact admin.</p>');
			redirect('/auth/logout');
		} elseif (!$this->config->item('allow_registration', 'tank_auth')) {	// registration is off
			$this->_show_message($this->lang->line('auth_message_registration_disabled'));

		} else {
			$use_username = $this->config->item('use_username', 'tank_auth');
			if ($use_username) {
				$this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean|min_length['.$this->config->item('username_min_length', 'tank_auth').']|max_length['.$this->config->item('username_max_length', 'tank_auth').']|alpha_dash');
			}
			$this->form_validation->set_rules('country', 'Country', 'trim|xss_clean');
			$this->form_validation->set_rules('club', 'Club', 'trim|xss_clean');
			$this->form_validation->set_rules('about', 'About', 'trim|xss_clean');
			$this->form_validation->set_rules('gender', 'Gender', 'trim|required|xss_clean');
			$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean|valid_email');
			$this->form_validation->set_rules('first_name', 'First name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('last_name', 'Last name', 'trim|required|xss_clean');
			$this->form_validation->set_rules('birth_date', 'Day of birth', 'trim|required|xss_clean');
			$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean|min_length['.$this->config->item('password_min_length', 'tank_auth').']|max_length['.$this->config->item('password_max_length', 'tank_auth').']|alpha_dash');
			$this->form_validation->set_rules('confirm_password', 'Confirm Password', 'trim|required|xss_clean|matches[password]');

			$captcha_registration	= $this->config->item('captcha_registration', 'tank_auth');
			$use_recaptcha			= $this->config->item('use_recaptcha', 'tank_auth');
			if ($captcha_registration) {
				if ($use_recaptcha) {
					$this->form_validation->set_rules('recaptcha_response_field', 'Confirmation Code', 'trim|xss_clean|required|callback__check_recaptcha');
				} else {
					$this->form_validation->set_rules('captcha', 'Confirmation Code', 'trim|xss_clean|required|callback__check_captcha');
				}
			}
			$data['errors'] = array();

			$email_activation = $this->config->item('email_activation', 'tank_auth');
			/* edit by Vlado profile attributes for user*/
			$user_info = array(
				'first_name' =>  $this->input->post('first_name'),
				'last_name'  => $this->input->post('last_name'),
				'birth_date' => $this->input->post('birth_date'),
				'gender' => $this->input->post('gender'),
				'club' => $this->input->post('club'),
				'about' => $this->input->post('about'),
				'country' => $this->input->post('country')
			);


			if ($this->form_validation->run()) {								// validation ok
				if (!is_null($data = $this->tank_auth->create_user(
						$use_username ? $this->form_validation->set_value('username') : '',
						$this->form_validation->set_value('email'),
						$this->form_validation->set_value('password'),
						$email_activation,$user_info))) {									// success

					$data['site_name'] = $this->config->item('website_name', 'tank_auth');



					if ($email_activation) {									// send "activate" email
						$data['activation_period'] = $this->config->item('email_activation_expire', 'tank_auth') / 3600;

						$this->_send_email('activate', $data['email'], $data);

						unset($data['password']); // Clear password (just for any case)

						$this->_show_message($this->lang->line('auth_message_registration_completed_1'));

					} else {
						//if ($this->config->item('email_account_details', 'tank_auth')) {	// send "welcome" email

					///		$this->_send_email('welcome', $data['email'], $data);
					//	}
						unset($data['password']); // Clear password (just for any case)

						$this->_show_message($this->lang->line('auth_message_registration_completed_2').' '.anchor('/auth/login/', 'Login'));
					}
				} else {
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}
			}
			if ($captcha_registration) {
				if ($use_recaptcha) {
					$data['recaptcha_html'] = $this->_create_recaptcha();
				} else {
					$data['captcha_html'] = $this->_create_captcha();
				}
			}
			$data['use_username'] = $use_username;
			$data['first_name'] = $this->input->post('first_name');
			$data['captcha_registration'] = $captcha_registration;
			$data['use_recaptcha'] = $use_recaptcha;
			$this->load->view('auth/register_form', $data);
		}
	}

	/**
	 * Send activation email again, to the same or new email address
	 *
	 * @return void
	 */
	function send_again()
	{
		if (!$this->tank_auth->is_logged_in(FALSE)) {							// not logged in or activated
			redirect('/auth/login/');

		} else {
			$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean|valid_email');

			$data['errors'] = array();

			if ($this->form_validation->run()) {								// validation ok
				if (!is_null($data = $this->tank_auth->change_email(
						$this->form_validation->set_value('email')))) {			// success

					$data['site_name']	= $this->config->item('website_name', 'tank_auth');
					$data['activation_period'] = $this->config->item('email_activation_expire', 'tank_auth') / 3600;

					$this->_send_email('activate', $data['email'], $data);

					$this->_show_message(sprintf($this->lang->line('auth_message_activation_email_sent'), $data['email']));

				} else {
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}
			}
			$this->load->view('auth/send_again_form', $data);
		}
	}

	/**
	 * Activate user account.
	 * User is verified by user_id and authentication code in the URL.
	 * Can be called by clicking on link in mail.
	 *
	 * @return void
	 */
	function activate()
	{
		$user_id		= $this->uri->segment(3);
		$new_email_key	= $this->uri->segment(4);

		// Activate user
		if ($this->tank_auth->activate_user($user_id, $new_email_key)) {		// success
			$this->tank_auth->logout();
			$this->_show_message($this->lang->line('auth_message_activation_completed').' '.anchor('/auth/login/', 'Login'));

		} else {																// fail
			$this->_show_message($this->lang->line('auth_message_activation_failed'));
		}
	}

	/**
	 * Generate reset code (to change password) and send it to user
	 *
	 * @return void
	 */
	function forgot_password()
	{
		if ($this->tank_auth->is_logged_in()) {									// logged in
			redirect('');

		} elseif ($this->tank_auth->is_logged_in(FALSE)) {						// logged in, not activated
			redirect('/auth/send_again/');

		} else {
			$this->form_validation->set_rules('login', 'Email or login', 'trim|required|xss_clean');

			$data['errors'] = array();

			if ($this->form_validation->run()) {								// validation ok
				if (!is_null($data = $this->tank_auth->forgot_password(
						$this->form_validation->set_value('login')))) {

					$data['site_name'] = $this->config->item('website_name', 'tank_auth');

					// Send email with password activation link
					$this->_send_email('forgot_password', $data['email'], $data);

					$this->_show_message($this->lang->line('auth_message_new_password_sent'));

				} else {
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}
			}
			$this->load->view('auth/forgot_password_form', $data);
		}
	}

	/**
	 * Replace user password (forgotten) with a new one (set by user).
	 * User is verified by user_id and authentication code in the URL.
	 * Can be called by clicking on link in mail.
	 *
	 * @return void
	 */
	function reset_password()
	{
		$user_id		= $this->uri->segment(3);
		$new_pass_key	= $this->uri->segment(4);

		$this->form_validation->set_rules('new_password', 'New Password', 'trim|required|xss_clean|min_length['.$this->config->item('password_min_length', 'tank_auth').']|max_length['.$this->config->item('password_max_length', 'tank_auth').']|alpha_dash');
		$this->form_validation->set_rules('confirm_new_password', 'Confirm new Password', 'trim|required|xss_clean|matches[new_password]');

		$data['errors'] = array();

		if ($this->form_validation->run()) {								// validation ok
			if (!is_null($data = $this->tank_auth->reset_password(
					$user_id, $new_pass_key,
					$this->form_validation->set_value('new_password')))) {	// success

				$data['site_name'] = $this->config->item('website_name', 'tank_auth');

				// Send email with new password
				$this->_send_email('reset_password', $data['email'], $data);

				$this->_show_message($this->lang->line('auth_message_new_password_activated').' '.anchor('/auth/login/', 'Login'));

			} else {														// fail
				$this->_show_message($this->lang->line('auth_message_new_password_failed'));
			}
		} else {
			// Try to activate user by password key (if not activated yet)
			if ($this->config->item('email_activation', 'tank_auth')) {
				$this->tank_auth->activate_user($user_id, $new_pass_key, FALSE);
			}

			if (!$this->tank_auth->can_reset_password($user_id, $new_pass_key)) {
				$this->_show_message($this->lang->line('auth_message_new_password_failed'));
			}
		}
		$this->load->view('auth/reset_password_form', $data);
	}

	/**
	 * Change user password
	 *
	 * @return void
	 */
	function change_password()
	{
		if (!$this->tank_auth->is_logged_in()) {								// not logged in or not activated
			redirect('/auth/login/');

		} else {
			$this->form_validation->set_rules('old_password', 'Old Password', 'trim|required|xss_clean');
			$this->form_validation->set_rules('new_password', 'New Password', 'trim|required|xss_clean|min_length['.$this->config->item('password_min_length', 'tank_auth').']|max_length['.$this->config->item('password_max_length', 'tank_auth').']|alpha_dash');
			$this->form_validation->set_rules('confirm_new_password', 'Confirm new Password', 'trim|required|xss_clean|matches[new_password]');

			$data['errors'] = array();

			if ($this->form_validation->run()) {								// validation ok
				if ($this->tank_auth->change_password(
						$this->form_validation->set_value('old_password'),
						$this->form_validation->set_value('new_password'))) {	// success
					$this->session->set_flashdata('message', '<p class="succes">Your password has been successfully changed.</p>');
					redirect('');
					//$this->_show_message($this->lang->line('auth_message_password_changed'));

				} else {														// fail
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}
			}
			$this->load->view('auth/change_password_form', $data);
		}
	}

	/**
	 * Change user email
	 *
	 * @return void
	 */
	function change_email()
	{
		if (!$this->tank_auth->is_logged_in()) {								// not logged in or not activated
			redirect('/auth/login/');

		} else {
			$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');
			$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean|valid_email');

			$data['errors'] = array();

			if ($this->form_validation->run()) {								// validation ok , uncomment for email sending
				/*if (!is_null($data = $this->tank_auth->set_new_email(
						$this->form_validation->set_value('email'),
						$this->form_validation->set_value('password')))) {			// success

					$data['site_name'] = $this->config->item('website_name', 'tank_auth');

					// Send email with new email address and its activation link
					$this->_send_email('change_email', $data['new_email'], $data);

					$this->_show_message(sprintf($this->lang->line('auth_message_new_email_sent'), $data['new_email']));

				} else {
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}*/ 
				if (!is_null($data = $this->tank_auth->set_new_email(
						$this->form_validation->set_value('email'),
						$this->form_validation->set_value('password')))) 
				{
					$this->users->set_new_email($this->session->userdata('id'), $this->form_validation->set_value('email'), '', '1' );
					$array = array(
						'email' => $this->form_validation->set_value('email')
					);
					
					$this->session->set_userdata( $array );
					redirect();
				}
				 else 
				{
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}
			}
			$this->load->view('auth/change_email_form', $data);
		}
	}

	/**
	 * Replace user email with a new one.
	 * User is verified by user_id and authentication code in the URL.
	 * Can be called by clicking on link in mail.
	 *
	 * @return void
	 */
	function reset_email()
	{
		$user_id		= $this->uri->segment(3);
		$new_email_key	= $this->uri->segment(4);

		// Reset email
		if ($this->tank_auth->activate_new_email($user_id, $new_email_key)) {	// success
			$this->tank_auth->logout();
			$this->_show_message($this->lang->line('auth_message_new_email_activated').' '.anchor('/auth/login/', 'Login'));

		} else {																// fail
			$this->_show_message($this->lang->line('auth_message_new_email_failed'));
		}
	}

	/**
	 * Delete user from the site (only when user is logged in)
	 *
	 * @return void
	 */
	function __unregister()
	{
		if (!$this->tank_auth->is_logged_in()) {								// not logged in or not activated
			redirect('/auth/login/');

		} else {
			$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');

			$data['errors'] = array();

			if ($this->form_validation->run()) {								// validation ok
				if ($this->tank_auth->__delete_user(
						$this->form_validation->set_value('password'))) {		// success
					$this->_show_message($this->lang->line('auth_message_unregistered'));

				} else {														// fail
					$errors = $this->tank_auth->get_error_message();
					foreach ($errors as $k => $v)	$data['errors'][$k] = $this->lang->line($v);
				}
			}
			$this->load->view('auth/unregister_form', $data);
		}
	}

	/**
	 * Show info message
	 *
	 * @param	string
	 * @return	void
	 */
	function _show_message($message)
	{
		$this->session->set_flashdata('message', $message);
		redirect('/auth/');
	}

	/**
	 * Send email message of given type (activate, forgot_password, etc.)
	 *
	 * @param	string
	 * @param	string
	 * @param	array
	 * @return	void
	 */
	function _send_email($type, $email, &$data)
	{
		$this->load->library('email');
		$this->email->from($this->config->item('webmaster_email', 'tank_auth'), $this->config->item('website_name', 'tank_auth'));
		$this->email->reply_to($this->config->item('webmaster_email', 'tank_auth'), $this->config->item('website_name', 'tank_auth'));
		$this->email->to($email);
		$this->email->subject(sprintf($this->lang->line('auth_subject_'.$type), $this->config->item('website_name', 'tank_auth')));
		$this->email->message($this->load->view('email/'.$type.'-html', $data, TRUE));
		$this->email->set_alt_message($this->load->view('email/'.$type.'-txt', $data, TRUE));
		$this->email->send();
	}

	/**
	 * Create CAPTCHA image to verify user as a human
	 *
	 * @return	string
	 */
	function _create_captcha()
	{
		$this->load->helper('captcha');

		$cap = create_captcha(array(
			'img_path'		=> './'.$this->config->item('captcha_path', 'tank_auth'),
			'img_url'		=> base_url().$this->config->item('captcha_path', 'tank_auth'),
			'font_path'		=> './'.$this->config->item('captcha_fonts_path', 'tank_auth'),
			'font_size'		=> $this->config->item('captcha_font_size', 'tank_auth'),
			'img_width'		=> $this->config->item('captcha_width', 'tank_auth'),
			'img_height'	=> $this->config->item('captcha_height', 'tank_auth'),
			'show_grid'		=> $this->config->item('captcha_grid', 'tank_auth'),
			'expiration'	=> $this->config->item('captcha_expire', 'tank_auth'),
		));

		// Save captcha params in session
		$this->session->set_flashdata(array(
				'captcha_word' => $cap['word'],
				'captcha_time' => $cap['time'],
		));

		return $cap['image'];
	}

	/**
	 * Callback function. Check if CAPTCHA test is passed.
	 *
	 * @param	string
	 * @return	bool
	 */
	function _check_captcha($code)
	{
		$time = $this->session->flashdata('captcha_time');
		$word = $this->session->flashdata('captcha_word');

		list($usec, $sec) = explode(" ", microtime());
		$now = ((float)$usec + (float)$sec);

		if ($now - $time > $this->config->item('captcha_expire', 'tank_auth')) {
			$this->form_validation->set_message('_check_captcha', $this->lang->line('auth_captcha_expired'));
			return FALSE;

		} elseif (($this->config->item('captcha_case_sensitive', 'tank_auth') AND
				$code != $word) OR
				strtolower($code) != strtolower($word)) {
			$this->form_validation->set_message('_check_captcha', $this->lang->line('auth_incorrect_captcha'));
			return FALSE;
		}
		return TRUE;
	}

	/**
	 * Create reCAPTCHA JS and non-JS HTML to verify user as a human
	 *
	 * @return	string
	 */
	function _create_recaptcha()
	{
		$this->load->helper('recaptcha');

		// Add custom theme so we can get only image
		$options = "<script>var RecaptchaOptions = {theme: 'custom', custom_theme_widget: 'recaptcha_widget'};</script>\n";

		// Get reCAPTCHA JS and non-JS HTML
		$html = recaptcha_get_html($this->config->item('recaptcha_public_key', 'tank_auth'));

		return $options.$html;
	}

	/**
	 * Callback function. Check if reCAPTCHA test is passed.
	 *
	 * @return	bool
	 */
	function _check_recaptcha()
	{
		$this->load->helper('recaptcha');

		$resp = recaptcha_check_answer($this->config->item('recaptcha_private_key', 'tank_auth'),
				$_SERVER['REMOTE_ADDR'],
				$_POST['recaptcha_challenge_field'],
				$_POST['recaptcha_response_field']);

		if (!$resp->is_valid) {
			$this->form_validation->set_message('_check_recaptcha', $this->lang->line('auth_incorrect_captcha'));
			return FALSE;
		}
		return TRUE;
	}

}

/* End of file auth.php */
/* Location: ./application/controllers/auth.php */