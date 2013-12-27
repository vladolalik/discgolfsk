<?php 
/**
* @author Vladimir Lalik
*/
 $this->load->view('admin/admin_header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); ?>

<fieldset>
		<legend>Number of tournaments which count to Slovak championship ranklist</legend>
		<?php 
		//	echo validation_errors();
			echo form_open($this->uri->uri_string()); ?>
		<br />

 <table>
			<tr>
	<?php
		$options=array(
			'name'	=>'nmbr_accept_tourn',
			'id'	=>'nmbr_accept_tourn',
			'type'	=>'text',
			'value' =>set_value('nmbr_accept_tourn', $nmbr_accept_tourn)
		); 
		echo '<td>'.form_label('Number: ','nmbr_accept_tourn').'</td>';
		echo '<td>'.form_input($options).'</td>';
		echo '<td style="color: red;">'.form_error($options['name']).'</td>';
	?>
	</tr>
</table>
<?php echo form_submit('mysubmit', 'Submit');?>
<?php echo form_close();?>