<?php $this->load->view('header', array('title' => 'Create Account', 'caption' => 'Create Account')) ?>
<script type="text/javascript">
$(function() {		
	//DATEPICKER jQuery UI
	$( "#birth_date" ).datepicker({
		inline: true,
		dateFormat: "dd.mm.yy"
	});
});
</script>

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
	'class' => 'form-control',
	'placeholder' => 'Email'
);
$first_name = array(
	'name' => 'first_name',
	'id'   => 'first_name',
	'value'=> set_value('first_name'),
	'max_length'=> 45,
	'size' => 30,
	'class' => 'form-control',
	'placeholder' => 'First name'
);
$last_name = array(
	'name' => 'last_name',
	'id'   => 'last_name',
	'value'=> set_value('last_name'),
	'max_length'=> 45,
	'size' => 30,
	'class' => 'form-control',
	'placeholder' => 'Last name'
);
$country = array (
	'name' => 'country',
	'id' => 'country',
	'value' => set_value('country'),
	'class' => 'form-control',
	'placeholder' => '(SK, CZ, AT, HU, PL, USA, DE, HR, IT, UK, ...)'
);
$birth = array(
	'name' => 'birth_date',
	'id'   => 'birth_date',
	'value'=> set_value('birth_date'),
	'class' => 'form-control'
);
$password = array(
	'name'	=> 'password',
	'id'	=> 'password',
	'value' => set_value('password'),
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size'	=> 30,
	'class' => 'form-control',
	'placeholder' => 'Password'
);
$confirm_password = array(
	'name'	=> 'confirm_password',
	'id'	=> 'confirm_password',
	'value' => set_value('confirm_password'),
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size'	=> 30,
	'class' => 'form-control',
	'placeholder' => 'Confirm password'
);
$captcha = array(
	'name'	=> 'captcha',
	'id'	=> 'captcha',
	'maxlength'	=> 8,
	'class' => 'form-control'
);

$gender = array(
	'name' => 'gender',
	'id' => 'gender',
	'class' => 'form-control'
);

$options_gender = array(
	'Male' => 'Male',
	'Female' => 'Female'
);

$club = array(
	'id' => 'club',
	'name' => 'club',
	'value' => set_value('club'),
	'class' => 'form-control',
	'placeholder' => 'Club'
);
$about = array (
	'id' => 'about',
	'name' => 'about',
	'value' => set_value('about'),
	'style' => 'max-width:400px',
	'class' => 'form-control',
	'placeholder' => 'About'
);


echo $this->input->post('first_name');
?>
<?php $attributes = array('class' => 'col-sm-2 control-label'); ?>
<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
	<?php if ($use_username) { ?>
	<div class="form-group">
		<?php echo form_label('Username', $username['id'], $attributes); ?>
		<div class="col-sm-10"><?php echo form_input($username); ?></div>
		<div style="color: red;"><?php echo form_error($username['name']); ?><?php echo isset($errors[$username['name']])?$errors[$username['name']]:''; ?></div>
	</div>
	<?php } ?>
	<div class="form-group">
		<?php echo form_label('First Name', $first_name['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($first_name); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($first_name['name']); ?><?php echo isset($errors[$first_name['name']])?$errors[$first_name['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Last Name', $last_name['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($last_name); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($last_name['name']); ?><?php echo isset($errors[$last_name['name']])?$errors[$last_name['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Country', $country['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($country); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($country['name']); ?><?php echo isset($errors[$country['name']])?$errors[$country['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Day of birth', $birth['id'], $attributes); ?>
		<div class="col-sm-6"><input type="text" name="birth_date" class="form-control" value="<?php echo set_value('birth_date'); ?>" id="birth_date"></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($birth['name']); ?><?php echo isset($errors[$birth['name']])?$errors[$birth ['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Gender', $gender['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_dropdown($gender['name'], $options_gender, $options_gender['Male'], 'id="gender" class="form-control"')?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($gender['name']); ?><?php echo isset($errors[$gender['name']])?$errors[$gender ['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Club', $club['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($club); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($club['name']); ?><?php echo isset($errors[$club['name']])?$errors[$club['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Email Address', $email['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($email); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($email['name']); ?><?php echo isset($errors[$email['name']])?$errors[$email['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('About', $about['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_textarea($about); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($about['name']); ?><?php echo isset($errors[$about['name']])?$errors[$about['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Password', $password['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_password($password); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($password['name']); ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Confirm Password', $confirm_password['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_password($confirm_password); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($confirm_password['name']); ?></span>
		</div>
	</div>


	<?php if ($captcha_registration) {
		if ($use_recaptcha) { ?>
	<div class="form-group">
			<div class="col-sm-6 col-sm-offset-2" id="recaptcha_image"></div>
		<div class="col-sm-4" style="margin-left: 30px;">
			<a href="javascript:Recaptcha.reload()">Get another CAPTCHA</a>
			<div class="recaptcha_only_if_image"><a href="javascript:Recaptcha.switch_type('audio')">Get an audio CAPTCHA</a></div>
			<div class="recaptcha_only_if_audio"><a href="javascript:Recaptcha.switch_type('image')">Get an image CAPTCHA</a></div>
		</div>
	</div>
	<div class="form-group">
			<label for="recaptcha_response_field" class="recaptcha_only_if_image col-sm-2 control-label">Enter the words above</label>
			<label for="recaptcha_response_field" class="recaptcha_only_if_audio col-sm-2 control-label">Enter the numbers you hear</label>
		
			<div class="col-sm-6">
				<input type="text" class="form-control" id="recaptcha_response_field" name="recaptcha_response_field" />
			</div>
			<div class="col-sm-4">
				<span style="color: red;"><?php echo form_error('recaptcha_response_field'); ?></span>
			</div>
		<?php echo $recaptcha_html; ?>
	</div>
	<?php } else { ?>
	<div class="form-group">
		<div class="col-sm-6 col-sm-offset-2" >
			<p>Enter the code exactly as it appears:</p>
			<?php echo $captcha_html; ?>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Confirmation Code', $captcha['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($captcha); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($captcha['name']); ?></span>
		</div>
	</div>
	<?php }
	} ?>
	<div class="form-group">
		<div class="col-sm-6 col-sm-offset-2" >
			<?php echo form_submit('register', 'Register', 'id="registration-submit"'); ?>
		</div>
	</div>
<?php echo form_close(); ?>
<?php $this->load->view('footer'); ?>