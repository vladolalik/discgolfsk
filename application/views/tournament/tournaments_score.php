<?php $this->load->view('header', array('title' => 'Ranking ', 'caption' => 'Ranking')); ?>
<?php 
	print_r($women);
	if ($women!=NULL)
	{
		echo '<h2>'.$women['0']['first_name'].' '.$women['0']['last_name'].'</h2>';
		echo '<h3>Total score: '.round($women['0']['year_score'],2).'</h3>';
		echo '<h3>Score in Slovak championship: '.round($women['0']['slovak_champ_score'],2).'</h3>';
		
		echo '<table id="results-table"  class="statistics table-row-diff">
					<tr>
						<th>Rank</th>
						<th>Date</th>
						<th>Tournament</th>
						<th>Score</th>
						<th>Category</th>
					</tr>';
		foreach ($women as $key => $value) {
			echo '<tr>
					<td class="text-center">'.$value['rank'].'</td>
					<td class="text-center">'.date('F d, Y', strtotime($value['date'])).'</td>
					<td class="text-center">'.$value['name'].'</td>
					<td class="text-center">'.round($value['score'],2).'</td>
					<td class="text-center">'.$value['category'].'</td>
				  </tr>';
		}
		echo '</table>';
	}
$this->load->view('footer'); ?>