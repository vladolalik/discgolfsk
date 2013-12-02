<?php $this->load->view('header', array('title' => 'Tournaments', 'caption' => 'Tournaments')); ?>
<div id="container">
	
	
 <?php echo form_open('tournaments/view_results'); ?>
<select name="tournaments" multiple>
  <option value='ALL' selected = 'selected'> ALL TOURNAMENTS </option>
  <?php foreach($tournaments as $row): 
 	echo '<option value="'.$row['tournament_id'].'">'.$row['name'].' ('.$row['date'].'), '.$row['location'].'</option>';
   endforeach; ?>
</select>

<select name="players" multiple>
  <option value='ALL' selected = 'selected'> ALL PlAYERS </option>
  <?php
  	foreach($users as $row): 
  		echo '<option value="'.$row['id'].'">'.$row['last_name'].' '.$row['first_name'].'</option>';
  	endforeach;
  ?>
</select>


<input type="submit">
<?php echo form_close(); ?>

<table class="Statistics">
	<tr>
		<th> Player </th>
	<?php 

		for ($i=0; $i<$results[0]['nmbr_of_round']; $i++)
		{
			echo '<th>'.$results[$i]['nmbr_of_bskts'].'</th>';
		}
		echo '<th></th>';
		echo '<th>'.$results[$i+1]['nmbr_of_bskts'].'</th>';

	?>

	</tr>
	<?php 
		$lap = 0;
		echo '</tr>';
		$id = $results[0]['user_id'];
		$last_key = 0;
		$sum = 0;
		echo '<tr>
				<td>'.$results[0]['first_name'].' '.$results[0]['last_name'].'</td>';
		foreach($results as $key => $row_array)
		{
			if ($id != $row_array['user_id']){
				echo '<td>'.$results[$key-1]['result'].'</td>';
				echo '</tr>';
				$id = $row_array['user_id'];
				$lap = 1;
				echo '<tr>
						<td>'.$row_array['first_name'].' '.$row_array['last_name'].'</td>
					    <td>'.$row_array['points'].'</td>';		
			} else {
				if ($row_array['final'] == 1)
				{
					echo '<td>'.$sum.'</td>';
					$sum = 0;
				}
				echo '<td>'.$row_array['points'].'</td>';
				$sum = $sum + $row_array['points'];
				
			}
			$last_key = $key;			
		}
		echo '<td>'.$results[$last_key]['result'].'</tr>';

	?>
</table>
<?php print_r($results); ?>
  
  
</div>
</body>
</html>