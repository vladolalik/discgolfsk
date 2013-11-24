<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>import</title>
	<link rel="stylesheet" href="<?= base_url() ?>assets/style.css">
</head>
<body>
<div id="container">
	<fieldset>
		<legend>Import tournament:</legend>
		<?php 		
			 if(isset($error)){ echo $error;}

			echo form_open_multipart('tournaments/do_upload');
			echo form_input('tournament_name','názov turnaja');
			echo form_upload('userfile');
			echo form_submit('submit', 'userfile');
			echo form_close();
		?>

	</fieldset>
	
</div>
</body>
</html>