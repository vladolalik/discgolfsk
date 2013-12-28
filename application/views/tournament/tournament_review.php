<div class="tournament-review">
		<h3><?php echo $name; ?></h3>
		<div class="tournament-picture"><?php echo '<img src="'.PATH_TO_TOURNAMENT_THUMB.$thumb.'" title="tournament_avatar_'.$name.'" />'; ?> </div>
		<div class="tournament-info">
			<p><span class="att">Date: </span><?php echo $date; ?></p>
			<p><span class="att">Location: </span><?php echo $location; ?></p>
			<p><span class="att">Number of rounds: </span><?php echo $nmbr_of_round; ?></p>
			<p><span class="att">Number of final rounds: </span><?php echo $nmbr_of_fnl_laps; ?></p>
		</div>
		<br class="clear"/>
		<a class="button" href="<?php echo base_url()?>index.php/tournaments/tournament_details/<?php echo $tournament_id; ?>">Details</a>
</div>
