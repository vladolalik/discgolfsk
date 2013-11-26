<!DOCTYPE HTML>
<html>
	<HEAD>
	      <TITLE><?php echo $title; ?></TITLE>
	   </HEAD>
	<body>
		<nav>
			<ul>
			<?php if ($this->tank_auth->is_logged_in(TRUE))
					{
						echo '<li>'.anchor('auth/my_profile', 'My profile', 'title="profile"').' 
									<ul>
										<li>'.anchor('/auth/do_upload', 'Change profile picture', 'title="Change profile picture"').'</li>
										<li>'.anchor('/auth/update_profile', 'Update profile', 'title="Update"').'</li>
										<li>'.anchor('/auth/change_email', 'Change email', 'title="Change profile"').'</li>
										<li>'.anchor('/auth/change_password', 'Change password', 'title="Change password"').'</li>
									</ul>
							  </li>';
						if ($this->help_functions->is_admin())
						{
							echo '<li>'.anchor('/auth/admin_get_all_players', 'Administration', 'title="Administration"').'</li>';
						}
						echo  '<li>'.anchor('/auth/logout', 'Logout', 'title="Logout"');	
					}
			?>
			</ul>
		</nav>
		<?php echo $this->session->flashdata('message');
	