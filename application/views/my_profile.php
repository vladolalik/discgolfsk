<?php $this->load->view('header', array('title' => 'My profile')); ?>
<div id="thumb"><?php echo '<img src="'.PATH_TO_USERS_AVATAR.$thumb.'" width="128px" title="profile_picture_'.$last_name.'" />'; ?> </div>
<div id="content">
<h1> <?php echo $first_name.' '.$last_name; ?> </h1>
<table class="my_profile">
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