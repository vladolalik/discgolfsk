<?php  

if (!$this->help_functions->is_admin()){
	$this->load->view('header', array('title' => 'Results', 'caption' => 'Results'));
} else {
 	$this->load->view('admin/admin_header', array('title'=>'Registered players', 'caption'=>'Registered players')); 	
}
?>
<fieldset>
	<legend>Select tournament</legend>
<table>
	<tr>
<?php //print_r($tournaments); 
	echo form_open('/tournaments/registered_players');
	echo '<td>'.form_label('Tournaments', 'tournament_id').'</td>';
	echo '<td><select name="tournament_id" id="tournament_id">';
	foreach ($tournaments as $key => $value) {
	 	echo '<option value="'.$value['tournament_id'].'">'.$value['name'].' ('.$value['date'].')</option>';
	 } 
	 echo '</select></td>';
	 echo '<td>'.form_submit('view', 'View').'</td>';
     echo form_close();
?>
</tr>
</table>
</fieldset>

<?php 
	if(isset($registered_players) && $registered_players!=NULL)
	{
		//print_r($registered_players);
		?>
		<div id="table">
		<table border="1px">
			<tr>
				<th>Player</th>
				<th>Category</th>
				<th>Accommodation</th>
				<th>Food</th>
			</tr>
		<?php
			foreach ($registered_players as $key => $value) {
				echo '<tr>
						<td>'.$value['first_name'].' '.$value['last_name'].'</td>
						<td>'.$value['category'].'</td>';
				if($value['accommodation']=='0')
				{
					echo '<td>No</td>';
				}
				else
				{
					echo '<td>Yes</td>';
				}
				if($value['nutrition']=='0')
				{
					echo '<td>No</td>';
				}
				else
				{
					echo '<td>Yes</td>';
				}
			}
	}

?>
</div>
<?php $this->load->view('footer'); ?>