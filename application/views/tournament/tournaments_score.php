<?php $this->load->view('header', array('title' => 'Ranking ', 'caption' => 'Ranking')); ?>
<?php 

	if ($score!=NULL)
	{
		echo '<h2>'.$score['0']['first_name'].' '.$score['0']['last_name'].'</h2>';
		echo '<h3>Total score: '.round($score['0']['year_score'],2).'</h3>';
		echo '<h3>Score in Slovak championship: '.round($score['0']['slovak_champ_score'],2).'</h3>';
		
		echo '<table border="1px">
					<tr>
						<th>Date</th>
						<th>Tournament</th>
						<th>Score</th>
						<th>Rank</th>
					</tr>';
		foreach ($score as $key => $value) {
			echo '<tr>
					<td>'.$value['date'].'</td>
					<td>'.$value['name'].'</td>
					<td>'.round($value['score'],2).'</td>
					<td>'.$value['rank'].'</td>
				  </tr>';
		}
		echo '</table>';
	}