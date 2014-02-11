<?php  
 	$this->load->view('admin/admin_header', array('title'=>'Registered players', 'caption'=>'Registered players')); 	
?>
<fieldset>
	<legend>Select tournament</legend>
<table>
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
		<div id="table">
		<?php
			echo '<table id="admin-autocreated-profiles-table" class="table-row-diff">';
		 ?>
		
			<tr>
				<th>Position</th>
				<th>Player</th>
				<th>Category</th>
				<th>Accommodation</th>
				<th>Food</th>
				<th>Note</th>
				<th>De-register</th>
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
				echo	'<td>'.$value['first_name'].' '.$value['last_name'].'</td>
						<td>'.$value['category'].'</td>';	
						echo '<td>'.$value['accom'].'</td>';
						echo '<td>'.$value['food'].'</td>';
						echo '<td>'.$value['note'].'</td>';
						echo '<td>'.anchor('tournaments/admin_delete_registration/'.$value['user_id'].'/'.$tournament['tournament_id'], 'Log off', 'title="log off"').'</td>';
				
				echo '</tr>';
			}
		echo '</table>';
	}

?>
<p style="margin-top:20px;">The players marked with the red color are on the waiting list because the maximal capacity of the tournament was reached.</p>
</div>
<?php 
	$this->load->view('admin/admin_footer');
?>