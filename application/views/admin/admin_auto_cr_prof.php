<?php 

//print_r($players);
$this->load->view('admin/admin_header');
echo $this->session->flashdata('message');
if ($players ==NULL)
{
	echo '<p> No auto created profiles profiles</p>';
} 
else
{
	echo '<table border="1"><tr><th>First Name</th><th>Last name</th><th>Date of birth</th><th>Gender</th><th>Club</th><th>Register</th></tr>';
	foreach ($players as $player){
		echo '<tr><td>'.$player['first_name'].'</td><td>'.$player['last_name'].'</td><td>'.$player['birth_date'].'</td><td>'.$player['gender'].'</td><td>'.$player['club'].'</td><td><a href="register_existing_profile/'.$player['user_id'].'"> It\'s me</a></td></tr>';
	}
	echo '</table>';
}
?>