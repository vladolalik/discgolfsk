
<?php  $this->load->view('header', array('title'=>$name.' ('.date('F d, Y', strtotime($date)).')', 'caption'=>$name.' ('.date('F d, Y', strtotime($date)).')')); ?>
	<?php if ($lat!=NULL && $lng!=NULL) 
		{?>
				<script type="text/javascript"
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIpi1dR8C9bQijGV6L3nC7xxwKNI2sCDA&sensor=false">
		    </script>
		    	</script>
				<script>
					var myCenter=new google.maps.LatLng(<?php echo $lat  ?>,<?php echo $lng ?>);
					var marker;

					function initialize()
					{
					var mapProp = {
					  center:myCenter,
					  zoom:15,
					  mapTypeId:google.maps.MapTypeId.HYBRID
					  };

					var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

					marker=new google.maps.Marker({
					  position:myCenter,
					  icon:"<?= base_url() ?>assets/img/map-pointer.png",
					  animation:google.maps.Animation.BOUNCE
					  });

					marker.setMap(map);
					}

					google.maps.event.addDomListener(window, 'load', initialize);
				</script>
	<?php } ?>
	<div class="tournament-review">
		<div class="tournament-picture"><?php echo '<a href="'.PATH_TO_TOURNAMENT_THUMB.$photo.'" ><img src="'.PATH_TO_TOURNAMENT_THUMB.$thumb.'"  title="tournament_avatar_'.$name.'" /></a>'; ?> </div>
		<div class="tournament-info">
			<p><span class="att">Date: </span><?php echo date('F d, Y', strtotime($date)); ?></p>
			<p><span class="att">Location: </span><?php echo $location; ?></p>
			<p><span class="att">Number of rounds: </span><?php echo $nmbr_of_round; ?></p>
			<p><span class="att">Number of final rounds: </span><?php echo $nmbr_of_fnl_laps; ?></p>
		</div>
		<br class="clear" />
		<div id="about">
			<div>About:</div>
			<?php echo $about; ?>
		</div>
   		<div id="googleMap" style="width:650px;height:380px;"></div>
		<div id="regist_form">
			<?php
			//print_r($will);
				if ($this->tank_auth->is_logged_in() && $will=='1' && $allow_registration=='1')
				{	


					$option_acc=array(
						'name'=>'accommodation',
						'id'=>'accommodation',
						'value'=>'1'
					);

					$option_food=array(
						'name'=>'nutrition',
						'id'=>'nutrition',
						'value'=>'1'
					); ?>

					<fieldset>
					<legend>Tournament data</legend>
					<?php echo form_open('/tournaments/tournament_details/'.$tournament_id); ?>
						<input type="hidden" value="<?php echo $tournament_id; ?>" name="tournament_id" id="tournament_id"/>
						<table>
							<tr>
								<td><?php echo form_label('Category', 'category_id'); ?></td>
								<?php
									echo '<td><select name="category_id" id="category_id" >';
									foreach ($categories as $row)
									{
										echo '<option value="'.$row['category_id'].'">'.$row['category'].'</option>';
									}
									echo '</select></td>'; 
								?>
								<td style="color: red;"><?php echo form_error('category'); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Accommodation', $option_acc['id']); ?></td>
								<td><?php echo form_checkbox($option_acc); ?></td>
								<td style="color: red;"><?php echo form_error($option_acc['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Food', $option_food['id']); ?></td>
								<td><?php echo form_checkbox($option_food); ?></td>
								<td style="color: red;"><?php echo form_error($option_food['name']); ?></td>
							</tr>
						</table>
					
					<?php 
						echo form_submit('register', 'Register');
						echo form_close();
					?>
					</fieldset>
			<?php
				} 
				else if  (!$this->tank_auth->is_logged_in())
				{
					echo '<div class="notice"><p> You must '.anchor('/auth/login/', 'login', 'title="login"').' or '.anchor('/auth/register', 'register', 'title="register"').' if you want register for tournament</p></div>';
				}
			?>

		</div>


	</div>
	<?php  $this->load->view('footer'); ?>

 