<?php 

$this->load->view('admin/admin_header', array('title'=>'Auto-created profiles', 'caption'=>'Auto-created profiles'));

if ($players == NULL)
{
	echo '<p> No auto created profiles profiles</p>';
} 
else
{
	echo '<table id="admin-autocreated-profiles-table" class="table-row-diff"><tr>
								<th>First Name</th>
								<th>Last name</th>
								<th>Date of birth</th>
								<th>Gender</th>
								<th>Club</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>';
	foreach ($players as $player){
		echo '<tr>
				<td>'.$player['first_name'].'</td>
				<td>'.$player['last_name'].'</td>
				<td>'.date('F d, Y', strtotime($player['birth_date'])).'</td>
				<td>'.$player['gender'].'</td>
				<td>'.$player['club'].'</td>
				<td>'.anchor('auth/admin_update_auto_profile/'.$player['user_id'], 'Update', 'title="Update auto-created profile"').'</td>
				<td><form action="'.base_url().'index.php/auth/admin_delete_player/'.$player['user_id'].'/admin_get_autocreated_profile"> <input type="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete profile and all results : '.$player['first_name'].' '.$player['last_name'].'?\')" /></form></td>
			 </tr>';
	}
	echo '</table>';
	echo $this->pagination->create_links();
}
?>