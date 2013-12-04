<?php 

$this->load->view('admin/admin_header', array('title'=>'Users waiting for activation' , 'caption'=>'Users waiting for activation'));

if ($players ==NULL)
{
	echo '<p> No profiles waiting for activation</p>';
} 
else
{
	echo '<p class="note">Note: Reject activation means deleted new profile and if it is auto-created profile it will delete only users email and password and someone else can register this profile</p>';
	echo '<table border="1">
			<tr>
				<th>First Name</th>
				<th>Last name</th>
				<th>Date of birth</th>
				<th>email</th>
				<th>Gender</th>
				<th>Club</th>
				<th>Auto Created</th>
				<th>Activate</th>
				<th>Delete</th>
				<th>Reject Activation</th>
			</tr>';
	foreach ($players as $player){
		echo '<tr>
				<td>'.$player['first_name'].'</td>
				<td>'.$player['last_name'].'</td>
				<td>'.$player['birth_date'].'</td>
				<td>'.$player['email'].'</td>
				<td>'.$player['gender'].'</td>
				<td>'.$player['club'].'</td>';
		echo   '<td>'; echo ($player['username'] == 'auto')? 'YES':'NO';  echo '</td>';
		echo   '<td><form action="'.base_url().'index.php/auth/admin_activate_player/'.$player['user_id'].'"> <input type="submit" value="Activate" onclick="return confirm(\'Are you sure you want to activate profile with email: '.$player['email'].'?\')" /></form></td>
				<td><form action="'.base_url().'index.php/auth/admin_delete_player/'.$player['user_id'].'"> <input type="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete profile and all results with email: '.$player['email'].'?\')" /></form></td>
				<td><form action="'.base_url().'index.php/auth/admin_reject_activation/'.$player['user_id'].'"> <input type="submit" value="Reject Activation" onclick="return confirm(\'Are you sure you want to reject request for activation from this user with email: '.$player['email'].'?\')" /></form></td></tr>';
	}
	echo '</table>';
	echo $this->pagination->create_links();
}
?>