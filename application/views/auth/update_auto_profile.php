<?php

$this->load->view('admin/admin_header', array('title'=>'Edit auto-created profile', 'caption'=>'Edit auto-created profile'));

$first_name = array(
	'name' => 'first_name',
	'id'   => 'first_name',
	'value'=> set_value('first_name', $first_name),
	'max_length'=> 45,
	'size' => 30,
);
$last_name = array(
	'name' => 'last_name',
	'id'   => 'last_name',
	'value'=> set_value('last_name', $last_name),
	'max_length'=> 45,
	'size' => 30,
);
$birth = array(
	'name' => 'birth_date',
	'id'   => 'birth_date',
	'value'=> set_value('birth_date', $birth_date),
);
$genderA = array(
	'name' => 'gender',
	'id' => 'gender'
);

$options_gender = array(
	'male' => 'male',
	'female' => 'female'
);

$club = array(
	'id' => 'club',
	'name' => 'club',
	'value' => set_value('club', $club)
);

?>
<?php echo form_open('auth/admin_update_auto_profile/'.$user_id); ?>
<table>
	
	<tr>
		<td><?php echo form_label('First Name', $first_name['id']); ?></td>
		<td><?php echo form_input($first_name); ?></td>
		<td style="color: red;"><?php echo form_error($first_name['name']); ?><?php echo isset($errors[$first_name['name']])?$errors[$first_name['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('Last Name', $last_name['id']); ?></td>
		<td><?php echo form_input($last_name); ?></td>
		<td style="color: red;"><?php echo form_error($last_name['name']); ?><?php echo isset($errors[$last_name['name']])?$errors[$last_name['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('Day of birth', $birth['id']); ?></td>
		<td><input type="date" name="birth_date" value="<?php echo set_value('birth_date', $birth_date)?>" id="birth_date"></td>
		<td style="color: red;"><?php echo form_error($birth['name']); ?><?php echo isset($errors[$birth['name']])?$errors[$birth ['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('Gender', $genderA['id']); ?></td>
		<td>
		<select name="gender" id="gender">
			<option value="Male" <?php echo set_select('gender', 'Male', $gender == 'Male'? TRUE : FALSE); ?> >Male</option>
			<option value="Female" <?php echo set_select('gender', 'Female', $gender =='Female'? TRUE : FALSE); ?> >Female</option>
		</select>
	</td>
		<td style="color: red;"><?php echo form_error($genderA['name']); ?><?php echo isset($errors[$genderA['name']])?$errors[$genderA ['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('Club', $club['id']); ?></td>
		<td><?php echo form_input($club); ?></td>
		<td style="color: red;"><?php echo form_error($club['name']); ?><?php echo isset($errors[$club['name']])?$errors[$club['name']]:''; ?></td>
	</tr>
</table>
<?php echo form_submit('update', 'Update'); ?>
<?php echo form_close(); ?>