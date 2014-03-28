<?php  $this->load->view('admin/admin_header', array('title'=>'Add category', 'caption'=>'Add category')); ?>
<div id="content-inner">
	<div>
	<?php
		
		$category_opt = array(
			'id' => 'category',
			'name' => 'category',
			'value' => set_value('category')
		);

	?>

	<?php echo form_open('tournaments/admin_add_category/'); ?>
	<fieldset>
		<legend>Add new category</legend>
			<table class="center-table">		
				<tr>
					<td><?php echo form_label('Category name: ', $category_opt['id']); ?></td>
					<td><?php echo form_input($category_opt); ?></td>
					<td style="color: red;"><?php echo form_error($category_opt['name']); ?></td>
					<td><?php echo form_submit('update', 'Add new category'); ?></td>
				</tr>
			</table>
	</fieldset>	
	<?php echo form_close(); ?>
	</div>
</div> <!-- #content-inner -->
<?php  $this->load->view('admin/admin_footer'); ?>
