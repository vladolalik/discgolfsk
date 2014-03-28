<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title><?php echo $title; ?></title>
 
<link rel="stylesheet" href="<?= base_url() ?>assets/css/style.css">
<link href='http://fonts.googleapis.com/css?family=Exo+2&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<?php include_once("analytics_script.php") ?>
<!-- DATEPICKER jQuery UI -->
<link href="<?= base_url() ?>assets/css/jquery-ui-1.10.3.custom.css" rel="stylesheet">
<script src="<?= base_url() ?>assets/js/jquery-1.9.1.js"></script>
<script src="<?= base_url() ?>assets/js/jquery-ui-1.10.3.custom.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">

<script>
	$(function() {
	    $( "#date, #birth_date" ).datepicker({
	      dateFormat: 'yy-mm-dd',
	      changeMonth: true,
	      changeYear: true
	    });
	    // getter
		var yearRange = $( "#birth_date" ).datepicker( "option", "yearRange" );
 
		// setter
		$( "#birth_date" ).datepicker( "option", "yearRange", "c-50:+1" );
	});

	
</script>
</head> 
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
				echo '<li>'.anchor('/tournaments/view_results', 'NAVIGATION', 'title="NAVIGATION", id="navigation-header"').'</li>';
				echo '<li>'.anchor('/tournaments/view_results', '<i class="fa fa-bar-chart-o"></i> Results', 'title="Results"').'</li>'.
					 '<li>'.anchor('/tournaments/year_ranking', '<i class="fa fa-signal"></i> Ranking', 'title="Ranking"').'</li>'.
					 '<li>'.anchor('/tournaments/slovak_DG_league', '<i class="fa fa-trophy"></i> Slovak DG League', 'title="Slovak championship"').'</li>'.
					 '<li>'.anchor('/tournaments/view_tournaments', '<i class="fa fa-sitemap"></i> Tournaments', 'title="Tournaments"').'</li>'.
					 '<li>'.anchor('tournaments/registered_players', '<i class="fa fa-book"></i>Registered players', 'title="Registered players"').'</li>';
				if ($this->tank_auth->is_logged_in(TRUE))
					{
						echo '<li>'.anchor('auth/my_profile', '<i class="fa fa-user"></i> My profile', 'title="profile"').' 
									<ul>
										<li>'.anchor('/auth/do_upload', '<i class="fa fa-angle-right"></i> Change profile picture', 'title="Change profile picture"').'</li>
										<li>'.anchor('/auth/update_profile', '<i class="fa fa-angle-right"></i> Update profile', 'title="Update"').'</li>
										<li>'.anchor('/auth/change_email', '<i class="fa fa-angle-right"></i> Change email', 'title="Change profile"').'</li>
										<li>'.anchor('/auth/change_password', '<i class="fa fa-angle-right"></i> Change password', 'title="Change password"').'</li>
									</ul>
							  </li>';
						if ($this->help_functions->is_admin())
						{
							echo '<li>'.anchor('/auth/admin_get_all_players', '<i class="fa fa-cogs"></i>Administration', 'title="Administration"').'</li>';
						}
						echo  '<li>'.anchor('/auth/logout', '<i class="fa fa-lock"></i> Logout', 'title="Logout"');	
					} 
					else 
					{
						echo '<li>'.anchor('/auth/login', '<i class="fa fa-key"></i> Login', 'title="login"').'</li>
							  <li>'.anchor('/auth/register', '<i class="fa fa-sign-in"></i> Register', 'title="register"').'</li>
							  <li>'.anchor('/auth/get_autocreated_profile', '<i class="fa fa-eye"></i> Find yourself', 'title="Find your name in autocreated profiles and get your profile"').'</li>';
							  
					}

			?>
			</ul>
		</nav>

		<section id="content">
		<h1><?php echo $caption; ?></h1>
		<div id="flash-data">
			<?php echo $this->session->flashdata('message'); ?>
		</div>
