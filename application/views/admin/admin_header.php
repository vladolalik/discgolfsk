<!DOCTYPE HTML>
<html>
<HEAD>
  <TITLE><?php echo $title; ?></TITLE>
  	      	<script type="text/javascript" src="http://localhost/discgolf/tinymce/tinymce.min.js"></script>
			<script type="text/javascript">
				tinymce.init({
    			selector: "textarea.tinymc"
 				});
			</script>
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
		<li><?php echo anchor('tournaments/admin_view_tournaments', 'Tournaments', 'title="Tournaments"'); ?> 
			<ul>
				<li><?php echo anchor('tournaments/admin_add_tournament', 'Add new tournament', 'title="Add new tournament"'); ?></li>
				<li><?php echo anchor('tournaments/import', 'Import tournament', 'title="Add new tournament"'); ?></li>
			</ul>
		</li>
		<li><?php echo anchor('', 'Home', 'home'); ?> </li>
		<li><?php echo anchor('auth/logout', 'Logout', 'title="Logout"');?> </li>
	</ul>		
</nav>
<body>
<div id="content">
<?php echo $this->session->flashdata('message'); ?>
<h1><?php echo $caption; ?></h1>