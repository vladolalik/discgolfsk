<?php $this->load->view('header', array('title' => 'Auto-created profiles', 'caption' => 'Auto-created profiles')); ?>
<?php 
if ($players ==NULL)
{
	echo '<p class="general-message">No auto created profiles profiles</p>';
} 
else
{
	echo '<table><tr><th>First Name</th><th>Last name</th><th>Date of birth</th><th>Gender</th><th>Club</th><th>Register</th></tr>';
	foreach ($players as $player){
		echo '<tr><td>'.$player['first_name'].'</td><td>'.$player['last_name'].'</td><td>'.$player['birth_date'].'</td><td>'.$player['gender'].'</td><td>'.$player['club'].'</td>
		<td>'.anchor('/auth/register_existing_profile/'.$player['user_id'], 'It\'s me', 'title="register existing profile"').'</td></tr>';
	}
	echo '</table>';
	echo $this->pagination->create_links();
}
?>
<?php $this->load->view('footer'); ?>