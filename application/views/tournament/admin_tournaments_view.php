
<?php 
/**
* @author Vladimir Lalik
*/
 $this->load->view('admin/admin_header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); ?>
<?php //print_r($tournaments); ?>
<div id="content">
<table border="1px">
	<tr> 
		<th>Title</th>
		<th>Date</th>
		<th>Location</th>
		<th>Number of laps</th>
		<th>Number of final laps</th>
		<th>Add photo</th>
		<th>View</th>
		<th>Update</th>
		<th>Delete</th>
	</tr>

<?php 
	foreach ($tournaments as $row)
	{
		echo '<tr>
				<td>'.$row['name'].'</td>
				<td>'.$row['date'].'</td>
				<td>'.$row['location'].'</td>
				<td>'.$row['nmbr_of_round'].'</td>
				<td>'.$row['nmbr_of_fnl_laps'].'</td>
				<td>'.anchor('/tournaments/admin_upload_photo/'.$row['tournament_id'], 'Add photo', 'title="Add_photo"').'</td>
				<td>'.anchor('/tournaments/admin_tournament_detail/'.$row['tournament_id'], 'Details', 'title="Details"').'</td>
				<td>'.anchor('/tournaments/admin_update_tournament/'.$row['tournament_id'], 'Update', 'title="Update"').'</td>
				<td><form action="'.base_url().'index.php/tournaments/admin_delete_tournament/'.$row['tournament_id'].'"><input type="submit" name="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete touranment: '.$row['name'].' ('.$row['date'].') ?\')" /></form></td>
			  </tr>';
	}
	echo '</table>';
?>
</div>
