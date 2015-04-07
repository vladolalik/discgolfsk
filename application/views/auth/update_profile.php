<?php $this->load->view('header', array('title' => 'Update profile', 'caption' => 'Update profile')) ?>
<?php

$first_name = array(
	'name' => 'first_name',
	'id'   => 'first_name',
	'value'=> set_value('first_name', $first_name),
	'max_length'=> 45,
	'size' => 30,
	'class' => 'form-control',
	'placeholder' => 'First name'
);
$last_name = array(
	'name' => 'last_name',
	'id'   => 'last_name',
	'value'=> set_value('last_name', $last_name),
	'max_length'=> 45,
	'size' => 30,
	'class' => 'form-control',
	'placeholder' => 'Last name'
);
$country = array (
	'name' => 'country',
	'id' => 'country',
	'value' => set_value('country', $country),
	'class' => 'form-control',
	'placeholder' => '(SK, CZ, AT, HU, PL, USA, DE, HR, IT, UK, ...)'
);
$birth = array(
	'name' => 'birth_date',
	'id'   => 'birth_date',
	'value'=> set_value('birth_date', $birth_date),
	'class' => 'form-control'
);
$genderA = array(
	'name' => 'gender',
	'id' => 'gender',
	'class' => 'form-control'
);

$options_gender = array(
	'male' => 'male',
	'female' => 'female'
);

$club = array(
	'id' => 'club',
	'name' => 'club',
	'value' => set_value('club', $club),
	'class' => 'form-control',
	'placeholder' => 'Club'
	
);
$about = array (
	'id' => 'about',
	'name' => 'about',
	'value' => set_value('about', $about),
	'class' => 'tinymc',
	'style' => 'max-width:400px',
	'class' => 'form-control',
	'placeholder' => 'About'
);

?>
<?php echo form_open('auth/update_profile/', array('class' => 'form-horizontal')); ?>

	<?php $attributes = array('class' => 'col-sm-2 control-label'); ?>

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
		<?php echo form_label('Gender', $genderA['id'], $attributes); ?>
		<div class="col-sm-6">
			<select name="gender" id="gender" class="form-control">
				<option value="Male" <?php echo set_select('gender', 'Male', $gender == 'Male'? TRUE : FALSE); ?> >Male</option>
				<option value="Female" <?php echo set_select('gender', 'Female', $gender =='Female'? TRUE : FALSE); ?> >Female</option>
			</select>
		</div>
		<div class="col-sm-4">	
			<span style="color: red;"><?php echo form_error($genderA['name']); ?><?php echo isset($errors[$genderA['name']])?$errors[$genderA ['name']]:''; ?></span>
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
		<?php echo form_label('About', $about['id'], $attributes); ?>
		<div class="col-sm-6"><?php echo form_textarea($about); ?></div>
		<div class="col-sm-4">
			<span style="color: red;"><?php echo form_error($about['name']); ?><?php echo isset($errors[$about['name']])?$errors[$about['name']]:''; ?></span>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-6 col-sm-offset-2" >
			<?php echo form_submit('update', 'Update'); ?>
		</div>
	</div>
<?php echo form_close(); ?>