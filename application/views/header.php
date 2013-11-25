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
						echo '<li> My profile 
									<ul>
										<li>'.anchor('/auth/update_profile', 'Update profile', 'title="Update"').'</li>
										<li>'.anchor('/auth/change_email', 'Change email', 'title="Change profile"').'</li>
										<li>'.anchor('/auth/change_password', 'Change password', 'title="Change password"').'</li>
									</ul>
							  </li>';	
					}
			?>
			</ul>
		</nav>
	