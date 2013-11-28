<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>tournament_view</title>
	<link rel="stylesheet" href="<?= base_url() ?>assets/style.css">
</head>
<body>
<div id="container">
	
	
 <?php echo form_open('tournaments/t_list'); ?>
<select name="tournaments" multiple>
  <option value='0' selected = 'selected'> ALL TOURNAMENTS </option>
  <?php foreach($tournaments as $obj): ?>
  <option value=<?php echo "'".$obj->tournament_id."'";?> ><?php echo $obj->name, " (".$obj->date.") ", $obj->location; ?> </option>
  <?php endforeach; ?>
</select>

<select name="users" multiple>
  <option value='0' selected = 'selected'> ALL PlAYERS </option>
  <?php foreach($users as $obj): ?>
  <option value=<?php echo "'".$obj->id."'";?> ><?php echo $obj->username; ?> </option>
  <?php endforeach; ?>
</select>


<input type="submit">
</form>

<table class="Statistics">
	
		
		 <?php foreach($match as $obj):  echo "<tr> 
     <td>".$obj->username ."</td> 
     <td>".$obj->category ."</td>
     </tr>";  endforeach; ?>  
	
	

	
</table>

  
  
</div>
</body>
</html>