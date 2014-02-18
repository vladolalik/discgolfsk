<?php 
/**
* @author Vladimir Lalik
*/
 	$this->load->view('admin/admin_header', array('title'=>'Set score from foreign tournaments', 'caption'=>'Set score from foreign tournaments')); 
 ?>
 <p style="color:red; margin:15px 15px 15px 15px;"><b>Note:</b> If you want applies changes in ranklist please update ranklist in admin menu.</p>
<?php
	echo '<form action="'.base_url().'index.php/tournaments/admin_delete_foreign_score">'; ?>
	<input type="submit" name="submit" value="Delete all foreign results" onclick="return confirm('Are you sure that you want to delete all foreign results')" /></form>
<?php echo '<div style="color:red; margin-left:10px;">'.validation_errors().'</div>';
	  echo form_open($this->uri->uri_string());
?>
<table class="admin-tournaments-table table-row-diff" style="margin-bottom:15px;">
	<tr>
		<td>Last name</td>
		<td>First name</td>
		<td>Tourn. 1</td>
		<td>Tourn. 2</td>
		<td>Tourn. 3</td>
		<td>Tourn. 4</td>
		<td>Delete</td>
	</tr>

 <?php
 	foreach ($players as $key => $player) {
 		echo '<tr>
 				<td>'.$player['last_name'].'</td>
 			  	<td>'.$player['first_name'].'</td>';
 		$option_1=array(
 			'id'=>'foreign_1_'.$player['user_id'],
 			'name'=>'foreign_1_'.$player['user_id'],
 			'value'=>set_value('foreign_1_'.$player['user_id'], $player['foreign_1']),
 			'size'=>'4'
 		);
 		echo '<td>'.form_input($option_1).'</td>';
 		$option_2=array(
 			'id'=>'foreign_2_'.$player['user_id'],
 			'name'=>'foreign_2_'.$player['user_id'],
 			'value'=>set_value('foreign_2_'.$player['user_id'], $player['foreign_2']),
 			'size'=>'4'
 		);
 		echo '<td>'.form_input($option_2).'</td>';
 		$option_3=array(
 			'id'=>'foreign_3_'.$player['user_id'],
 			'name'=>'foreign_3_'.$player['user_id'],
 			'value'=>set_value('foreign_3_'.$player['user_id'], $player['foreign_3']),
 			'size'=>'4'
 		);
 		echo '<td>'.form_input($option_3).'</td>';
 		$option_4=array(
 			'id'=>'foreign_4_'.$player['user_id'],
 			'name'=>'foreign_4_'.$player['user_id'],
 			'value'=>set_value('foreign_4_'.$player['user_id'], $player['foreign_4']),
 			'size'=>'4'
 		);
 		echo '<td>'.form_input($option_4).'</td>';
 		echo '<td><form action="'.base_url().'index.php/tournaments/admin_delete_individual_foreign_score/'.$player['user_id'].'">'; ?>
		<input type="submit" name="submit" value="Del. foreign results" onclick="return confirm('Are you sure about delete <?php echo $player['last_name'];?>\'s foreign score?')" /></form><td></tr>
<?php 
	}

 ?>
</table>

<?php
	echo form_submit('Submit', 'Submit');
	echo form_close();
?>

