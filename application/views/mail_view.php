<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>mailing list</title>
</head>
<body>

<div id="container">
  
  <?php 
    if (isset($sent_to)) {
      
      echo '<p>mail sent to:<br />', $sent_to;
      if (isset($sent_cc)) {
        echo 'copies sent to:<br />', implode(", ", $sent_cc), '</p>';  
      }
    }
     
    echo validation_errors();    
    echo form_open('mailingController/send'); 
    echo form_label('from: ', 'from'), form_input('from'), '<br />';
    echo form_label('to: ', 'to'), form_input('to'), '<br />';
    echo '<br />';
    echo form_label('subject: ', 'subject'), form_input('subject'), '<br />';
    echo form_textarea('message'), '<br />';
    
    echo '<br />send to selected tournaments: <br />';
    foreach($tournaments as $obj) {
      echo form_label($obj->name , 'mail_tournaments[]'), form_checkbox('mail_tournaments[]', $obj->name, FALSE);
    }    
    echo '<br />send to selected categories: <br />';
    foreach($cathegories as $obj) {
      echo form_label($obj->category , 'mail_categories[]'), form_checkbox('mail_categories[]', $obj->category, FALSE);
    }       
    echo '<br />send to selected users: <br />';
    foreach($user as $obj) {
      echo form_label($obj->username.'&nbsp;('.$obj->email.')' , 'mail_users[]'), form_checkbox('mail_users[]', $obj->email, FALSE);
    }
    
    echo '<br />', form_submit('submit', 'posli');
    echo form_close();
  ?>
</div>

</body>
</html>