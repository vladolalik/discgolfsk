<?php $this->load->view('header', array('title' => 'Register existing auto-created profile', 'caption' => 'Register existing auto-created profile')) ?>
<?php
if ($use_username) {
	$username = array(
		'name'	=> 'username',
		'id'	=> 'username',
		'value' => set_value('username'),
		'maxlength'	=> $this->config->item('username_max_length', 'tank_auth'),
		'size'	=> 30,
	);
}
$email = array(
	'name'	=> 'email',
	'id'	=> 'email',
	'value'	=> set_value('email'),
	'maxlength'	=> 80,
	'size'	=> 30,
);
$first_name = array(
	'name' => 'first_name',
	'id'   => 'first_name',
	'value'=> set_value('first_name', $first_name),
	'max_length'=> 45,
	'size' => 30,
	'readonly' => 'readonly'
);
$last_name = array(
	'name' => 'last_name',
	'id'   => 'last_name',
	'value'=> set_value('last_name', $last_name),
	'max_length'=> 45,
	'size' => 30,
	'readonly' => 'readonly'
);
$country = array (
	'name' => 'country',
	'id' => 'country',
	'value' => set_value('country', $country)
);
$birth = array(
	'name' => 'birth_date',
	'id'   => 'birth_date',
	'value'=> set_value('birth_date', $birth_date),
);
$password = array(
	'name'	=> 'password',
	'id'	=> 'password',
	'value' => set_value('password'),
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size'	=> 30,
);
$confirm_password = array(
	'name'	=> 'confirm_password',
	'id'	=> 'confirm_password',
	'value' => set_value('confirm_password'),
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size'	=> 30,
);
$captcha = array(
	'name'	=> 'captcha',
	'id'	=> 'captcha',
	'maxlength'	=> 8,
);

$genderA = array(
	'name' => 'gender',
	'id' => 'gender'
);

$options_gender = array(
	'Male' => 'Male',
	'Female' => 'Female'
);

$club = array(
	'id' => 'club',
	'name' => 'club',
	'value' => set_value('club',$club)
);
$about = array (
	'id' => 'about',
	'name' => 'about',
	'value' => set_value('about')
);

echo $this->input->post('first_name');
?>
<?php echo form_open('auth/register_existing_profile/'.$user_id); ?>
<table>
	<?php if ($use_username) { ?>
	<tr>
		<td><?php echo form_label('Username', $username['id']); ?></td>
		<td><?php echo form_input($username); ?></td>
		<td style="color: red;"><?php echo form_error($username['name']); ?><?php echo isset($errors[$username['name']])?$errors[$username['name']]:''; ?></td>
	</tr>
	<?php } ?>
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
		<td><?php echo form_label('Country', $country['id']); ?></td>
		<td><?php echo form_input($country); ?></td>
		<td style="color: red;"><?php echo form_error($country['name']); ?><?php echo isset($errors[$country['name']])?$errors[$country['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('Day of birth', $birth['id']); ?></td>
		<td><input type="text" name="birth_date" value="<?php echo set_value('birth_date', $birth_date)?>" id="birth_date"></td>
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
	<tr>
		<td><?php echo form_label('Email Address', $email['id']); ?></td>
		<td><?php echo form_input($email); ?></td>
		<td style="color: red;"><?php echo form_error($email['name']); ?><?php echo isset($errors[$email['name']])?$errors[$email['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('About', $about['id']); ?></td>
		<td><?php echo form_textarea($about); ?></td>
		<td style="color: red;"><?php echo form_error($about['name']); ?><?php echo isset($errors[$about['name']])?$errors[$about['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('Password', $password['id']); ?></td>
		<td><?php echo form_password($password); ?></td>
		<td style="color: red;"><?php echo form_error($password['name']); ?></td>
	</tr>
	<tr>
		<td><?php echo form_label('Confirm Password', $confirm_password['id']); ?></td>
		<td><?php echo form_password($confirm_password); ?></td>
		<td style="color: red;"><?php echo form_error($confirm_password['name']); ?></td>
	</tr>

	<?php if ($captcha_registration) {
		if ($use_recaptcha) { ?>
	<tr>
		<td colspan="2">
			<div id="recaptcha_image"></div>
		</td>
		<td>
			<a href="javascript:Recaptcha.reload()">Get another CAPTCHA</a>
			<div class="recaptcha_only_if_image"><a href="javascript:Recaptcha.switch_type('audio')">Get an audio CAPTCHA</a></div>
			<div class="recaptcha_only_if_audio"><a href="javascript:Recaptcha.switch_type('image')">Get an image CAPTCHA</a></div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="recaptcha_only_if_image">Enter the words above</div>
			<div class="recaptcha_only_if_audio">Enter the numbers you hear</div>
		</td>
		<td><input type="text" id="recaptcha_response_field" name="recaptcha_response_field" /></td>
		<td style="color: red;"><?php echo form_error('recaptcha_response_field'); ?></td>
		<?php echo $recaptcha_html; ?>
	</tr>
	<?php } else { ?>
	<tr>
		<td colspan="3">
			<p>Enter the code exactly as it appears:</p>
			<?php echo $captcha_html; ?>
		</td>
	</tr>
	<tr>
		<td><?php echo form_label('Confirmation Code', $captcha['id']); ?></td>
		<td><?php echo form_input($captcha); ?></td>
		<td style="color: red;"><?php echo form_error($captcha['name']); ?></td>
	</tr>
	<?php }
	} ?>
</table>
<?php echo form_submit('register', 'Register'); ?>
<?php echo form_close(); ?>