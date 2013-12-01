<html>
<head>
<title>Tournament</title>
</head>
<body>
	<h1>Create a new tournament</h1>
	<?php 
		echo validation_errors();
		echo form_open($this->uri->uri_string()); ?>
	<br />
	<?php
		$options=array(
			'name'	=>'name',
			'type'	=>'text',
			'value' =>set_value('name')
		); 
		echo form_label('Tournament Name: ','name');
		echo form_input($options); 
	?>
	<br />
	<?php 
		echo form_label('Tournament Date: ','date');
		$options=array(
			'name'	=>'date',
			'type'	=>'date',
			'value' => set_value('date')
		);
		echo form_input($options);  
	?>
	<br />
	<?php
		$options=array(
			'name'	=>'location',
			'type'	=>'text',
			'value' =>set_value('location')
		);  
		echo form_label('Tournament Location: ','location');
		echo form_input($options); 
	?>
	<br />
	
	<?php 
		$options=array(
			'name'	=>'rounds',
			'style'	=>'width:50px',
			'value' => set_value('rounds')
		);
		echo form_label('Number of Rounds: ','rounds');
		echo form_input($options); 
	?>
	<br />
	<?php
		$options=array(
			'name'	=>'rounds_final',
			'style'	=>'width:50px',
			'value' => set_value('rounds_final')
		); 
		echo form_label('Number of Rounds in Final: ','rounds_final');
		echo form_input($options); 
	?>
	<br />
	<?php echo form_submit('mysubmit', 'Submit');?>

	

	
</body>
</html>