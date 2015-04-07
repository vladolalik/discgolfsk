<?php $this->load->view('header', array('title' => 'My profile', 'caption' => 'My profile')); ?>

<div id="my-profile" class="row">
	<div class="col-md-10">
	<h2> <?php echo $first_name.' '.$last_name; ?> </h2>
	<div class="col-md-3"><?php echo '<img class="img-thumbnail" src="'.PATH_TO_USERS_AVATAR.$thumb.'"title="profile_picture_'.$last_name.'" />'; ?> </div>
	<div id="my-profile-info" class="col-md-8">
		<table >
			<tr>
				<th>Country</th>
				<td><?php echo $country; ?></td>
			</tr>
			<tr>
				<th>Gender</th>
				<td><?php echo $gender; ?></td>
			</tr>
			<tr>
				<th>Club</th>
				<td><?php echo $club; ?></td>
			</tr>
			<tr>
				<th>About</th>
				<td><?php echo $about; ?></td>
			</tr>
		</table>
	</div>
	<div class="clear"></div>
</div>