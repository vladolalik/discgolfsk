<!-- autor Vlado Lalik -->
<?php $this->load->view('header', array('title' => 'Tournaments', 'caption' => 'Tournaments')); ?>
<div id="container">
	
	
 <?php echo form_open('tournaments/view_results'); ?>
<select name="tournaments" multiple>
  <?php foreach($tournaments as $row): 
 	echo '<option value="'.$row['tournament_id'].'"'. set_select('tournaments', $row['tournament_id']).'>'.$row['name'].' ('.$row['date'].'), '.$row['location'].'</option>';
   endforeach; ?>
</select>

<select name="players" multiple>
  <option value='ALL' <?php echo set_select('players', 'ALL', TRUE);?>> ALL PLAYERS </option>
  <?php
  	foreach($users as $row): 
  		echo '<option value="'.$row['user_id'].'"'. set_select('players', $row['user_id']).'>'.$row['last_name'].' '.$row['first_name'].'</option>';
  	endforeach;
  ?>
</select>
<select name="categories" multiple>
  <?php
  	var_dump($categories);
  	foreach($categories as $row): 
  		echo '<option value="'.$row['category_id'].'"'. set_select('categories', $row['category_id']).'>'.$row['category'].'</option>';
  	endforeach;
  ?>
</select>

<input type="submit">
<?php echo form_close(); ?>
<?php 
	if ($results != NULL)
	{
		//var_dump($results);
		//die();
		echo '<h1>'.$results['0']['name'].' ('.$results['0']['date'].')</h1>';
		echo '<h2>'.$results['0']['category'].'</h2>'; ?>
		<table class="Statistics" border="1px">
		<tr>
			<?php 
			if ($results != NULL)
			{
				echo '<tr> 
						<th>Rank</th>
						<th>Player</th>';
			 	for ($i=1; $i<=$results['0']['nmbr_of_round'];$i++)
			 	{
			 		echo '<th>Round '.$i.' ('.$results['0']['no_bskts_'.$i].')</th>';
			 	}																//header of table
			 	echo '<th>Total</th>';
			 	for ($i=1; $i<=$results['0']['nmbr_of_fnl_laps'];$i++)
			 	{
			 		echo '<th>Final round '.$i.' ('.$results['0']['no_final_'.$i].')</th>';
			 	}

			 	echo '<th>Total</th>
			 		</tr>';
			 	
			 	foreach ($results as $key=>$row_array)
			 	{
			 		echo '<tr>';
			 		echo '<td>'.$row_array['rank'].'</td>';
			 		echo '<td>'.anchor('/tournaments/view_individual_results/'.$row_array['user_id'], $row_array['first_name'].' '.$row_array['last_name'], 'target="blank"').'</td>';
			 		$total = 0;
			 		for ($i=1; $i<=$row_array['nmbr_of_round'];$i++)
			 		{
			 			if ($row_array['lap_'.$i] == NULL)
			 			{
			 				echo '<td>--</td>';
			 			} 
			 			else 
			 			{
			 				echo '<td>'.$row_array['lap_'.$i].'</td>';
			 				$total = $total + $row_array['lap_'.$i];
			 			}
			 		}
			 		echo '<td>'.$total.'</td>';

			 		for ($i=1; $i<=$row_array['nmbr_of_fnl_laps'];$i++)
			 		{	
			 			if ($row_array['final_'.$i] == NULL)
			 			{
			 				echo '<td>--</td>';
			 			} 
			 			else 
			 			{	
			 				$total = $total + $row_array['final_'.$i];
			 				echo '<td>'.$row_array['final_'.$i].'</td>';
			 			}
			 			
			 		}
			 		$i = $i-1;
			 		if ($row_array['final_'.$i] != NULL)
			 		{
			 			echo '<td>'.$total.'</td>';
			 		}

			 		echo '</tr>';
			 	}
			 	
			}

			?>
		</table>
<?php }
	//print_r($results); ?>
  
  
</div>
</body>
</html>