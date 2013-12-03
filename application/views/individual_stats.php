<!-- author Vlado Lalik -->
<?php $this->load->view('header', array('title' => 'Results', 'caption' => $results['0']['first_name'].' '.$results['0']['last_name'])); ?>
<?php //print_r($results); ?>

<div id="thumb"><?php echo '<img src="'.PATH_TO_USERS_AVATAR.$thumb.'" width="128px" title="profile_picture_'.$last_name.'" />'; ?> </div>
<h2> <?php echo $first_name.' '.$last_name; ?> </h2>
<table class="my_profile">
	<tr>
		<th>Country</th>
		<td><?php echo $country; ?></td>
	</tr>
	<tr>
		<th>Gender</th>
		<td><?php echo $gender; ?></td>
	</tr>
	<tr>
		<th>Club</th>
		<td><?php echo $club; ?></td>
	</tr>
	<tr>
		<th>About</th>
		<td><?php echo $about; ?></td>
	</tr>
</table>


<?php
			foreach($results as $key=>$row)
			{
				echo '<h2>Tournament: '.$row['name'].' ('.$row['date'].')</h2>';
				echo '<table border="1px">';
				echo '<tr> 
						<th>Rank</th>';
			 	for ($i=1; $i<=$row['nmbr_of_round'];$i++)
			 	{
			 		echo '<th>Round '.$i.' ('.$row['no_bskts_'.$i].')</th>';
			 	}																//header of table
			 	echo '<th>Total</th>';
			 	for ($i=1; $i<=$row['nmbr_of_fnl_laps'];$i++)
			 	{
			 		echo '<th>Final round '.$i.' ('.$row['no_final_'.$i].')</th>';
			 	}

			 	echo '<th>Total</th>
			 		</tr>';
	
			 	echo '<tr>';
			 	echo '<td>'.$row['rank'].'</td>';
			 	//echo '<td>'.$row['first_name'].' '.$row['last_name'].'</td>';
			 	$total = 0;
			 	for ($i=1; $i<=$row['nmbr_of_round'];$i++)
			 	{
			 		if ($row['lap_'.$i] == NULL)
			 		{
			 			echo '<td>--</td>';
					} 
			 		else 
			 		{
			 			echo '<td>'.$row['lap_'.$i].'</td>';
			 			$total = $total + $row['lap_'.$i];
			 		}
				}
			 	echo '<td>'.$total.'</td>';

				for ($i=1; $i<=$row['nmbr_of_fnl_laps'];$i++)
			 	{	
			 		if ($row['final_'.$i] == NULL)
			 		{
			 			echo '<td>--</td>';
			 		} 
			 		else 
			 		{	
			 			$total = $total + $row['final_'.$i];
			 			echo '<td>'.$row['final_'.$i].'</td>';
			 		}	
			 		
			 	}
			 	$i = $i-1;
			 	if ($row['final_'.$i] != NULL)
			 	{
			 		echo '<td>'.$total.'</td>';
			 	}

			 	echo '</tr>';
			 	echo '</table>';
			 }

?>