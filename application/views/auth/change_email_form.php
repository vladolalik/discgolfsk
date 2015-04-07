
<?php $this->load->view('header', array('title' => 'Change email', 'caption' => 'Change email')) ?>
<?php
$password = array(
	'name'	=> 'password',
	'id'	=> 'password',
	'size'	=> 30,
	'class' => 'form-control',
	'placeholder' => 'Password'
);
$email = array(
	'name'	=> 'email',
	'id'	=> 'email',
	'value'	=> set_value('email'),
	'maxlength'	=> 80,
	'size'	=> 30,
	'class' => 'form-control',
	'placeholder' => 'New email address'
);
?>
<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
	<?php $attributes = array('class' => 'col-sm-2 control-label'); ?>
	<div class="form-group"> 
		<?php echo form_label('Password', $password['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_password($password); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($password['name']); ?><?php echo isset($errors[$password['name']])?$errors[$password['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group"> 
		<?php echo form_label('New email address', $email['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_input($email); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($email['name']); ?><?php echo isset($errors[$email['name']])?$errors[$email['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-6 col-sm-offset-2">
			<?php echo form_submit('change', 'Change email'); ?>
		</div>
	</div>
<?php echo form_close(); ?>