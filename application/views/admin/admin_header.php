<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title><?php echo $title; ?></title>
 
<link rel="stylesheet" href="<?= base_url() ?>assets/css/admin-style.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<?php include_once("analytics_script.php"); ?>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript" src="<?= base_url() ?>tinymce/tinymce.min.js"></script>	
<script type="text/javascript" src="<?= base_url() ?>assets/js/scripts.js"></script>

<script src="<?= base_url() ?>assets/datetimepicker-master/jquery.datetimepicker.js"></script>
<link rel="stylesheet" type="text/css" href="<?= base_url() ?>assets/datetimepicker-master/jquery.datetimepicker.css"/ >	

  <!-- Date picker Vladimir Lalik -->
<script>
	$(function() {
	    $( "#date, #birth_date, #date_to").datepicker({
	      dateFormat: 'yy-mm-dd',
	      changeMonth: true,
	      changeYear: true
	    });
	    // getter
		var yearRange = $("#birth_date").datepicker( "option", "yearRange" );
 
		// setter
		$( "#birth_date" ).datepicker( "option", "yearRange", "c-50:+1" );

		$('#reg_date').datetimepicker({
    		dformat: "yy-mm-dd hh:mm:ss"
		});
	});
</script>
<script>
tinymce.init({
    selector: "textarea.tinymc",
    theme: "modern",
    plugins: [
         "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
         "save table contextmenu directionality emoticons template paste textcolor"
   ],
   content_css: "css/content.css",
   toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons", 
 }); 
</script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"> 
<body>
	<header id="header">
		<div class="container">
			<h1>Discgolf.sk</h1>
		</div>		
	</header>

	<div class="container">
		<nav>
			<ul id="main-nav">
				<li><?php echo anchor('tournaments/admin_view_tournaments', 'ADMINISTRATION', 'title="Tournaments", id="navigation-header"'); ?></li>
				<li><?php echo anchor('', '<i class="fa fa-home"></i>Home', 'home'); ?> </li>
				<li><?php echo anchor('/tournaments/compute_year_rank_open_women', '<i class="fa fa-signal"></i>Update rank list', 'title="Update rank list"'); ?> </li>
				<li><?php echo anchor('auth/admin_get_all_players', '<i class="fa fa-users"></i>Players', 'title="Players"'); ?> </a> 
					<ul> 
						<li><?php echo anchor('auth/admin_get_inactive_players', '<i class="fa fa-angle-right"></i>Activate new players', 'title="Activate new players"'); ?> </li>
						<li><?php echo anchor('auth/admin_get_autocreated_profile', '<i class="fa fa-angle-right"></i>Autocreated profiles', 'title="Auto created profiles"'); ?> </li>
						<li><?php echo anchor('auth/admin_join_profiles', '<i class="fa fa-angle-right"></i>Merge profiles', 'title="Merge profiles"'); ?> </li>
					</ul>
				</li>
				<li><?php echo anchor('tournaments/set_nmbr_acc_tourn', '<i class="fa fa-trophy"></i>Slovak champ options', 'title="Set number of acceptable tournament for Slovak champ"'); ?></li>
				<li><?php echo anchor('tournaments/admin_view_tournaments', '<i class="fa fa-sitemap"></i>Tournaments', 'title="Tournaments"'); ?> 
					<ul>
						<li><?php echo anchor('tournaments/admin_add_tournament', '<i class="fa fa-angle-right"></i>Add new tournament', 'title="Add new tournament"'); ?></li>
						<li><?php echo anchor('tournaments/import', '<i class="fa fa-angle-right"></i>Import tournament', 'title="Add new tournament"'); ?></li>
						<li><?php echo anchor('tournaments/admin_registered_players', '<i class="fa fa-angle-right"></i>Registered players', 'title="Registered players"'); ?></li>
						<li><?php echo anchor('tournaments/set_foreign_score', '<i class="fa fa-angle-right"></i>Foreign score', 'title="Score from foreign tournaments"'); ?></li>
					</ul>
				</li>
				<li><?php echo anchor('tournaments/admin_delete_results', '<i class="fa fa-trash-o"></i>Delete results', 'title="Delete player results"'); ?> 
				<li><?php echo anchor('tournaments/admin_get_categories', '<i class="fa fa-tags"></i>Categories', 'title="Categories"'); ?>
					<ul>
						<li><?php echo anchor('tournaments/admin_add_category', '<i class="fa fa-angle-right"></i>Add new category', 'title="Add new category"'); ?></li>
					</ul>
				</li>
				<li><?php echo anchor('mailingController', '<i class="fa fa-envelope"></i>Mailing List', 'title="Mailing list"'); ?></li>
				<li><?php echo anchor('auth/logout', '<i class="fa fa-key"></i>Logout', 'title="Logout"');?> </li>
			</ul>		
		</nav>

		<section id="content">
			<h1><?php echo $caption; ?></h1>
				<div id="flash-data">
					<?php echo $this->session->flashdata('message'); ?>
				</div>

			