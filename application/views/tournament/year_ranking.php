<?php $this->load->view('header', array('title' => $name.' '.date('Y'), 'caption' => $name.' '.date('Y'))); ?>
<?php
 	//print_r($male);
 	//print_r($female);
?>
<div id="ranking">
	<h2>Male</h2>
 	<table class="statistics table-row-diff">
 		<tr>
 			<th>Rank</th>
 			<th>Points</th>
 			<th>Name</th>
 			<th>Details</th>

<?php
//print_r($male[0]);
if ($male!=NULL)
{
 	foreach ($male as $key => $m_results) 
 	{
 		//print_r($m_results);
 		echo '<tr>
	 			<td>'.$m_results['rank'].'</td>
	 			<td>'.round($m_results['year_score'],2).'</td>
	 			<td>'.$m_results['first_name'].' '.$m_results['last_name'].'</td>
	 			<td>'.anchor('tournaments/tournaments_score/'.$m_results['user_id'], 'Show', 'title="Score details"').'</td>
	 		  </tr>';
 	}
}
?>
</table>

<h2>Female</h2>
 	<table class="statistics table-row-diff">
 		<tr>
 			<th>Rank</th>
 			<th>Points</th>
 			<th>Name</th>
 			<th>Details</th>

<?php
//print_r($male[0]);
 if ($female!=NULL){
 	foreach ($female as $key => $f_results) 
 	{
 		echo '<tr>
	 			<td>'.$f_results['rank'].'</td>
	 			<td>'.round($f_results['year_score'],2).'</td>
	 			<td>'.$f_results['first_name'].' '.$f_results['last_name'].'</td>
	 			<td>'.anchor('tournaments/tournaments_score/'.$f_results['user_id'], 'Show', 'title="Score details"').'</td>
	 		  </tr>';
 	}
}
?>
</table>
</div> <!-- #ranking-->
<?php $this->load->view('footer'); ?>