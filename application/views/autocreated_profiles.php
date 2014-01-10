<?php $this->load->view('header', array('title' => 'Auto-created profiles', 'caption' => 'Auto-created profiles')); ?>
<?php 
if ($players ==NULL)
{
	echo '<p class="general-message">No auto created profiles profiles</p>';
} 
else
{
	echo '<table id="results-table" class="statistics table-row-diff">
	<tr>
		<th>First Name</th>
		<th>Last name</th>
		<th>Date of birth</th>
		<th>Gender</th>
		<th>Club</th>
		<th>Register</th>
	</tr>';
	foreach ($players as $player){
		echo '<tr>
		<td class="text-center">'.$player['first_name'].'</td>
		<td class="text-center">'.$player['last_name'].'</td>
		<td class="text-center">'.$player['birth_date'].'</td>
		<td class="text-center">'.$player['gender'].'</td>
		<td class="text-center">'.$player['club'].'</td>
		<td class="text-center">'.anchor('/auth/register_existing_profile/'.$player['user_id'], 'It\'s me', 'title="register existing profile"').'</td></tr>';
	}
	echo '</table>';
	echo $this->pagination->create_links();
}
?>
<?php $this->load->view('footer'); ?>