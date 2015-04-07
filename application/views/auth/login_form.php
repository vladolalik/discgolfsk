<?php $this->load->view('header', array('title' => 'Login', 'caption' => 'Login')) ?>
<?php

$login = array(
	'name'	=> 'login',
	'id'	=> 'login',
	'value' => set_value('login'),
	'maxlength'	=> 80,
	'size'	=> 30,
	'class' => 'form-control',
	'placeholder' => 'Email'
);
if ($login_by_username AND $login_by_email) {
	$login_label = 'Email or login';
} else if ($login_by_username) {
	$login_label = 'Login';
} else {
	$login_label = 'Email';
}
$password = array(
	'name'	=> 'password',
	'id'	=> 'password',
	'size'	=> 30,
	'class' => 'form-control',
	'placeholder' => 'Password'
);
$remember = array(
	'name'	=> 'remember',
	'id'	=> 'remember',
	'value'	=> 1,
	'checked'	=> set_value('remember'),
	'style' => 'margin:0;padding:0',
);
$captcha = array(
	'name'	=> 'captcha',
	'id'	=> 'captcha',
	'maxlength'	=> 8,
	'class' => 'form-control'
);
echo $this->session->flashdata('message');
?>
<?php $attributes = array('class' => 'form-horizontal'); ?>
<?php echo form_open($this->uri->uri_string(), $attributes); ?>
	<div class="form-group">
		<?php $attributes = array('class' => 'col-sm-2 control-label'); ?>
		<?php echo form_label($login_label, $login['id'], $attributes); ?>
		<div class="col-sm-6">
			<?php echo form_input($login); ?>
		</div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($login['name']); ?><?php echo isset($errors[$login['name']])?$errors[$login['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php $attributes = array('class' => 'col-sm-2 control-label'); ?>
		<?php echo form_label('Password', $password['id'], $attributes); ?>
		<div class="col-sm-6">
			<?php echo form_password($password); ?>
		</div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($password['name']); ?><?php echo isset($errors[$password['name']])?$errors[$password['name']]:''; ?></span>
		</div>
	</div>

	
	<?php if ($show_captcha) {
		if ($use_recaptcha) { ?>
	
	<div class="form-group">
		<div id="recaptcha_image" class="col-sm-6 col-sm-offset-2"></div>
		<div class="col-sm-4" style="margin-left: 25px;">
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
			<span style="color: red;"><?php echo form_error('recaptcha_response_field'); ?>
		</div>
	</div>
	<div>
		<?php echo $recaptcha_html; ?>
	</div>

	<?php } else { ?>
	<div class="form-group">
		
			<p>Enter the code exactly as it appears:</p>
			<?php echo $captcha_html; ?>
		
	</div>
	<div class="form-group">
		<?php $attributes = array('class' => 'col-sm-2 control-label'); ?>
		<?php echo form_label('Confirmation Code', $captcha['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($captcha); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($captcha['name']); ?></span>
		</div>
	</div>
	<?php }
	} ?>
	<div class="form-group">
		<div class="col-sm-8 col-sm-offset-2" >
			<?php echo form_submit('submit', 'Let me in'); ?>
		</div>
	</div>
	<div class="registration-row-wrapper form-group">
		<div class="checkbox col-sm-offset-2 col-sm-6"> 
			<?php echo form_checkbox($remember); ?>
			<?php echo form_label('Remember me', $remember['id']); ?>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10 col-sm-offset-2">
			<?php if ($this->config->item('allow_registration', 'tank_auth')) echo anchor('/auth/register/', 'Register now', 'class="btn btn-success btn-xs"'); ?>
			<?php echo anchor('/auth/forgot_password', 'Did you forgot your password?', 'title="Forgotten password" class="btn btn-primary btn-xs"'); ?>
		</div>
	</div>


<?php echo form_close(); ?>
<?php $this->load->view('footer') ?>