<!DOCTYPE HTML>
<html>
<body>
<nav>
	<ul>
		<li><?php echo anchor('auth/inactive_players', 'Players', 'title="Players"'); ?> </a> 
			<ul> 
				<li><?php echo anchor('auth/inactive_players', 'Activate new players', 'title="Activate new players"'); ?> </li>
				<li><?php echo anchor('auth/admin_get_autocreated_profile', 'Autocreated profiles', 'title="Auto created profiles"'); ?> </li>
		</li>
	</ul>
</nav>