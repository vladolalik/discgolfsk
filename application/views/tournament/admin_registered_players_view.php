<?php  
 	$this->load->view('admin/admin_header', array('title'=>'Registered players', 'caption'=>'Registered players')); 	
?>


<fieldset>
	<legend>Select tournament</legend>
<table class="center-table">
	<tr>
<?php
	echo form_open('/tournaments/admin_registered_players');
	echo '<td>'.form_label('Tournaments', 'tournament_id').'</td>';
	echo '<td><select name="tournament_id" id="tournament_id">';
	foreach ($tournaments as $key => $value) {
	 	echo '<option value="'.$value['tournament_id'].'" '.set_select('tournament_id', $value['tournament_id']).'>'.$value['name'].' ('.date('F d, Y', strtotime($value['date'])).')</option>';
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
		<h3>Tournament capacity is: <?php echo $tournament['capacity'];  ?></h3>
		<div >
		<?php
			echo '<table id="admin-autocreated-profiles-table" class="table-row-diff"  border="2px">';
		 ?>
		
			<tr>
				<th><b>Position</b></th>
				<th><b>Player</b></th>
				<th><b>Day of birth</b></th>
				<th><b>Category</b></th>
				<th><b>Accomm.</b></th>
				<th><b>Food</b></th>
				<th><b>Email</b></th>
				<th><b>Phone</b></th>
				<th><b>PDGA Mem.</b></th>
				<th><b>SAF Mem.</b></th>
				<th><b>Note</b></th>
				<th><b>De-register</b></th>
			</tr>
		<?php 

			$over_capacity=false;
			$count=1;
			foreach ($registered_players as $key => $value) {
				if ($value['position']>$tournament['capacity']){
					$over_capacity=true;
					echo '<tr style="color:red;">';
				} else {
					echo '<tr>';
				}

				if ($over_capacity)
				{
					echo '<td>'.$count.'</td>';
					$count++;
				} 
				else 
				{
					echo	'<td>'.$value['position'].'</td>';
				}
				if ($value['first_name']==NULL)
					{
						echo '<td>'.$value['n_first_name'].' '.$value['n_last_name'].'</td>';
						echo '<td>'.date('F d, Y', strtotime($value['n_birth_date'])).'</td>';
						echo '<td>'.$value['n_email'].'</td>';
					} else {
						echo '<td>'.$value['first_name'].' '.$value['last_name'].'</td>';
						echo '<td>'.date('F d, Y', strtotime($value['birth_date'])).'</td>';
						echo '<td>'.$value['email'].'</td>';
					}
						echo '<td>'.$value['category'].'</td>';	
						echo '<td>'.$value['accom'].'</td>';
						echo '<td>'.$value['food'].'</td>';
						echo '<td>'.$value['phone'].'</td>';
						echo '<td>'.$value['pdga_membership'].'</td>';
						echo '<td>'.$value['active_saf'].'</td>';
						echo '<td>'.$value['note'].'</td>';
						echo '<td>'.anchor('tournaments/admin_delete_registration/'.$value['register_player_id'], 'Log off', 'title="log off"').'</td>';
				
				echo '</tr>';
			}
		echo '</table>';
	}

?>
<p class="extra-note">The players marked with the red color are on the waiting list because the maximal capacity of the tournament was reached.</p>
</div>
<?php 
	$this->load->view('admin/admin_footer');
?>