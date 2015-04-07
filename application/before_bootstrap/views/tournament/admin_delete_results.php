<?php 
/**
* @author Branislav Ballon
*/
 $this->load->view('admin/admin_header', array('title'=>'Delete results | Discgolf', 'caption'=>'Delete results')); 
$select = array();
foreach ($players as  $player){
	$select[$player['user_id']] = $player['first_name'].' '. $player['last_name'];	
}

echo '<div id="content-inner">';
echo form_open_multipart('tournaments/admin_delete_results');
echo '<table class="center-table">';	
	if( !isset($player_id)){
		echo '<tr><td>'.form_label('Select Player', 'select-players').'</td>';
		echo '<td>'.form_dropdown('player_id', $select, set_value('existing_tournament_id'), 'id="select-players"').'</td>';
		echo '<td>'.form_submit('submit', 'Submit').'</td></tr>';
	}else{
		$select = array();
		foreach ($tournaments as  $tournament){
			$select[$tournament['tournament_id']] = $tournament['name'].' - '. $tournament['date'];	
		}	
		echo '<tr><td>'.form_label('Select tournament','select-players').'</td>';
		echo '<td>'.form_dropdown('tournament_id', $select, set_value('existing_tournament_id'), 'id="select-players"').'</td>';
		echo '<td>'.form_hidden('player_id', $player_id).'</td>';
		echo '<td>'.form_submit('delete', 'Delete').'<td></tr>';
		
	}	
	echo '</table>';
	echo form_close();
echo '</div>';
$this->load->view('admin/admin_footer'); 
?>