<?php 
/**
* @author Vladimir Lalik
*/
 $this->load->view('admin/admin_header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); ?>

 <?php

 	echo form_open('tournaments/admin_set_par_lap/'.$this->uri->segment(3)); ?>
 	<fieldset>
 		<legend>Set par <?php echo $tournament['name'].' ('.date('F d, Y', strtotime($tournament['date'])).')'; ?></legend>
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
			 		//print_r($unique_par);
			 		foreach($categories as $key=>$val)
			 		{
			 			
			 			for ($num=1; $num<=$number_of_round; $num++) // all rounds
			 			{
				 			echo '<tr class="'.$val['category_id'].'">';
				 			echo '<td></td>';
				 			for($i=1; $i<=20; $i++){ // all baskets
				 				echo '<td align="center">'.form_label( $i, 'basket_'.$i.'_'.$val['category_id'].'_'.$num).'</td>';
				 			}
				 			echo '</tr>';
				 			echo '<tr class="'.$val['category_id'].'">';
				 			echo '<td align="center"><b>Round '.$num.'</b></td>';
					 		for($i=1; $i<=20; $i++)
					 		{
					 			if (isset($unique_par['basket_'.$i.'_'.$val['category_id'].'_'.$num])){
					 				$option_input = array (
					 					'name'=>'basket_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'id'=>'basket_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'size'=>'1',
					 					'class'=>$val['category_id'],
					 					'value'=>set_value('basket_'.$i.'_'.$val['category_id'].'_'.$num, $unique_par['basket_'.$i.'_'.$val['category_id'].'_'.$num] )
					 				);	
					 			} 
					 			else 
					 			{
					 				$option_input = array (
					 					'name'=>'basket_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'id'=>'basket_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'size'=>'1',
					 					'class'=>$val['category_id'],
					 					'value'=>set_value('basket_'.$i.'_'.$val['category_id'].'_'.$num )
					 				);
					 			}
					 			//echo '<tr class="'.$val['category_id'].'"><td>'.form_label('Basket '.$i, 'basket_'.$i.'_'.$val['category_id']).'</td>';
					 			echo '<td>'.form_input($option_input).'</td>';
					 			//echo '<td style="color: red;">'.form_error($option_input['name']).'</td></tr>';
					 		}
					 		echo '</tr>';
					 	}
					 	//print_r($number_of_final);
					 	for ($num=1; $num<=$number_of_final; $num++) // all final rounds
			 			{
				 			echo '<tr class="'.$val['category_id'].'">';
				 			echo '<td></td>';
				 			for($i=1; $i<=20; $i++){ // all baskets
				 				echo '<td align="center">'.form_label( $i, 'final_'.$i.'_'.$val['category_id'].'_'.$num).'</td>';
				 			}
				 			echo '</tr>';
				 			echo '<tr class="'.$val['category_id'].'">';
				 			echo '<td align="center"><b>Final '.$num.'</b></td>';
					 		for($i=1; $i<=20; $i++)
					 		{
					 			if (isset($unique_par['final_'.$i.'_'.$val['category_id'].'_'.$num])){
					 				$option_input = array (
					 					'name'=>'final_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'id'=>'final_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'size'=>'1',
					 					'class'=>$val['category_id'],
					 					'value'=>set_value('final_'.$i.'_'.$val['category_id'].'_'.$num, $unique_par['final_'.$i.'_'.$val['category_id'].'_'.$num] )
					 				);	
					 			} 
					 			else 
					 			{
					 				$option_input = array (
					 					'name'=>'final_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'id'=>'final_'.$i.'_'.$val['category_id'].'_'.$num,
					 					'size'=>'1',
					 					'class'=>$val['category_id'],
					 					'value'=>set_value('final_'.$i.'_'.$val['category_id'].'_'.$num )
					 				);
					 			}
					 			//echo '<tr class="'.$val['category_id'].'"><td>'.form_label('Basket '.$i, 'basket_'.$i.'_'.$val['category_id']).'</td>';
					 			echo '<td>'.form_input($option_input).'</td>';
					 			//echo '<td style="color: red;">'.form_error($option_input['name']).'</td></tr>';
					 		}
					 		echo '</tr>';
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