<!-- autor Vlado Lalik -->
<?php $this->load->view('header', array('title' => 'Results', 'caption' => 'Results')); ?>
 <?php echo form_open('tournaments/view_results', array('class' => 'ajax-form form-horizontal')); ?>
 <div class="form-group">
<select name="tournaments" id="result-tournaments" size="5" class="form-control">
  <?php foreach($tournaments as $key=>$row):
  	if ($key == 0)
  	{
  		echo '<option class="result-option" value="'.$row['tournament_id'].'"'. set_select('tournaments', $row['tournament_id'], TRUE).'>'.$row['name'].' ('.date('F d, Y', strtotime($row['date'])).'), '.$row['location'].'</option>';
  	} 
  	else 
  	{
  		echo '<option class="result-option" value="'.$row['tournament_id'].'"'. set_select('tournaments', $row['tournament_id']).'>'.$row['name'].' ('.date('F d, Y', strtotime($row['date'])).'), '.$row['location'].'</option>';	
  	}
 	
   endforeach; ?>
</select>
</div>

<!-- <input id="results-submit" type="submit" value="Show"> -->
<br class="clear"/>
<div class="content-simple-line">&nbsp;</div>
<?php echo form_close(); ?>

<!-- AJAX script -->
<script>
	$(document).ready(function () {

		$('#result-tournaments').change(function() {
  			$('form.ajax-form').submit();
		});

	 	$('form.ajax-form').on('submit', function() {
			  var obj = $(this), // (*) references the current object/form each time
			  url = obj.attr('action'),
			  method = obj.attr('method'),
			  data = {};
			  

			  obj.find('[name]').each(function(index, value) {
			   	   console.log(value);
				   var obj = $(this),
				   name = obj.attr('name'),
				   value = obj.val();

				   data[name] = value;
			  });

			  $.ajax({
				   // see the (*)
				   url: url,
				   type: method,
				   data: data,
				   success: function(response) {
				    	console.log(response);
				    	console.log(data);
				        $("#content-ajax-response").html(response);
				   }
		  	  });
		  	  return false; //disable refresh
	 	});
	
    }); 
</script>
<div id="content-ajax-response">
<?php 
	$first=TRUE;
	if (isset($results) && $results != NULL)
	{
		foreach ($results as $key => $result_cat) {
		
			//var_dump($results);
			//die();
			if ($result_cat != NULL)
			{ 
				if ($first)
				{
					echo '<h2>'.$result_cat['0']['name'].' ('.date('F d, Y', strtotime($result_cat['0']['date'])).')</h2>';
					$first=FALSE;
				}
				echo '<h3> <i class="fa fa-angle-right"></i> '.$result_cat['0']['category'].'</h3>'; ?>
				<table id="results-table" class="statistics table-row-diff">
				<tr>
					<?php 
						echo '<tr> 
								<th>Rank</th>
								<th>Player</th>';
					 	for ($i=1; $i<=$result_cat['0']['nmbr_of_round'];$i++)
					 	{
					 		echo '<th>'.$i.' <span>('.$result_cat['0']['no_bskts_'.$i].')</span></th>';
					 	}																//header of table
					 	echo '<th>Total</th>';
					 	for ($i=1; $i<=$result_cat['0']['nmbr_of_fnl_laps'];$i++)
					 	{
					 		echo '<th>Final'.$i.'<span>('.$result_cat['0']['no_final_'.$i].')</span></th>';
					 	}

					 	echo '<th>Total</th>
					 		</tr>';
					 	
					 	foreach ($result_cat as $key=>$row_array)
					 	{
					 		echo '<tr>';
					 		echo '<td class="text-center" >'.$row_array['rank'].'</td>';
					 		echo '<td>'.anchor('/tournaments/view_individual_results/'.$row_array['user_id'], $row_array['first_name'].' '.$row_array['last_name'], 'target="_blank"').'</td>';
					 		$total = 0;
					 		for ($i=1; $i<=$row_array['nmbr_of_round'];$i++)
					 		{
					 			if ($row_array['lap_'.$i] == NULL || $row_array['lap_'.$i] == '0')
					 			{
					 				echo '<td class="text-center" ><i class="fa fa-times-circle-o"></i></td>';
					 			} 
					 			else 
					 			{
					 				echo '<td class="text-center" >'.$row_array['lap_'.$i].'</td>';
					 				$total = $total + $row_array['lap_'.$i];
					 			}
					 		}
					 		echo '<td class="text-center" >'.$total.'</td>';

					 		for ($i=1; $i<=$row_array['nmbr_of_fnl_laps'];$i++)
					 		{	
					 			if ($row_array['final_'.$i] == NULL || $row_array['final_'.$i] == '0')
					 			{
					 				echo '<td class="text-center" ><i class="fa fa-times-circle-o"></i></td>';
					 			} 
					 			else 
					 			{	
					 				$total = $total + $row_array['final_'.$i];
					 				echo '<td class="text-center" >'.$row_array['final_'.$i].'</td>';
					 			}
					 			
					 		}
					 		$i = $i-1;
					 		if ($row_array['final_'.$i] != NULL)
					 		{
					 			echo '<td class="text-center" >'.$total.'</td>';
					 		}else{
					 			echo '<td class="text-center" ><i class="fa fa-times-circle-o"></i></td>';
					 		}

					 		echo '</tr>';
					 	}
					 	
					echo '</table>';
				}

		
			

		 }
	}
	//print_r($results); ?>
  
</div>
<?php $this->load->view('footer'); ?>