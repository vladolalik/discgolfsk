<!-- author Vlado Lalik -->
<?php $this->load->view('header', array('title' => 'Individual stats', 'caption' => $results['0']['first_name'].' '.$results['0']['last_name'])); ?>
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
<div class="clear"></div>


<?php
			//print_r($laps);
			//print_r($results);
			if ($results!=null)
			{
				foreach($results as $key => $row)
				{
					echo '<h2>Tournament: '.$row['name'].' ('.date('F d, Y', strtotime($row['date'])).')</h2>';
					echo '<h3>Category: '.$row['category'].'</h3>';
					echo '<table class="individual-stats">';
					echo '<tr class="table-head"> 
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

				 	$total_before_final = $total;

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
			
					 	// normal laps
					 	$max_count=0;
					 	$table='';
					 	$final_table='';
					 	$sum_table='';
					 	$final_sum_table='';
					 	$total_sum=0;
					 	$total_par=0;
					 	$final_total_sum=0;
				
					 	for ($i = 1; $i <= $row['nmbr_of_round']; $i++ )
					 	{	
					 		//final statistics
						 	if ($i <= $row['nmbr_of_fnl_laps'])
						 	{
							 	$final_par = '<tr class="par"><th><b>Par</b></th>';
							 	$final_stats = '<tr><th><b>Final '.$i.'</b></th>';
								$final_sum_par=0; //sum of par for each round
								$final_sum_stat=0; // sum of player results on holes
								$final_hole_number=1;
							}
							
							$par = '<tr class="par"><th><b>Par</b></th>';
						 	$stats = '<tr><th><b>Round '.$i.'</b></th>';
							$hole_number=1;
							$sum_par=0; //sum of par for each round
							$sum_stat=0; // sum of player results on holes
							
					 		foreach ($laps as $key => $value) 
					 		{
					 			if ($row['tournament_id'] == $value['tournament_id'] && ($value['final']==NULL || $value['final']=='0'))
					 			{
						 				
						 			if ($value['number'] == $i && $value['count']=$hole_number)
						 			{
						 				$sum_par=$sum_par+$value['par'];
						 				$class='';
						 				if (intval($value['par']) > intval($value['shots']))
						 				{
						 					$class='class="succes_par"';
						 				} 
						 				else if (intval($value['par']) < intval($value['shots']))
						 				{
						 					$class='class="fail_par"';
						 				}
						 				$sum_stat=$sum_stat+$value['shots'];
						 				$par = $par.'<td><b>'.$value['par'].'</b></td>';
						 				$stats  = $stats.'<td '.$class.'>'.$value['shots'].'</td>';
						 				$hole_number++;
								 		if ($hole_number>$max_count)
								 		{
								 			$max_count=$hole_number;
								 		}
						 			}
						 		}

						 		// final rounds
						 		if ($row['tournament_id'] == $value['tournament_id'] && $value['number'] == $i && $value['final']==1 && $value['count']=$final_hole_number && $i <= $row['nmbr_of_fnl_laps']) 
					 			{
					 				$cl='';
						 			if (intval($value['par']) > intval($value['shots']))
						 			{
						 				$cl='class="succes_par"';
						 			} 
						 			else if (intval($value['par']) < intval($value['shots']))
						 			{
						 				$cl='class="fail_par"';
						 			}
					 				$final_sum_par=$final_sum_par+$value['par'];
						 			$final_sum_stat=$final_sum_stat+$value['shots'];
					 				$final_par = $final_par.'<td><b>'.$value['par'].'</b></td>';
						 			$final_stats  = $final_stats.'<td '.$cl.'>'.$value['shots'].'</td>';
						 			$final_hole_number++;
							 		if ($final_hole_number>$max_count)
									{
								 		$max_count=$final_hole_number;
								 	}
					 			}

					 		}
					 		$total_sum=$total_sum+$sum_stat;
					 		$total_par=$total_par+$sum_par;
					 		$sum_table=$sum_table.'<tr class="par">
					 									<td><b>'.$sum_par.'<b></td>
					 									<td><b>'.$total_par.'</b></td>
					 							   </tr>
					 							   <tr>
					 							   		<td>'.$sum_stat.'</td>
					 							   		<td>'.$total_sum.'</td>
					 							   </tr>';
					 		$table=$table.$par.'</tr>'.$stats.'</tr>';
					 		
					 		//final statistics
					 		if ($i <= $row['nmbr_of_fnl_laps'])
					 		{	

					 			$final_total_sum=$final_total_sum + $final_sum_stat;
					 			$sum = $total_before_final + $final_total_sum;
					 			$final_sum_table=$final_sum_table.'<tr class="par">
					 													<td><b>'.$final_sum_par.'</b></td>
					 												</tr>
					 												<tr>
					 													<td>'.$final_sum_stat.'</td>
					 													<td>'.$sum.'</td>
					 												</tr>';
					 			$final_table=$final_table.$final_par.'</tr>'.$final_stats.'</tr>';
					 		}
					 		
					 	}
					 	
					 	echo '<table class="individual-stats"><tr><td>';
					 	$header='<table class="individual-stats"><tr><th><b>Hole</b></th>';
					 	for ($i=1; $i<$max_count;$i++)
					 	{
					 		$header=$header.'<th><b>'.$i.'</b></th>';
					 	}
					 	$header=$header.'</tr>';

					 	echo $header.$table.$final_table.'</table>';
					 	echo '</td><td><table class="individual-stats">
					 						<tr>
					 							<td><b>Sum</b></td>
					 							<td><b>Total</b></td>
					 						</tr>'.$sum_table.$final_sum_table.'</table>
					 			   </td>
					 		 </tr></table>';
					}
				 }
			}

?>

<?php $this->load->view('footer'); ?>