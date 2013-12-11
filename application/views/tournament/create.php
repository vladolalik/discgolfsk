<?php $this->load->view('admin/admin_header', array('title'=>'Create tournament', 'caption'=>'Create tournament')); ?>
	<fieldset>
		<legend>Tournament data</legend>
		<?php 
			echo validation_errors();
			echo form_open($this->uri->uri_string()); ?>
		<br />
		
		<table id="add-tournament">
			<tr>
	<?php
		$options=array(
			'name'	=>'name',
			'id'	=>'name',
			'type'	=>'text',
			'value' =>set_value('name')
		); 
		echo '<td>'.form_label('Tournament Name: ','name').'</td>';
		echo '<td>'.form_input($options).'</td>'; 
	?>
	</tr>
	<tr>
	<?php 
		echo '<td>'.form_label('Tournament Date: ','date').'</td>';
		$options=array(
			'name'	=>'date',
			'id'	=>'date',
			'type'	=>'date',
			'value' => set_value('date')
		);
		echo '<td>'.form_input($options).'</td>';  
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'location',
			'id'	=>'location',
			'type'	=>'text',
			'value' =>set_value('location')
		);  
		echo '<td>'.form_label('Tournament Location: ','location').'</td>';
		echo '<td>'.form_input($options).'</td>'; 
	?>
	</tr>
	<tr>
	<?php 
		$options=array(
			'name'	=>'rounds',
			'id'	=>'rounds',
			'value' => set_value('rounds')
		);
		echo '<td>'.form_label('Number of Rounds: ','rounds').'</td>';
		echo '<td>'.form_input($options).'</td>'; 
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'rounds_final',
			'id'	=>'rounds_final',
			'value' => set_value('rounds_final')
		); 
		echo '<td>'.form_label('Number of Rounds in Final: ','rounds_final').'</td>';
		echo '<td>'.form_input($options).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'lat',
			'id'	=>'lat',
			'value' => set_value('lat')
		); 
		echo '<td>'.form_label('Lattitude: ','lat').'</td>';
		echo '<td>'.form_input($options).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'lng',
			'id'	=>'lng',
			'value' => set_value('lng')
		); 
		echo '<td>'.form_label('Longtitude: ','lng').'</td>';
		echo '<td>'.form_input($options).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'allow_registration',
			'id'	=>'allow_registration',
			'value' => '1',
			'checked' => 'TRUE'

		); 
		echo '<td>'.form_label('Allow registration ','allow_registraion').'</td>';
		echo '<td>'.form_checkbox($options).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'about',
			'id' => 'about',
			'value' => set_value('about'),
			'class' => 'tinymc'
		); 
		echo '<td>'.form_label('About: ','about').'</td>';
		echo '<td>'.form_textarea($options).'</td>';
	?>
	</tr>
</table>
	<?php echo form_submit('mysubmit', 'Submit');?>
</fieldset>
	

	
</body>
</html>