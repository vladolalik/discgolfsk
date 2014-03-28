
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

		<br class="clear" />
		<p><b><?php echo anchor('tournaments/registered_players/'.$tournament_id, 'View all registered players for this tournament.', 'title="Registered players"');?></b></p>	
		<div id="about">
			<div>About:</div>
			<?php echo $about; ?>
		</div>
   		<div id="googleMap" style="width:650px;height:380px;"></div>
   		<div id="regist_form" style="margin-top:10px;">
			<?php
			//print_r($will);
				if ($this->tank_auth->is_logged_in() && $will=='1' && $allow_registration=='1')
				{	

					if ($options!=NULL)
					{
						foreach($options as $value){
							if ($value['type'] == 'food'){
								$food_opt[$value['option_id']]=$value['what'];
							} else {
								$accom_opt[$value['option_id']]=$value['what'];
							}
						}
					}

					$note = array (
						'id' => 'note',
						'name' => 'note',
						'value' => set_value('note'),
						'style' => 'max-width:400px'
					);

					$phone = array (
						'id' => 'phone',
						'name' => 'phone',
						'value' => set_value('phone'),
					);

					$pdga_membership = array (
						'id' => 'pdga_membership',
						'name' => 'pdga_membership',
						'value' => set_value('pdga_membership')
					);


					?>

					<fieldset>
					<legend>Registration form</legend>
					<?php echo form_open('/tournaments/tournament_details/'.$tournament_id); ?>
						<input type="hidden" value="<?php echo $tournament_id; ?>" name="tournament_id" id="tournament_id"/>
						<table>
							<tr>
								<td><?php echo form_label('Category', 'category_id'); ?></td>
								<?php
									echo '<td><select name="category_id" id="category_id" >';
									foreach ($categories as $row)
									{
										$checked_categories=explode(';', $allowed_reg_categories);
										foreach ($checked_categories as $key => $checked_cat) 
										{
											if ($checked_cat==$row['category'])
											{
												echo '<option value="'.$row['category_id'].'">'.$row['category'].'</option>';
											}
										}
									}
									echo '</select></td>'; 
								?>
								<td style="color: red;"><?php echo form_error('category'); ?></td>
							</tr>
							<?php if (isset($accom_opt))
							{ ?>
								<tr>
									<td><?php echo form_label('Accommodation', 'accom'); ?></td>
									<td><?php echo form_dropdown('accom', $accom_opt, '', 'id="accom"'); ?></td>
							
									<td style="color: red;"><?php echo form_error('accom'); ?></td>
								</tr>
							<?php } ?>
							<?php if (isset($food_opt))
							{ ?>
								<tr>
									<td><?php echo form_label('Food', 'food'); ?></td>
									<td><?php echo form_dropdown('food',$food_opt,'','id="food"'); ?></td>
									<td style="color: red;"><?php echo form_error('food'); ?></td>
								</tr>
							<?php } ?>
							
							<tr>
								<td><?php echo form_label('Phone number', $phone['id']); ?></td>
								<td><?php echo form_input($phone); ?></td>
								<td style="color: red;"><?php echo form_error($phone['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Active PDGA Memberhip', $pdga_membership['id']); ?></td>
								<td><?php echo form_input($pdga_membership); ?></td>
								<td style="color: red;"><?php echo form_error($pdga_membership['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Active SAF Membership', 'active_saf'); ?></td>
								<td><select name="active_saf" id="active_saf">
										<option value="yes" <?php echo set_select('active_saf', 'yes', TRUE); ?> >Yes</option>
										<option value="no" <?php echo set_select('active_saf', 'no'); ?>>No</option>
									</select>
								</td>
								<td style="color: red;"><?php echo form_error('active_saf'); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Note', $note['id']); ?></td>
								<td><?php echo form_textarea($note); ?></td>
								<td style="color: red;"><?php echo form_error($note['name']); ?></td>
							</tr>
						</table>
					
					<?php 
						echo form_submit('register', 'Register');
						echo form_close();
					?>
					</fieldset>
			<?php
				} 
				else if(!$this->tank_auth->is_logged_in() && $will=='1' && $allow_registration=='1')
				{
					echo '<div class="notice" style="margin-top:20px; margin-bottom:20px;"><p>If you are already registered please '.anchor('/auth/login/', 'login', 'title="login"').' or '.anchor('/auth/register', 'register', 'title="register"').' if you want your to use your own profile.</p></div>';

					// registrvaci formular pre nezaregistrovanych hracov
					if ($options!=NULL)
					{
						foreach($options as $value){
							if ($value['type'] == 'food'){
								$food_opt[$value['option_id']]=$value['what'];
							} else {
								$accom_opt[$value['option_id']]=$value['what'];
							}
						}
					}

					$note = array (
						'id' => 'note',
						'name' => 'note',
						'value' => set_value('note'),
						'style' => 'max-width:400px'
					);

					$phone = array (
						'id' => 'phone',
						'name' => 'phone',
						'value' => set_value('phone'),
					);

					$pdga_membership = array (
						'id' => 'pdga_membership',
						'name' => 'pdga_membership',
						'value' => set_value('pdga_membership')
					);

					$first_name = array (
 						'id' => 'first_name',
 						'name' => 'first_name',
 						'value' => set_value('first_name'),
					);

					$last_name = array (
 						'id' => 'last_name',
 						'name' => 'last_name',
 						'value' => set_value('last_name'),
					);

					$email = array (
 						'id' => 'email',
 						'name' => 'email',
 						'value' => set_value('email'),
					);

					$club = array (
 						'id' => 'club',
 						'name' => 'club',
 						'value' => set_value('club'),
					);

					$country = array (
						'id' => 'country',
						'name' => 'country',
						'value' => set_value('country')
					);
		
					$options=array(
						'name'	=>'birth_date',
						'id'	=>'birth_date',
						'type'	=>'text',
						'value' => set_value('birth_date')
					);

					?>

					<fieldset>
					<legend>Registration form (Fields with '*' are required.)</legend>
					<?php echo form_open('/tournaments/tournament_details_unregistered/'.$tournament_id); ?>
						<input type="hidden" value="<?php echo $tournament_id; ?>" name="tournament_id" id="tournament_id"/>
						<table>
							<tr>
								<td><?php echo form_label('First name *', $first_name['id']); ?></td>
								<td><?php echo form_input($first_name); ?></td>
								<td style="color: red;"><?php echo form_error($first_name['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Last name *', $last_name['id']); ?></td>
								<td><?php echo form_input($last_name); ?></td>
								<td style="color: red;"><?php echo form_error($last_name['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Date of birth: ','date'); ?></td>
								<td><?php echo form_input($options); ?></td>
								<td style="color: red;"><?php echo form_error($options['name']) ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Email *', $email['id']); ?></td>
								<td><?php echo form_input($email); ?></td>
								<td style="color: red;"><?php echo form_error($email['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Club', $club['id']); ?></td>
								<td><?php echo form_input($club); ?></td>
								<td style="color: red;"><?php echo form_error($club['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Country', $country['id']); ?></td>
								<td><?php echo form_input($country); ?></td>
								<td style="color: red;"><?php echo form_error($country['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Phone number', $phone['id']); ?></td>
								<td><?php echo form_input($phone); ?></td>
								<td style="color: red;"><?php echo form_error($phone['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Category', 'category_id'); ?></td>
								<?php
									echo '<td><select name="category_id" id="category_id" >';
									foreach ($categories as $row)
									{
										$checked_categories=explode(';', $allowed_reg_categories);
										foreach ($checked_categories as $key => $checked_cat) 
										{
											if ($checked_cat==$row['category'])
											{
												echo '<option value="'.$row['category_id'].'">'.$row['category'].'</option>';
											}
										}
									}
									echo '</select></td>'; 
								?>
								<td style="color: red;"><?php echo form_error('category'); ?></td>
							</tr>
							<?php if (isset($accom_opt))
							{ ?>
								<tr>
									<td><?php echo form_label('Accommodation', 'accom'); ?></td>
									<td><?php echo form_dropdown('accom', $accom_opt, '', 'id="accom"'); ?></td>
							
									<td style="color: red;"><?php echo form_error('accom'); ?></td>
								</tr>
							<?php } ?>
							<?php if (isset($food_opt))
							{ ?>
								<tr>
									<td><?php echo form_label('Food', 'food'); ?></td>
									<td><?php echo form_dropdown('food',$food_opt,'','id="food"'); ?></td>
									<td style="color: red;"><?php echo form_error('food'); ?></td>
								</tr>
							<?php } ?>
							<tr>
								<td><?php echo form_label('Active PDGA Memberhip', $pdga_membership['id']); ?></td>
								<td><?php echo form_input($pdga_membership); ?></td>
								<td style="color: red;"><?php echo form_error($pdga_membership['name']); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Active SAF Membership *', 'active_saf'); ?></td>
								<td><select name="active_saf" id="active_saf">
										<option value="yes" <?php echo set_select('active_saf', 'yes', TRUE); ?> >Yes</option>
										<option value="no" <?php echo set_select('active_saf', 'no'); ?>>No</option>
									</select>
								</td>
								<td style="color: red;"><?php echo form_error('active_saf'); ?></td>
							</tr>
							<tr>
								<td><?php echo form_label('Note', $note['id']); ?></td>
								<td><?php echo form_textarea($note); ?></td>
								<td style="color: red;"><?php echo form_error($note['name']); ?></td>
							</tr>
						</table>
					
					<?php 
						echo form_submit('register', 'Register');
						echo form_close();
					?>
					</fieldset>

				<?php
				}	?>

		</div>
	</div>
	<?php  $this->load->view('footer'); ?>

 