<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title><?php echo $title; ?></title>
 
<link rel="stylesheet" href="<?= base_url() ?>assets/css/style.css">
<link href='http://fonts.googleapis.com/css?family=Exo+2&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<body>
	<section id="header">
		<div class="container">
			<a href=""><img src="<?= base_url() ?>assets/img/logo.png" alt="discgolf.sk"/></a>
			<h1>Statistics 1.0</h1>
			<div class="clear">&nbsp;</div>
		</div>	
		<div class="stat-line">&nbsp;</div>	
		<div class="clear">&nbsp;</div>
	</section>

	<div class="container">
		<nav>
			<ul>

			<?php
				echo '<li>'.anchor('/tournaments/view_results', 'Results', 'title="Results"').'</li>
					 <li>'.anchor('/tournaments/view_tournaments', 'Tournaments', 'title="Tournaments"').'</li>';
				if ($this->tank_auth->is_logged_in(TRUE))
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
					else 
					{
						echo '<li>'.anchor('/auth/login', 'Login', 'title="login"').'</li>
							  <li>'.anchor('/auth/register', 'Register', 'title="register"').'</li>
							  <li>'.anchor('/auth/get_autocreated_profile', 'Find yourself', 'title="Find your name in autocreated profiles and get your profile"').'</li>';
							  
					}

			?>
			</ul>
		</nav>

		<?php 	echo '<div id="content">';
			  	echo $this->session->flashdata('message');
			  	echo '<h1>'.$caption.'</h1>';
		?>
	