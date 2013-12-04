<div id="tornament_review">
	<div id="thumb">
		<div id="thumb"><?php echo '<img src="'.PATH_TO_TOURNAMENT_THUMB.$thumb.'" height="300px" title="tournament_avatar_'.$name.'" />'; ?> </div>
		<div id="tourn_info">
			<h3><?php echo $name; ?></h3>
			<p><span class="att">Date: </span><?php echo $date; ?></p>
			<p><span class="att">Location: </span><?php echo $location; ?></p>
			<p><span class="att">Number of rounds: </span><?php echo $nmbr_of_round; ?></p>
			<p><span class="att">Number of final rounds: </span><?php echo $nmbr_of_fnl_laps; ?></p>
			<a href="<?php echo base_url()?>index.php/tournaments/tournament_details/<?php echo $tournament_id; ?>">Details about tournament</a>
		</div>
</div>