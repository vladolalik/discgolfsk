

<?php $this->load->view('admin/admin_header', array('title'=>'Create tournament', 'caption'=>'Create tournament')); ?>
	<fieldset>
		<legend>Tournament data</legend>
		<?php 
		//	echo validation_errors();
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
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php 
		echo '<td>'.form_label('Tournament Date from: ','date').'</td>';
		$options=array(
			'name'	=>'date',
			'id'	=>'date',
			'type'	=>'text',
			'value' => set_value('date')
		);
		echo '<td>'.form_input($options).'</td>'; 
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php 
		echo '<td>'.form_label('Tournament Date to: ','date_to').'</td>';
		$options=array(
			'name'	=>'date_to',
			'id'	=>'date_to',
			'type'	=>'text',
			'value' => set_value('date_to')
		);
		echo '<td>'.form_input($options).'</td>'; 
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'capacity',
			'id'	=>'capacity',
			'type'	=>'text',
			'value' =>set_value('capacity')
		);  
		echo '<td>'.form_label('Tournament Capacity: ','capacity').'</td>';
		echo '<td>'.form_input($options).'</td>'; 
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
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
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr><td> <h3>Permitted categories for registration</h3></td></tr>
	<?php 
		foreach ($categories as $key => $category) {
			$options=array (
				'name'=> $category['category_id'],
				'id'=> $category['category_id'],
				'value'=>$category['category'],
				'checked'=>'TRUE'
			);

			echo '<tr><td>'.form_label($category['category'], $options['id']);
			echo '<td>'.form_checkbox($options).'</td>';
			echo '<td style="color: red;">'.form_error($options['name']).'</td></tr>';
		}
	?>
	<tr><td> <h3>Results</h3></td></tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'slovak_champ',
			'id'	=>'slovak_champ',
			'value' => '1',

		); 
		echo '<td>'.form_label('Slovak championship ','slovak_champ').'</td>';
		echo '<td>'.form_checkbox($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
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
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
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
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'max_open',
			'id'	=>'max_open',
			'value' => set_value('max_open')
		); 
		echo '<td>'.form_label('Max OPEN: ','max_open').'</td>';
		echo '<td>'.form_input($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'max_women',
			'id'	=>'max_women',
			'value' => set_value('max_women')
		); 
		echo '<td>'.form_label('Max WOMEN: ','max_women').'</td>';
		echo '<td>'.form_input($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr><td> <h3>Location</h3></td></tr>
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
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'lat',
			'id'	=>'lat',
			'value' => set_value('lat')
		); 
		echo '<td>'.form_label('Latitude: ','lat').'</td>';
		echo '<td>'.form_input($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
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
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr><td> <h3>Director of tournament</h3></td></tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'dir_name',
			'id'	=>'dir_name',
			'value' => set_value('dir_name')
		); 
		echo '<td>'.form_label('Director\'s name: ','dir_name').'</td>';
		echo '<td>'.form_input($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'dir_phone',
			'id'	=>'dir_phone',
			'value' => set_value('dir_phone')
		); 
		echo '<td>'.form_label('Director\'s phone: ','dir_phone').'</td>';
		echo '<td>'.form_input($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	<tr>
	<?php
		$options=array(
			'name'	=>'dir_email',
			'id'	=>'dir_email',
			'value' => set_value('dir_email')
		); 
		echo '<td>'.form_label('Director\'s email: ','dir_email').'</td>';
		echo '<td>'.form_input($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
	
</table>
<table>
	<tr>
	<?php
		$options=array(
			'name'	=>'about',
			'id' => 'about',
			'value' => set_value('about'),
			'class' => 'tinymc'
		); 
		echo '<td><h3>'.form_label('About: ','about').'</h3></td></tr>';
		echo '<tr><td>'.form_textarea($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
</table>
	<?php echo form_submit('mysubmit', 'Submit');?>
</fieldset>
	

	
</body>
</html>