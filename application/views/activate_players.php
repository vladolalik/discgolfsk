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
	echo '<table border="1"><tr><th>First Name</th><th>Last name</th><th>Date of birth</th><th>email</th><th>Gender</th><th>Club</th><th>Activate</th></tr>';
	foreach ($players as $player){
		echo '<tr><td>'.$player['first_name'].'</td><td>'.$player['last_name'].'</td><td>'.$player['birth_date'].'</td><td>'.$player['email'].'</td><td>'.$player['gender'].'</td><td>'.$player['club'].'</td><td><a href="/discgolf/index.php/auth/activate_player/'.$player['user_id'].'">Activate</a></td></tr>';
	}
	echo '</table>';
}
?>