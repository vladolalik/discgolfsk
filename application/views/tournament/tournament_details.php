
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
		<div id="regist_form">
			<?php
				//if ($will=='1' && $allow_registration=='1')
				//{	


					$option_acc=array(
						'name'=>'accommodation',
						'id'=>'accommodation',
						'value'=>'1';
					);

					$option_food=array(
						'name'=>'nutrition',
						'id'=>'nutrition',
						'value'=>'1';
					);

					echo form_open('/tournaments/tournament_details/'.$tournament_id); ?>

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


					<?php echo form_close();
				//} 
			?>

		</div>


	</div>

 