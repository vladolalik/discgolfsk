<?php 

$this->load->view('admin/admin_header', array('title'=>'Merge profiles', 'caption'=>'Merge profiles'));

?>
<p class="extra-note"> <b>Note: </b>Choose two profiles which you want merge. Profile to merge (marked with red color) will be deleted and all results from this profile will be assigned to main profile (marked with green color). If this two players has played in same tournament, results of red profile will be replaced with results of main profile (green).</p>
<?php

echo '<div class="general_error">'.validation_errors().'</div>';

echo form_open('auth/admin_join_profiles');

echo '<input type="submit" class="merge-btn" value="Merge profiles" onclick="return confirm(\'Are you sure you want to merge profile ?\')" />';
if ($players == NULL)
{
	echo '<p> No user\'s profiles</p>';
} 
else
{
	echo '<table id="admin-players-table" >';
	foreach ($players as $player){
		echo '<tr class="'.$player['user_id'].'">';
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

		echo '<td>'.form_label('Main profile', 'main_'.$player['user_id']); 
		$data=array(
			'name'=>'main',
			'id'=>'main_'.$player['user_id'],
			'value'=>$player['user_id']
		);
		echo form_radio($data).'</td>';
		echo '</tr>';
		echo '<tr class="second '.$player['user_id'].'">';
				echo '<td colspan="2"><span>Created:</span><br/>'.$player['created'].'</td>
			  	<td><span>Birth date:</span><br/>'.$player['birth_date'].'</td>
			  	<td>'.$player['club'].'</td>';
			  	echo '<td>'.form_label('Profile to merge', 'merge_'.$player['user_id']); 
				$data=array(
					'name'=>'merge',
					'id'=>'merge_'.$player['user_id'],
					'value'=>$player['user_id']
				);
				echo form_radio($data).'</td>'; 
		echo '</tr>';

	}
	echo '</table>';
	echo form_close();
}
?>
<script>
	$(function() {

		changeBackground();
		check();
		var main_val=-1;
		var merge_val=-1;

		/*$("input[name='main']").click(function(){
			console.log("onclick");
			return check();
		});

		$("input[name='merge']").click(function(){
			return check();
		});	*/

		function check(){
			if ($('input:radio[name=main]:checked').val()==$('input:radio[name=merge]:checked').val())
			{
				return false;
			}

			return true;
		}

		function changeBackground(){
			if (!check()){
				console.log("falsesss");

				return false;
			}
			$('#admin-players-table tr').css("background-color", "#F1F1F1");
			console.log($('input:radio[name=main]:checked').val());
			console.log($('input:radio[name=merge]:checked').val());
			$('.'+$('input:radio[name=main]:checked').val()).css("background-color", "green");
			$('.'+$('input:radio[name=merge]:checked').val()).css("background-color", "red");
			return true;
		}


		$("input[name='main']").change(function(){
			console.log("onchange")
			if (!changeBackground()){
				$(this).prop('checked', false);
				$('#admin-players-table tr').css("background-color", "#F1F1F1");
				$('.'+$('input:radio[name=main]:checked').val()).css("background-color", "green");
				$('.'+$('input:radio[name=merge]:checked').val()).css("background-color", "red");
				return false;	
			} 
			return true;
			
		});

		$("input[name='merge']").change(function(){
			if (!changeBackground()){
				$(this).prop('checked', false);
				$('#admin-players-table tr').css("background-color", "#F1F1F1");
				$('.'+$('input:radio[name=main]:checked').val()).css("background-color", "green");
				$('.'+$('input:radio[name=merge]:checked').val()).css("background-color", "red");
				return false;	
			} 
			return true;
		});
	});


</script>
