<!DOCTYPE HTML>
<html>
<HEAD>
  <TITLE><?php echo $title; ?></TITLE>
</HEAD>
<body>
<nav>
	<ul>
		<li><?php echo anchor('auth/admin_get_all_players', 'Players', 'title="Players"'); ?> </a> 
			<ul> 
				<li><?php echo anchor('auth/admin_get_inactive_players', 'Activate new players', 'title="Activate new players"'); ?> </li>
				<li><?php echo anchor('auth/admin_get_autocreated_profile', 'Autocreated profiles', 'title="Auto created profiles"'); ?> </li>
			</ul>
		</li>
		<li><?php echo anchor('', 'Home', 'home'); ?> </li>
		<li><?php echo anchor('auth/logout', 'Logout', 'title="Logout"');?> </li>
	</ul>		

</nav>
<div id="content">
<?php echo $this->session->flashdata('message'); ?>
<h1><?php echo $caption; ?></h1>