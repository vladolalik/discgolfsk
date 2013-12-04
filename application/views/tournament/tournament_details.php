<?php  $this->load->view('header', array('title'=>$name.' ('.$date.')', 'caption'=>$name.' ('.$date.')')); ?>

	
	<div id="thumb"><?php echo '<a href="'.PATH_TO_TOURNAMENT_THUMB.$photo.'" ><img src="'.PATH_TO_TOURNAMENT_THUMB.$thumb.'" height="300px" title="tournament_avatar_'.$name.'" /></a>'; ?> </div>
	<div id="tourn_detail">
		<p><span class="att">Date: </span><?php echo $date; ?></p>
		<p><span class="att">Location: </span><?php echo $location; ?></p>
		<p><span class="att">Number of rounds: </span><?php echo $nmbr_of_round; ?></p>
		<p><span class="att">Number of final rounds: </span><?php echo $nmbr_of_fnl_laps; ?></p>
		<div id="about">
			<?php echo $about; ?>
		</div>

	</div>

 