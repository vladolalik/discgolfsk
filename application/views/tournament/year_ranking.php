<?php $this->load->view('header', array('title' => $name.' '.date('Y'), 'caption' => $name.' '.date('Y'))); ?>
<?php
 	//print_r($male);
 	//print_r($female);
?>
<div id="ranking">
	<h2>OPEN</h2>
 	<table id="results-table"  class="statistics table-row-diff">
 		<tr>
 			<th>Rank</th>
 			<th>Points</th>
 			<th>Name</th>
 			<th>Details</th>

<?php
//print_r($male[0]);
if ($open!=NULL)
{
	//print_r($open);
 	foreach ($open as $key => $m_results) 
 	{
 		//print_r($m_results);
 		echo '<tr>
	 			<td class="text-center">'.$m_results['rank'].'</td>
	 			<td class="text-center">'.round($m_results['open_score'],1).'</td>
	 			<td class="text-center">'.$m_results['first_name'].' '.$m_results['last_name'].'</td>
	 			<td class="text-center">'.anchor('tournaments/tournaments_score/'.$m_results['user_id'], 'Show', 'title="Score details"').'</td>
	 		  </tr>';
 	}
}
?>
</table>

<h2>WOMEN</h2>
 	<table id="results-table" class="statistics table-row-diff">
 		<tr>
 			<th>Rank</th>
 			<th>Points</th>
 			<th>Name</th>
 			<th>Details</th>

<?php
//print_r($male[0]);
 if ($women!=NULL){
 	foreach ($women as $key => $f_results) 
 	{
 		echo '<tr>
	 			<td class="text-center">'.$f_results['rank'].'</td>
	 			<td class="text-center">'.round($f_results['women_score'],1).'</td>
	 			<td class="text-center">'.$f_results['first_name'].' '.$f_results['last_name'].'</td>
	 			<td class="text-center">'.anchor('tournaments/tournaments_score/'.$f_results['user_id'], 'Show', 'title="Score details"').'</td>
	 		  </tr>';
 	}
}
?>
</table>
</div> <!-- #ranking-->
<?php $this->load->view('footer'); ?>