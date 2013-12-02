<?php $this->load->view('header', array('title' => 'Tournaments', 'caption' => 'Tournaments')); ?>
<div id="container">
	
	
 <?php echo form_open('tournaments/t_list'); ?>
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
		<th> Lap </th>
	<?php 

		foreach($results as $row_array)
		{
				echo '<tr>
						<td>'.$row_array['first_name'].' '.$row_array['last_name'].'</td>
						<td>'.$row_array['result'].' '.$row_array['points'].'</td>
					  </tr>';
			
		}

	?>
</table>
<?php print_r($results); ?>
  
  
</div>
</body>
</html>