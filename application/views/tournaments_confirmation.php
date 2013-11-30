<?php echo form_open();?>
	<table style="width: 80%; text-align: center;">
	<tr>
		<th>Name</th>
		<th>Surname</th>
		<th>Nationality</th>
		<th>Connect</th>
		<th>Category</th>
	</tr>
	<?php
	//debug($players);
		$string = "";
		foreach ($players as $key => $player) {
			$string .= '<tr>';
			$string .= '<td>'.$player['name'].'</td>';
			$string .= '<td>'.$player['surname'].'</td>';
			$string .= '<td>'.$player['nationality'].'</td>';
			if( $player['exist'] != -1){ //moznost parovania ak este nie je vytvoreny
				$string .= '<td><input type="checkbox" checked value="'.$player['exist'].'"/>'.'</td>';
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
<?php
	echo form_submit('submit', 'Save');
	echo form_close();
?>