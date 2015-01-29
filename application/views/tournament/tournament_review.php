<?php 
		$date_tourn = new DateTime($date);
		$date_now = new DateTime('now');
		if ($reg_date!=null){
			$reg_date_time = new DateTime($reg_date);
			$interval = $reg_date_time->diff($date_now);
			$will_reg = $interval->invert;	
		}
		$interval = $date_tourn->diff($date_now);
		$will = $interval->invert;
?>

<div class="tournament-review">
		<h3><?php echo $name; ?></h3>
		<div class="tournament-picture"><a href="<?php echo base_url()?>index.php/tournaments/tournament_details/<?php echo $tournament_id; ?>"><?php echo '<img src="'.PATH_TO_TOURNAMENT_THUMB.$thumb.'" title="tournament_avatar_'.$name.'" />'; ?> </a></div>
		<div class="tournament-info">
			<p><span class="att">From: </span><?php echo date('F d, Y', strtotime($date)); ?></p>
			<p><span class="att">To: </span><?php echo date('F d, Y', strtotime($date_to)); ?></p>
			<p><span class="att">Location: </span><?php echo $location; ?></p>
			<p><span class="att">Capacity: </span><?php echo $capacity; ?></p>
			<p><span class="att">Director </span><?php echo $dir_name;?></p>
			<p><span class="att">Registration:</p>
			<ul style="margin-left:25px;">
				<?php 
					if ($allow_registration == 0){
						echo '<li>Not allowed</li>';
					} else if($will == 0){
						echo '<li>Closed</li>';
					} else if ($reg_date!= null && $will_reg == 1) {
						echo '<li><span class="att">Will open: </span>'.date('F d, Y', strtotime($reg_date)).'</li>';
					} else {
						echo '<li><span class="att">Open</span></li>';
					}
				 ?>
			</ul>		
			

		</div>
		<br class="clear"/>
		<a class="button" style="margin-top:10px;" href="<?php echo base_url()?>index.php/tournaments/tournament_details/<?php echo $tournament_id; ?>">Details</a>
</div>
