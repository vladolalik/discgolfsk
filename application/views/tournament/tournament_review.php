<div class="tournament-review">
		<h3><?php echo $name; ?></h3>
		<div class="tournament-picture"><a href="<?php echo base_url()?>index.php/tournaments/tournament_details/<?php echo $tournament_id; ?>"><?php echo '<img src="'.PATH_TO_TOURNAMENT_THUMB.$thumb.'" title="tournament_avatar_'.$name.'" />'; ?> </a></div>
		<div class="tournament-info">
			<p><span class="att">From: </span><?php echo date('F d, Y', strtotime($date)); ?></p>
			<p><span class="att">To: </span><?php echo date('F d, Y', strtotime($date_to)); ?></p>
			<p><span class="att">Location: </span><?php echo $location; ?></p>
			<p><span class="att">Capacity: </span><?php echo $capacity; ?></p>
			<p><span class="att">Director </span></p>
			<ul style="margin-left:25px;">
				<li><span class="att">Name: </span><?php echo $dir_name;?></li>
				<li><span class="att">Phone: </span><?php echo $dir_phone;?></li>
				<li><span class="att">Email: </span><?php echo $dir_email;?></li>
			</ul>	
			<p><span class="att">Number of rounds: </span><?php echo $nmbr_of_round; ?></p>
			<p><span class="att">Number of final rounds: </span><?php echo $nmbr_of_fnl_laps; ?></p>

		</div>
		<br class="clear"/>
		<a class="button" style="margin-top:10px;" href="<?php echo base_url()?>index.php/tournaments/tournament_details/<?php echo $tournament_id; ?>">Details</a>
</div>
