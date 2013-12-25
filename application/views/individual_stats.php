<!-- author Vlado Lalik -->
<?php $this->load->view('header', array('title' => 'Results', 'caption' => $results['0']['first_name'].' '.$results['0']['last_name'])); ?>
<?php //print_r($results); ?>

<div id="profile-thumb"><?php echo '<img src="'.PATH_TO_USERS_AVATAR.$thumb.'" width="128px" title="profile_picture_'.$last_name.'" />'; ?> </div>
<table id="my-profile-table">
	<tr>
		<th>Country: </th>
		<td><?php echo $country; ?></td>
	</tr>
	<tr>
		<th>Gender: </th>
		<td><?php echo $gender; ?></td>
	</tr>
	<tr>
		<th>Club: </th>
		<td><?php echo $club; ?></td>
	</tr>
	<tr>
		<th>About: </th>
		<td><?php echo $about; ?></td>
	</tr>
</table>
<div class="clear">&nbsp;</div>


<?php
			//print_r($laps);
			//print_r($results);
			foreach($results as $key => $row)
			{
				echo '<h2>Tournament: '.$row['name'].' ('.$row['date'].')</h2>';
				echo '<h3>Category: '.$row['category'].'</h3>';
				echo '<table class="profile-table">';
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

			 	if ($laps!=NULL)
				{
				 	// lap statistics
				 	echo '<table border="1px">
				 							<tr>
				 								<th>Basket no.</th>
				 								<th>1</th>
				 								<th>2</th>
				 								<th>3</th>
				 								<th>4</th>
				 								<th>5</th>
				 								<th>6</th>
				 								<th>7</th>
				 								<th>8</th>
				 								<th>9</th>
				 								<th>10</th>
				 								<th>11</th>
				 								<th>12</th>
				 								<th>13</th>
				 								<th>14</th>
				 								<th>15</th>
				 								<th>16</th>
				 								<th>17</th>
				 								<th>18</th>
				 								<th>19</th>
				 								<th>20</th>
				 							</tr>';


				 	// normal laps
				 
				 	for ($i = 1; $i <= $row['nmbr_of_round']; $i++ )
				 	{	
				 		if ($i==1)
				 		{
					 		$par = '<tr><th>Par</th>';
					 		$stats = '<tr><th> Round 1</th>';
					 	} 
					 	else 
					 	{
					 		echo '<tr><th>Round '.$i.'</th>';
					 	}
					 	$count = 1; // pocitadlo kol, aby som mohol vypisat par pre vsetky kose 
				 		foreach ($laps as $key => $value) 
				 		{
				 			if ($row['tournament_id'] == $value['tournament_id'] && $value['final']==NULL)
				 			{
					 			if ($i == 1 && $value['count'] == $count)
					 			{
					 				$par = $par.'<td>'.$value['par'].'</td>';
					 				$count++;
					 				if ($value['number'] == $i)
					 				{
					 					$stats  = $stats.'<td>'.$value['shots'].'</td>';
					 				}
					 			}
					 			else if ($value['number'] == $i)
					 			{
					 				echo '<td>'.$value['shots'].'</td>';
					 			}
					 		}
				 		}
				 		if ($i == 1){
				 			echo $par.'</tr>';
				 			echo $stats.'</tr>';
				 		}
				 	}

				 	//final laps
				 	for ($i = 1; $i <= $row['nmbr_of_fnl_laps']; $i++ )
				 	{	
				 		echo '<tr><th>Final round '.$i.'</th>';
				 		foreach ($laps as $key => $value) 
				 		{
				 			if ($row['tournament_id'] == $value['tournament_id'] && $value['number'] == $i && $value['final']==1)
				 			{
				 				echo '<td>'.$value['shots'].'</td>';
				 			}
				 		}
				 		echo '</tr>';
				 	}
				 	echo '</table>';
				}
			 }

?>