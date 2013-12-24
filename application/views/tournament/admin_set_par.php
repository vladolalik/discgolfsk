<?php 
/**
* @author Vladimir Lalik
*/
 $this->load->view('admin/admin_header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); ?>

 <?php

 	echo form_open('tournaments/admin_set_par_lap/'.$this->uri->segment(3)); ?>
 	<fieldset>
 		<legend>Set par</legend>
 		<table>
 			<tr>
 				<td><?php echo form_label('Categories', 'category_id'); ?></td>
 				<td><?php echo '<select name="category_id" id="category_id">';
 						  foreach ($categories as $key => $value) {
 						  		echo '<option value="'.$value['category_id'].'" '.set_select('category_id', $value['category_id']).'>'.$value['category'].'</option>';	
 						  }
 				    ?>
 				   </select> 
 				</td>
 				<td style="color: red;"><?php echo form_error('category_id'); ?></td>
 			</tr>
 		</table>
 		<table id="par">
 			
		 	<?php
		 	/* One par field name has this form "basket_[basket_order]_[category_id]*/
		 		foreach($categories as $key=>$val)
		 		{
			 		for($i=1; $i<=20; $i++)
			 		{
			 			if (isset($unique_par['basket_'.$i.$val['category_id']])){
			 				$option_input = array (
			 					'name'=>'basket_'.$i.'_'.$val['category_id'],
			 					'id'=>'basket_'.$i.'_'.$val['category_id'],
			 					'class'=>$val['category_id'],
			 					'value'=>set_value('basket_'.$i, $unique_par['basket_'.$i.$val['category_id']] )
			 				);	
			 			} 
			 			else 
			 			{
			 				$option_input = array (
			 					'name'=>'basket_'.$i.'_'.$val['category_id'],
			 					'id'=>'basket_'.$i.'_'.$val['category_id'],
			 					'class'=>$val['category_id'],
			 					'value'=>set_value('basket_'.$i )
			 				);
			 			}
			 			echo '<tr class="'.$val['category_id'].'"><td>'.form_label('Basket '.$i, 'basket_'.$i.'_'.$val['category_id']).'</td>';
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
 		$('#par').append(klon.children('tbody').children('tr.' + $('#category_id option:selected').attr('value')));
 		console.log($('#category_id option:selected').attr('value'));

 		$('#category_id').change(function(){
 			$('#par').empty();
 			$('#par').append(klon.children('tbody').children('tr.' + $('#category_id option:selected').attr('value')));
 			klon=superklon.clone();
 		});
 	});

 </script>