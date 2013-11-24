<?php 
$this->load->view('admin/admin_header');

//print_r($players);
echo $this->session->flashdata('message');
if ($players ==NULL)
{
	echo '<p> No profiles waiting for activation</p>';
} 
else
{
	echo '<table border="1"><tr><th>First Name</th><th>Last name</th><th>Date of birth</th><th>email</th><th>Gender</th><th>Club</th><th>Activate</th><th>Delete</th></tr>';
	foreach ($players as $player){
		echo '<tr><td>'.$player['first_name'].'</td><td>'.$player['last_name'].'</td><td>'.$player['birth_date'].'</td><td>'.$player['email'].'</td><td>'.$player['gender'].'</td><td>'.$player['club'].'</td>
		<td><form action="/discgolf/index.php/auth/activate_player/'.$player['user_id'].'"> <input type="submit" value="Activate" onclick="return confirm(\'Are you sure you want to activate profile with email: '.$player['email'].'?\')" /></form></td>
		<td><form action="/discgolf/index.php/auth/delete_player/'.$player['user_id'].'"> <input type="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete profile and all results with email: '.$player['email'].'?\')" /></form></td></tr>';
	}
	echo '</table>';
}
?>