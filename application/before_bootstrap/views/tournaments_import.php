<?php 
/**
* @author Branislav Ballon
*/
 $this->load->view('admin/admin_header', array('title'=>'Import tournament | Discgolf', 'caption'=>'Import tournament')); 

 ?>
<div id="container">
	<fieldset>
		<legend>Import tournament:</legend>
		<?php 		
			if(isset($upload_error)){ 
        echo '<div class="general_error">';
        echo $upload_error['error'];
        echo '</div>';
      }
      echo '<div id="validation-box">';
		 	echo validation_errors();
      echo "</div>";
			$name_input = array(
              'name'        => 'name',
              'value'		=>  set_value('name'),
              'id'          => 'name',
              'type'		=> 'text',
              'maxlength'   => '50',
              'size'        => '20',
            );
			$date_input = array(
              'name'        => 'date',
              'value'		=>  set_value('date'),
              'id'          => 'date',
              'type'		=> 'date',
              'maxlength'   => '100',
              'size'        => '50',
            );
			$location_input = array(
              'name'        => 'location',
              'value'		=>  set_value('location'),
              'id'          => 'location',
              'type'		=> 'text',
              'maxlength'   => '50',
              'size'        => '20',
            );
            $location_input = array(
              'name'        => 'location',
              'value'		=>  set_value('location'),
              'id'          => 'location',
              'type'		=> 'text',
              'maxlength'   => '50',
              'size'        => '20',
            );
            $create_checkbox = array(
              'name'        => 'create',
              'value'		=>  '1' ,
              'id'          => 'location',
              'checked' 	=> $create_checked,
            );
            $about_textarea = array(
              'name'  =>'about',
              'id' => 'about',
              'value' => set_value('about'),
              'class' => 'tinymc'
            ); 
            //vytvori sa pole do selectu
			$select = array();
			foreach ($tournamets as  $tournamet){
				$select[$tournamet->tournament_id] = $tournamet->name;	
			}
			 ?>


			<?php
      echo anchor( base_url().'uploads/example_csv.csv', 'example.csv');

			echo form_open_multipart('tournaments/import');
      echo form_label('Userfile', 'userfile');
      echo form_upload('userfile');
      echo '<div class="clear">&nbsp;</div>';

      echo form_label('New tournamet', 'create');
      echo form_checkbox('create','1',$create_checked, 'id="import-new-tournament"');  
      echo ' or select from existing ';
      echo form_dropdown('existing_tournament_id', $select, set_value('existing_tournament_id'), 'id="import-existing-tournament"');
      echo '<div class="clear">&nbsp;</div>';
      ?>
      <div id="import-new-tournament-form">
      <?php
        echo '<div id="tournament-import-new">';
    			echo form_label('Name: ', 'name');
    			echo form_input($name_input);
          echo '<div class="clear">&nbsp;</div>'; 

    			echo form_label('Date: ', 'date');
    			echo form_input($date_input);
          echo '<div class="clear">&nbsp;</div>';

    			echo form_label('Location', 'location');
    			echo form_input($location_input);
          echo '<div class="clear">&nbsp;</div>';
        echo '</div>';

          echo form_label('About: ','about');
          echo form_textarea($about_textarea);
          echo '<div class="clear">&nbsp;</div>';
        ?>
      </div>
        <?php

  			echo form_submit('submit', 'import');
  			echo form_close();
		  ?>

	</fieldset>
  <?php
	 $this->load->view('admin/admin_footer'); 
   ?>