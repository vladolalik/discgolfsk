<?php  

	$this->load->view('header', array('title' => 'Registered players', 'caption' => 'Registered players'));

?>



<?php
	echo form_open('/tournaments/registered_players', array('class' => 'ajax-form-reg-players form-horizontal'));
	$attributes = array('class' => 'col-sm-2 control-label'); ?>
	<fieldset>
	<legend>Select tournament</legend>
	<div class="form-group">
	<?php echo form_label('Tournaments', 'reg-players', $attributes); ?>
	<div class="col-sm-10">
	<select name="tournaments" id="reg-players" class="form-control">
	<?php
		$tournament_id = $this->uri->segment(3);
		foreach ($data['tournaments'] as $key => $value) {
			if ($tournament_id!=NULL && $tournament_id==$value['tournament_id']){
				echo '<option class="tournament-option" value="'.$value['tournament_id'].'" selected="selected">'.$value['name'].' ('.date('F d, Y', strtotime($value['date'])).')</option>';
			} else {
				echo '<option class="tournament-option" value="'.$value['tournament_id'].'" '.set_select('tournament_id', $value['tournament_id']).'>'.$value['name'].' ('.date('F d, Y', strtotime($value['date'])).')</option>';	
			}
		 	
		 } 
		 echo '</select></div>'; ?>
	</div>
	<?php echo '<div class="form-button">'.form_submit('view', 'View').'</div>'; ?>
	</fieldset>
    <?php echo form_close(); ?>

<div id="registerd-players-result">
	<?php $this->load->view('tournament/registered_players_ajax_view', $data); ?>
</div>
<!-- AJAX script -->
<script>
	$(document).ready(function () {

		$('#reg-players').change(function() {
			console.log("send");
  			$('form.ajax-form-reg-players').submit();
		});

		$('.form-button').hide();

	 	$('form.ajax-form-reg-players').on('submit', function() {
			  var obj = $(this), // (*) references the current object/form each time
			  url = obj.attr('action'),
			  method = obj.attr('method'),
			  data = {};

			  obj.find('[name]').each(function(index, value) {
			   	   console.log(value);
				   var obj = $(this),
				   name = obj.attr('name'),
				   value = obj.val();
				   console.log(obj.val());
				   data[name] = value;

			  });

			  data = { tournament_id: $( "#reg-players option:selected" ).val()}
			  console.log(data);
			  $.ajax({
				   // see the (*)
				   url: url,
				   type: method,
				   data: { tournament_id: $( "#reg-players option:selected" ).val()} ,
				   success: function(response) {
				    	console.log(response);
				    	console.log(data);
				        $("#registerd-players-result").html(response);
				   }
		  	  });
		  	  return false; //disable refresh
	 	});
	
    }); 
</script>
<?php 
	$this->load->view('footer');
?>