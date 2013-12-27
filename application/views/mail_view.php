<?php $this->load->view('admin/admin_header', array('title'=>'Create tournament', 'caption'=>'Create tournament')); ?>
  <script type="text/javascript">
  $(document).ready(function() {
      $('[name="all_tournaments"]').click(function() {         
        if (this.checked) {           
          $('[name="mail_tournaments[]"]').each(function(){
             this.checked=true;
          });
        } else {
          $('[name="mail_tournaments[]"]').each(function(){
             this.checked=false;
          });
        }
      });
      
      $('[name="all_cathegories"]').click(function() {         
        if (this.checked) {           
          $('[name="mail_categories[]"]').each(function(){
             this.checked=true;
          });
        } else {
          $('[name="mail_categories[]"]').each(function(){
             this.checked=false;
          });
        }
      });
      
      $('[name="all_users"]').click(function() {         
        if (this.checked) {           
          $('[name="mail_users[]"]').each(function(){
             this.checked=true;
          });
        } else {
          $('[name="mail_users[]"]').each(function(){
             this.checked=false;
          });
        }
      });
      
    });
  </script>
</head>
<body>

<div id="mailing-list">
  
  <?php 
    if (isset($sent_to)) {                           
      echo '<p>mail sent to:<br />', $sent_to,'<br />';
      if (isset($sent_cc)) {
        echo 'copies sent to:<br />', implode(", ", $sent_cc), '</p>';  
      }
    }     
    echo validation_errors(); 
           
    echo form_open('mailingController/send'); 
    $tmp_data = array('name' => "input_from",  'id' => "input_from",);
    echo form_label('From: ', 'input_from'), form_input($tmp_data);
    
    $tmp_data = array('name' => "input_to",  'id' => "input_to",);
    echo form_label('To: ', 'input_to'), form_input($tmp_data), '<br />';
    echo '<br />';
    
    $tmp_data = array('name' => "input_subject",  'id' => "input_subject");
    echo form_label('Subject: ', 'input_subject'), form_input($tmp_data), '<br />';
    echo form_label('Message: ', 'message');
    echo form_textarea(array('name'=>'message', 'id'=>'message'));
    

    //tournaments
    echo '<table>';
    echo '<tr>';
    $tmp_data = array('name' => "all_tournaments", 'value' => 'all_tournaments', 'id' => 'all_tournaments');
    echo '<td>'.form_label("<br />Send to all tournaments:", 'all_tournaments').'</td>'; 
    echo '<td>'.form_checkbox($tmp_data).'</td>';
    //echo '<br />send to selected tournaments: <br />';
    echo '</tr>';
    $counter = 0;


    
    foreach($tournaments as $obj) {      
      $tmp_data = array('name' => "mail_tournaments[]",
                        'id' => "tournament_checkbox_".$counter,
                        'value' => $obj->name);
      echo '<tr class="mailing-single-tournament">';
      echo '<td>'.form_label('<i class="fa fa-chevron-circle-right"></i> '.$obj->name, 'tournament_checkbox_'.$counter).'</td><td>'.form_checkbox($tmp_data).'</td>';
      $counter = $counter + 1;
      echo '</tr>';
    } 
    echo '</table>';
    
    // categories
    echo '<table>
                    <tr>';
    $tmp_data = array('name' => "all_cathegories", 'value' => 'all_cathegories', 'id' => 'all_cathegories'); 
    echo '<td>'.form_label("<br />send to all categories:", 'all_cathegories').'</td>';
    echo '<td>'.form_checkbox($tmp_data).'</td></tr>';  
    //echo '<br />send to selected categories: <br />';
    $counter = 0;
    foreach($cathegories as $obj) {
      $tmp_data = array('name' => "mail_categories[]",
                        'id' => "cathegory_checkbox_".$counter,
                        'value' => $obj->category);
      echo '<tr><td>'.form_label($obj->category , 'cathegory_checkbox_'.$counter).'</td><td>'.form_checkbox($tmp_data).'</td></tr>';
      $counter = $counter + 1;
    }     
    echo '</table>';
    
    echo '<table>
                  <tr>';

    $tmp_data = array('name' => "all_users", 'value' => 'all_users', 'id' => 'all_users');
    echo '<td>'.form_label("<br />send to all users:", 'all_users').'</td>';
    echo '<td>'.form_checkbox($tmp_data).'</td></tr>';    
    //echo '<br />send to selected users: <br />';
    $counter = 0;
    foreach($user as $obj) {
      $tmp_data = array('name' => "mail_users[]",
                        'id' => "user_checkbox_".$counter,
                        'value' => $obj->email);
      $name = $this->mail_model->firstNameByMail($obj->email);
      echo '<tr><td>'.form_label($name['0']->first_name.'&nbsp;'.$name['0']->last_name.'('.$obj->email.')' , 'user_checkbox_'.$counter).'</td><td>'.form_checkbox($tmp_data).'</td></tr>';
      $counter = $counter + 1;
    }
    echo '</table>';
    
    $tmp_data = array('name' => "submit",  'id' => "submit", 'value' => "send email");
    echo '<br />', form_submit($tmp_data);
    echo form_close();
  ?>
</div> <!-- #mailing-list -->
<?php $this->load->view('admin/admin_footer'); ?>
