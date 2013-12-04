<?php echo form_open('tournaments/save_import_data');?>
	<table style="width: 80%; text-align: center;">
	<tr>
		<th>Name</th>
		<th>Surname</th>
		<th>Nationality</th>
		<th>Connect</th>
		<th>Category</th>
	</tr>
	<?php
	if( isset( $validation_errors ) ){
		echo "<div id='players-validation-error'>".$validation_errors."</div>";
	}
		$string = "";
		foreach ($players as $key => $player) {
			$string .= '<tr>';
			$string .= '<td>'.$player['name'].'</td>';
			$string .= '<td>'.$player['surname'].'</td>';
			$string .= '<td>'.$player['nationality'].'</td>';
			if( $player['exist'] != -1){ //moznost parovania ak este nie je vytvoreny
				$string .= '<td><input type="checkbox" checked name="'.$player['exist'].'"/>'.'</td>';
			}else{
				$string .= '<td>new</td>';
			}
			if( $player['category_exist'] != -1){ // napise ci existuje dana kategoria
				$string .= '<td>'.$player['category'].'</td>';
			}else{
				$string .= '<td>X</td>';
			}
			$string .= '</tr>';
		}
		echo $string;
	?>
	</table>

	<input type='hidden' name='final_laps_data' value="<?php echo htmlentities(serialize($final_laps_data)); ?>" />
	<input type='hidden' name='laps_data' value="<?php echo htmlentities(serialize($laps_data)); ?>" />
	<input type='hidden' name='players' value="<?php echo htmlentities(serialize($players)); ?>" />

<?php

	echo form_submit('submit', 'Save');
	echo form_close();
?>