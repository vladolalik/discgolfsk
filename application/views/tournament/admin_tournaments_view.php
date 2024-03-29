
<?php 
/**
* @author Vladimir Lalik
*/
 $this->load->view('admin/admin_header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); ?>

<?php if ($tournaments!=NULL){ ?>

	<table class="admin-tournaments-table table-row-diff">
		<tr> 
			<th>Title</th>
			<th>Date</th>
			<th>Location</th>
			<th class="laps" >Laps</th>
			<th class="fin-laps" >Final laps</th>
			<th>Reg. options</th>
			<th>Add photo</th>
			<th>View</th>
			<th>Update</th>
			<th>Set par</th>
			<th>Delete</th>
			<th>Delete Results</th>
		</tr>

	<?php 
		foreach ($tournaments as $row)
		{
			echo '<tr>
					<td>'.$row['name'].'</td>
					<td>'.date('F d, Y', strtotime($row['date'])).'</td>
					<td>'.$row['location'].'</td>
					<td class="laps text-center" >'.$row['nmbr_of_round'].'</td>
					<td class="fin-laps text-center">'.$row['nmbr_of_fnl_laps'].'</td>
					<td class="text-center">'.anchor('/tournaments/admin_set_reg_option/'.$row['tournament_id'], 'Set', 'title="Set registration option for tournament"').'</td>
					<td class="text-center">'.anchor('/tournaments/admin_upload_photo/'.$row['tournament_id'], '<i class="fa fa-plus"></i>', 'title="Add_photo"').'</td>
					<td class="text-center">'.anchor('/tournaments/tournament_details/'.$row['tournament_id'], 'Details', 'title="show tournament details"').'</td>
					<td class="text-center">'.anchor('/tournaments/admin_update_tournament/'.$row['tournament_id'], 'Update', 'title="update tournament"').'</td>
					<td class="text-center">'.anchor('/tournaments/admin_set_par_lap/'.$row['tournament_id'], 'Set par', 'title="Set par"').'</td>
					<td class="text-center"><form action="'.base_url().'index.php/tournaments/admin_delete_tournament/'.$row['tournament_id'].'"><input type="submit" name="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete touranment: '.$row['name'].' ('.$row['date'].') ?\')" /></form></td>
					<td class="text-center"><form action="'.base_url().'index.php/tournaments/admin_delete_tournament_results/'.$row['tournament_id'].'"><input type="submit" name="submit" value="Del Results" onclick="return confirm(\'Are you sure you want to delete touranments results: '.$row['name'].' ('.$row['date'].') ?\')" /></form></td>
				  </tr>';
		}
		echo '</table>';
		echo $this->pagination->create_links();
	} 
	else
	{
		echo '<p>There are no created tournaments.'.anchor('/tournaments/admin_add_tournament/', 'Create new', 'title="Create  new tournament"').'</p>';
	}
?>

<?php $this->load->view('admin/admin_footer'); ?>
