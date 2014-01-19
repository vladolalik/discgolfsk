<?php 

$this->load->view('admin/admin_header', array('title'=>'All profiles', 'caption'=>'All profiles'));

if ($players == NULL)
{
	echo '<p> No user\'s profiles</p>';
} 
else
{
	echo '<table id="admin-players-table" >';
	foreach ($players as $player){
		echo '<tr>';
		if ($player['thumb'] != '')
		{	
			echo  '<td rowspan="2"><img class="admin-player-avatar" src="'.PATH_TO_USERS_AVATAR.$player['thumb'].'" width="128px" title="profile_picture_'.$player['last_name'].'" /></td>';
		} 
		else 
		{
			echo '<td></td>';
		}
		echo  '<td><span>Name:</span><br/>'.$player['first_name'].'</td>';
		echo  '<td><span>Surname:</span><br/>'.$player['last_name'].'</td>';
		echo  '<td><span>Email:</span><br/>'.$player['email'].'</td>';
		if ($player['activated'] == 0)
		{
			echo '<td><span>Status:</span><br/>Not activated</td>';
		}
		else if ($player['activated'] == 1)
		{
			echo '<td><span>Status:</span><br/>Activated</td>';
		} 
		else 
		{
			echo '<td><span>Status:</span><br/>Auto create</td>';
		}
		echo ($player['activated']==2)? '<td class="table-line-height">'.anchor('/auth/admin_update_auto_profile/'.$player['user_id'], 'Update', 'title="Update"').'</td>' : '<td> -- </td>';

		echo '</tr>';
		echo '<tr class="second">';
			echo '<td colspan="2"><span>Created:</span><br/>'.$player['created'].'</td>
			  <td><span>Birth date:</span><br/>'.$player['birth_date'].'</td>
			  <td>'.$player['club'].'</td>'; 
			echo '<td><form action="'.base_url().'index.php/auth/admin_delete_player/'.$player['user_id'].'/admin_get_all_players"> <input type="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete profile and all results : '.$player['first_name'].' '.$player['last_name'].'?\')" /></form></td>';
		echo '</tr>';

	}
	echo '</table>';
	echo $this->pagination->create_links();
}
?>
