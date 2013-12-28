<?php 
/**
* @author Branislav Ballon
*/
 $this->load->view('admin/admin_header', array('title'=>'Delete results| Discgolf', 'caption'=>'Delete results')); 
$select = array();
foreach ($players as  $player){
	$select[$player['user_id']] = $player['first_name'].' '. $player['last_name'];	
}

echo '<div id="content-inner">';
echo form_open_multipart('tournaments/admin_delete_results');
	
	if( !isset($player_id)){
		echo form_label('Select Player', 'select-players');
		echo form_dropdown('player_id', $select, set_value('existing_tournament_id'), 'id="select-players"');
		echo form_submit('submit', 'Submit');
	}else{
		$select = array();
		foreach ($tournaments as  $tournament){
			$select[$tournament['tournament_id']] = $tournament['name'].' - '. $tournament['date'];	
		}			
		echo form_dropdown('tournament_id', $select, set_value('existing_tournament_id'), 'id="select-players"');
		echo form_hidden('player_id', $player_id);
		echo form_submit('delete', 'Delete');
		
	}	
	echo form_close();
echo '</div>';
$this->load->view('admin/admin_footer'); 
?>