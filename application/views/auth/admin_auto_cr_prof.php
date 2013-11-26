<?php 

$this->load->view('admin/admin_header', array('title'=>'Auto-created profiles', 'caption'=>'Auto-created profiles'));

if ($players == NULL)
{
	echo '<p> No auto created profiles profiles</p>';
} 
else
{
	echo '<table border="1"><tr>
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
				<td>'.$player['birth_date'].'</td>
				<td>'.$player['gender'].'</td>
				<td>'.$player['club'].'</td>
				<td><a href="admin_update_auto_profile/'.$player['user_id'].'"> Update</a></td>
				<td><form action="/discgolf/index.php/auth/admin_delete_player/'.$player['user_id'].'"> <input type="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete profile and all results : '.$player['first_name'].' '.$player['last_name'].'?\')" /></form></td>
			 </tr>';
	}
	echo '</table>';
	echo $this->pagination->create_links();
}
?>