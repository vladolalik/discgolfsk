<?php  

	$this->load->view('header', array('title' => 'Registered players', 'caption' => 'Registered players'));

?>
<fieldset>
	<legend>Select tournament</legend>
<table class="center-table">
	<tr>
<?php
	echo form_open('/tournaments/registered_players');
	echo '<td>'.form_label('Tournaments', 'tournament_id').'</td>';
	echo '<td><select name="tournament_id" id="tournament_id">';
	$tournament_id = $this->uri->segment(3);
	foreach ($tournaments as $key => $value) {
		if ($tournament_id!=NULL && $tournament_id==$value['tournament_id']){
			echo '<option value="'.$value['tournament_id'].'" selected="selected">'.$value['name'].' ('.date('F d, Y', strtotime($value['date'])).')</option>';
		} else {
			echo '<option value="'.$value['tournament_id'].'" '.set_select('tournament_id', $value['tournament_id']).'>'.$value['name'].' ('.date('F d, Y', strtotime($value['date'])).')</option>';	
		}
	 	
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
			echo '<table class="profile-table" style="margin-top:10px;">';
		 ?>
		
			<tr>
				<th>Position</th>
				<th>Player</th>
				<th>Country</th>
				<th>Club</th>
				<th>PDGA</th>				
				<th>Category</th>

			</tr>
		<?php 

			$position=1;
			foreach ($registered_players as $key => $value) {
				if ($position>$tournament['capacity']){
					echo '<tr style="color:red;">';
					echo '<td>'.($position-$tournament['capacity']).'</td>';
				} else {
					echo '<tr>';
					echo '<td>'.$position.'</td>';
				}

				if ($value['first_name']==NULL)
					{
						echo '<td>'.$value['n_first_name'].' '.$value['n_last_name'].'</td>';
						echo '<td>'.$value['n_country'].'</td>';
						echo '<td>'.$value['n_club'].'</td>';
					} else {
						echo '<td>'.$value['first_name'].' '.$value['last_name'].'</td>';
						echo '<td>'.$value['country'].'</td>';
						echo '<td>'.$value['club'].'</td>';
					}
					echo '<td>'.$value['pdga_membership'].'</td>';
					echo '<td>'.$value['category'].'</td>';
				echo '</tr>';
				$position=$position+1;
			}
		echo '</table>';
	}

?>
<p style="margin-top:20px;">The players marked with the red color are on the waiting list because the maximal capacity of the tournament was reached.</p>
</div>
<?php 
	$this->load->view('footer');
?>