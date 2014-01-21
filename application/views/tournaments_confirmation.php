<?php 
/**
* @author Branislav Ballon
*/
 $this->load->view('admin/admin_header', array('title'=>'Import tournament | Discgolf', 'caption'=>'Import tournament')); 
 ?>
 <?php //debug($players);?>
<?php echo form_open('tournaments/save_import_data');?>
<?php 	
	if( isset( $validation_errors ) ){
		echo "<h2>Players data errors</h2>";
		echo "<div id='players-validation-error'>".$validation_errors."</div>";
	}
?>
	<fieldset id="confirmation-errors">
		<legend>Check inserted data</legend>
		<table class="table-row-diff">
		<tr>
			<th>Name</th>
			<th>Surname</th>
			<th>Gender</th>
			<th>Birth date</th>
			<th>Connect</th>
			<th>Category</th>
			<th>Delete existing data</th>
		</tr>
	
		<?php
			// debug($players);
			// debug($laps_data);
			// debug($final_laps_data);
			$string = "";
			foreach ($players as $key => $player) {
				$birth_date = ( $player['birth_date'] != "0000-00-00" ) ? $player['birth_date']  : "";


				$string .= '<tr>';
				$string .= '<td>'.$player['name'].'</td>';
				$string .= '<td>'.$player['surname'].'</td>';
				$string .= '<td>'.$player['gender'].'</td>';
				$string .= '<td>'.$birth_date.'</td>';
				if( $player['exist'] != -1){ //moznost parovania ak este nie je vytvoreny
					$string .= '<td class="ok-icon"><i class="fa fa-check"></i></td>';
				}else{
					$string .= '<td>new</td>';
				}
				if( $player['category_exist'] != -1){ // napise ci existuje dana kategoria
					$string .= '<td>'.'<i class="fa fa-check"></i> - '.$player['category'].'</td>';
				}else{
					$string .= '<td class="error-icon"><i class="fa fa-times"></i></td>';
				}
				if( $player['has_tournament'] == -1){ // napise ci chceme zapisat ak dany hrac uz ma turnaj
					$string .= '<td><i class="fa fa-check"></i> </td>'; // napise fajku ak je všetko v poriadku a ešte nemáme údaje o danom hráčovi 
				}else{
					 // inak dá checkbox...ktorý dá na vyber, či nehcať pôvodné výsledky alebo zmazať pôvodné a pridať nové
					$string .= '<td> <input class="confirmation-checkbox" type="checkbox" checked name="'.$player['exist'].'"/>'.'</td>';
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
		<div id="import-confirmation-toggle-all" >
			<label for="toggle-all">Toggle all</label>
			<input id="toggle-all" type="checkbox" checked />
		</div>
		<script type="text/javascript">
			$(function(){
				$('#toggle-all').click(function(){
					var checked = $( this ).prop('checked');
					console.log( checked );
					$('.confirmation-checkbox').prop("checked",checked);
				});
			});
		</script>
	</fieldset>
