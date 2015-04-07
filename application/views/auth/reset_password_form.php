<?php $this->load->view('header', array('title' => 'REset password', 'caption' => 'Reset password')) ?>
<?php
$new_password = array(
	'name'	=> 'new_password',
	'id'	=> 'new_password',
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size'	=> 30,
	'class' => 'form-control',
	'placeholder' => 'New password'
);
$confirm_new_password = array(
	'name'	=> 'confirm_new_password',
	'id'	=> 'confirm_new_password',
	'maxlength'	=> $this->config->item('password_max_length', 'tank_auth'),
	'size' 	=> 30,
	'class' => 'form-control',
	'placeholder' => 'Confirm new password'
);
?>
<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
	<?php $attributes = array('class' => 'col-sm-2 control-label'); ?>
	<div class="form-group">
		<?php echo form_label('New Password', $new_password['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_password($new_password); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($new_password['name']); ?><?php echo isset($errors[$new_password['name']])?$errors[$new_password['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<?php echo form_label('Confirm New Password', $confirm_new_password['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_password($confirm_new_password); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($confirm_new_password['name']); ?><?php echo isset($errors[$confirm_new_password['name']])?$errors[$confirm_new_password['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-groupt">
		<?php echo form_submit('change', 'Change Password'); ?>
	</div>
<?php echo form_close(); ?>