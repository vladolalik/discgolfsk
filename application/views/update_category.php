<?php  $this->load->view('admin/admin_header', array('title'=>'Update category', 'caption'=>'Update category')); ?>
<?php
	
	$category_opt = array(
		'id' => 'category',
		'name' => 'category',
		'value' => set_value('category', $category)
	);

?>
<?php echo form_open('tournaments/admin_update_cat/'.$category_id); ?>
	<table>
		
		<tr>
			<td><?php echo form_label('Category name', $category_opt['id']); ?></td>
			<td><?php echo form_input($category_opt); ?></td>
			<td style="color: red;"><?php echo form_error($category_opt['name']); ?></td>
		</tr>
	</table>
<?php echo form_submit('update', 'Update'); ?>
<?php echo form_close(); 
$this->load->view('admin/admin_footer');

?>
