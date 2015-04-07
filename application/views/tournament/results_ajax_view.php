<?php 
	$first=TRUE;
	if (isset($results) && $results != NULL)
	{
		foreach ($results as $key => $result_cat) {
		
			//var_dump($results);
			//die();
			if ($result_cat != NULL)
			{ 
				if ($first)
				{
					echo '<h2>'.substr($result_cat['0']['name'], 4).' '.$result_cat['0']['sanction'].' ('.date('F d, Y', strtotime($result_cat['0']['date'])).')</h2>';
					$first=FALSE;
				}
				echo '<h3> <i class="fa fa-angle-right"></i> '.$result_cat['0']['category'].'</h3>'; ?>
				<table id="results-table" class="statistics table-row-diff">
				<tr>
					<?php 
						echo '<tr> 
								<th>Rank</th>
								<th>Player</th>';
					 	for ($i=1; $i<=$result_cat['0']['nmbr_of_round'];$i++)
					 	{
					 		echo '<th>'.$i.' <span>('.$result_cat['0']['no_bskts_'.$i].')</span></th>';
					 	}																//header of table
					 	echo '<th>Total</th>';
					 	for ($i=1; $i<=$result_cat['0']['nmbr_of_fnl_laps'];$i++)
					 	{
					 		echo '<th>Final'.$i.'<span>('.$result_cat['0']['no_final_'.$i].')</span></th>';
					 	}

					 	echo '<th>Total</th>
					 		</tr>';
					 	
					 	foreach ($result_cat as $key=>$row_array)
					 	{
					 		echo '<tr>';
					 		echo '<td class="text-center" >'.$row_array['rank'].'</td>';
					 		echo '<td>'.anchor('/tournaments/view_individual_results/'.$row_array['user_id'], $row_array['first_name'].' '.$row_array['last_name'], 'target="_blank"').'</td>';
					 		$total = 0;
					 		for ($i=1; $i<=$row_array['nmbr_of_round'];$i++)
					 		{
					 			if ($row_array['lap_'.$i] == NULL || $row_array['lap_'.$i] == '0')
					 			{
					 				echo '<td class="text-center" ><i class="fa fa-times-circle-o"></i></td>';
					 			} 
					 			else 
					 			{
					 				echo '<td class="text-center" >'.$row_array['lap_'.$i].'</td>';
					 				$total = $total + $row_array['lap_'.$i];
					 			}
					 		}
					 		echo '<td class="text-center" >'.$total.'</td>';

					 		for ($i=1; $i<=$row_array['nmbr_of_fnl_laps'];$i++)
					 		{	
					 			if ($row_array['final_'.$i] == NULL || $row_array['final_'.$i] == '0')
					 			{
					 				echo '<td class="text-center" ><i class="fa fa-times-circle-o"></i></td>';
					 			} 
					 			else 
					 			{	
					 				$total = $total + $row_array['final_'.$i];
					 				echo '<td class="text-center" >'.$row_array['final_'.$i].'</td>';
					 			}
					 			
					 		}
					 		$i = $i-1;
					 		if ($row_array['final_'.$i] != NULL)
					 		{
					 			echo '<td class="text-center" >'.$total.'</td>';
					 		}else{
					 			echo '<td class="text-center" ><i class="fa fa-times-circle-o"></i></td>';
					 		}

					 		echo '</tr>';
					 	}
					 	
					echo '</table>';
				}
		 }
	}
	//print_r($results); ?>