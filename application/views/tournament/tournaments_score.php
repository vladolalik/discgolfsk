<?php $this->load->view('header', array('title' => 'Ranking '.$first_name.' '.$last_name, 'caption' => 'Ranking '.$first_name.' '.$last_name)); ?>

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
 	print_r($women);
	if ($women!=NULL)
	{
		echo '<h3>Score in Slovak championship: '.round($women['0']['slovak_champ_score'],2).'</h3>';
		
		echo '<table id="results-table"  class="statistics table-row-diff">
					<tr>
						<th>Rank</th>
						<th>Date</th>
						<th>Tournament</th>
						<th>Score</th>
						<th>Category</th>
					</tr>';
	} else if ($open!=NULL)
	{
		echo '<h3>Score in Slovak championship: '.round($open['0']['slovak_champ_score'],2).'</h3>';
		
		echo '<table id="results-table"  class="statistics table-row-diff">
					<tr>
						<th>Rank</th>
						<th>Date</th>
						<th>Tournament</th>
						<th>Score</th>
						<th>Category</th>
					</tr>';
	}
	if ($women!=NULL)
	{
		foreach ($women as $key => $value) {
			echo '<tr>
					<td class="text-center">'.$value['rank'].'</td>
					<td class="text-center">'.date('F d, Y', strtotime($value['date'])).'</td>
					<td class="text-center">'.$value['name'].'</td>
					<td class="text-center">'.round($value['score'],1).'</td>
					<td class="text-center">'.$value['category'].'</td>
				  </tr>';
		}
	}
	if ($open!=null)
	{
		foreach ($open as $key => $value) {
			echo '<tr>
					<td class="text-center">'.$value['rank'].'</td>
					<td class="text-center">'.date('F d, Y', strtotime($value['date'])).'</td>
					<td class="text-center">'.$value['name'].'</td>
					<td class="text-center">'.round($value['score'],1).'</td>
					<td class="text-center">'.$value['category'].'</td>
				  </tr>';
		}
	}
		echo '</table>';
	
$this->load->view('footer'); ?>