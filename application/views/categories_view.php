<?php  $this->load->view('admin/admin_header', array('title'=>'Categories', 'caption'=>'Categories')); ?>
<?php 
	
	echo '<table>
			<tr>
				<th>Category</th>
				<th>Change category</th>
				<th>Delete category</th>
			</tr>';

	foreach ($categories as $key => $value) {
		echo '<tr>
				<td>'.$value['category'].'</td>
				<td>'.anchor('tournaments/admin_update_cat/'.$value['category_id'], 'Change', 'title="Change category"').'</td>
				<td><form action="'.base_url().'index.php/tournaments/admin_delete_cat/'.$value['category_id'].'"> <input type="submit" value="Delete" onclick="return confirm(\'Are you sure you want to delete '.$value['category'].' category?\')" /></form></td>
			 </tr>';
	}
	echo '</table>';
 ?>