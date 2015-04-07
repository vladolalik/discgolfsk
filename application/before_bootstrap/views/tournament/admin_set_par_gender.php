<?php 
/**
* @author Vladimir Lalik
*/
 $this->load->view('admin/admin_header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); ?>

 <?php

 	echo form_open('tournaments/admin_set_par_lap_gender/'.$this->uri->segment(3)); ?>
 	<fieldset>
 		<legend>Set par <?php echo $tournament['name'].' ('.$tournament['date'].')'; ?></legend>
 		<table>
 			<tr>
 				<td><?php echo form_label('Gender', 'gender'); ?></td>
 				<td><?php echo '<select name="gender" id="gender">';
 						for ($j=0; $j<2; $j++)
						{
							if ($j==0){
								$gender="Male";
							}else{
								$gender="Female";
							}
 					  		echo '<option value="'.strtolower($gender).'" '.set_select('gender', strtolower($gender)).'>'.$gender.'</option>';	
 						 }
 				    ?>
 				   </select> 
 				</td>
 				<td style="color: red;"><?php echo form_error('gender'); ?></td>
 			</tr>
 		</table>
 		<table id="par">
 			
		 	<?php
		 	/* One par field name has this form "basket_[basket_order]_[category_id]*/
		 		for ($j=0; $j<2; $j++)
				{
					if ($j==0){
						$gender="male";
					}else{
						$gender="female";
					}
			 		for($i=1; $i<=20; $i++)
			 		{
			 			if (isset($unique_par['basket_'.$i.'_'.$gender])){
			 				$option_input = array (
			 					'name'=>'basket_'.$i.'_'.$gender,
			 					'id'=>'basket_'.$i.'_'.$gender,
			 					'class'=>$gender,
			 					'value'=>set_value('basket_'.$i.'_'.$gender, $unique_par['basket_'.$i.'_'.$gender] )
			 				);	
			 			} 
			 			else 
			 			{
			 				$option_input = array (
			 					'name'=>'basket_'.$i.'_'.$gender,
			 					'id'=>'basket_'.$i.'_'.$gender,
			 					'class'=>$gender,
			 					'value'=>set_value('basket_'.$i.'_'.$gender)
			 				);
			 			}
			 			echo '<tr class="'.$gender.'"><td>'.form_label('Basket '.$i, 'basket_'.$i.'_'.$gender).'</td>';
			 			echo '<td>'.form_input($option_input).'</td>';
			 			echo '<td style="color: red;">'.form_error($option_input['name']).'</td></tr>';
			 		}
			 	}
		 	?>
		 </table>
	<?php echo form_error(); ?>
 	</fieldset>
 <?php
 	echo form_submit('set', 'Set par');
 	echo form_close();
 ?>
 <script>
 	$(function(){
 		var klon = $('#par').clone();
 		var superklon = $('#par').clone();
 		$('#par').empty();
 		$('#par').append(klon.children('tbody').children('tr.' + $('#gender option:selected').attr('value')));
 		console.log($('#gender option:selected').attr('value'));

 		$('#gender').change(function(){
 			$('#par').empty();
 			$('#par').append(klon.children('tbody').children('tr.' + $('#gender option:selected').attr('value')));
 			klon=superklon.clone();
 		});
 	});

 </script>