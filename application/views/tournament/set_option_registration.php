
<?php $this->load->view('admin/admin_header', array('title'=>'Set option for registration on tournaments', 'caption'=>'Set option for registration on tournaments')); ?>

<?php 
	
	if ($options!=NULL){
		foreach ($options as $option){
			$values[$option['type'].'_'.$option['number']]=$option['what'];
		}
	}

	for($i=1; $i<11;$i++){
	  $option_food[$i]=array (
	  	'type'=>'text',
		'name'=>'food_'.$i,
		'id'=>'food_'.$i,
	  );	

	  if (isset($values['food_'.$i])){
	  	$option_food[$i]['value']=set_value('food_'.$i, $values['food_'.$i]);
	  } else {
	  	$option_food[$i]['value']=set_value('food_'.$i);
	  }
	
	  $option_accom[$i]=array (
	  	'type'=>'text',
		'name'=>'accom_'.$i,
		'id'=>'accom_'.$i,
	  );

	  if (isset($values['accom_'.$i])){
	  	$option_accom[$i]['value']=set_value('accom_'.$i, $values['accom_'.$i]);
	  } else {
	  	$option_accom[$i]['value']=set_value('accom_'.$i);
	  }	
	}
?>

<fieldset>
	<legend>Set option for <?php echo $tournament['name'].' '.date('F d, Y', strtotime($tournament['date'])); ?></legend>
<table>

<?php //print_r($tournaments); 
	echo form_open('/tournaments/admin_set_reg_option/'.$tournament['tournament_id']);
	for($i=1; $i<11;$i++){
		echo '<tr><td>'.form_label('Food option '.$i, 'food_'.$i).'</td>';
		echo '<td>'.form_input($option_food[$i]).'</td>';
		echo '<td style="color: red;">'.form_error($option_food[$i]['name']).'</td></tr>';
	}
?>

<?php //print_r($tournaments); 
	for($i=1; $i<11;$i++){
		echo '<tr><td>'.form_label('Accommodation option '.$i, 'accom_'.$i).'</td>';
		echo '<td>'.form_input($option_accom[$i]).'</td>';
		echo '<td style="color: red;">'.form_error($option_accom[$i]['name']).'</td></tr>';
	}

    
    //print_r($options);
 ?>

</table>
<?php 
	echo form_submit('set', 'Set');
	echo form_close();
?>
</fieldset>
<p style="margin-top:10px;">Note: If you leave option blank this option will be deleted.</p>
<?php $this->load->view('admin/admin_footer'); ?>
