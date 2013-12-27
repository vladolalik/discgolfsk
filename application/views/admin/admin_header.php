<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title><?php echo $title; ?></title>
 
<link rel="stylesheet" href="<?= base_url() ?>assets/css/admin-style.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>	
<script type="text/javascript" src="<?= base_url() ?>tinymce/tinymce.min.js"></script>	
<script type="text/javascript" src="<?= base_url() ?>assets/js/scripts.js"></script>	

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
	<section id="header">
		<div class="container">
			<h1>Discgolf.sk</h1>
		</div>		
	</section>

	<div class="container">
		<nav>
			<ul id="main-nav">
				<li><?php echo anchor('tournaments/admin_view_tournaments', 'ADMINISTRATION', 'title="Tournaments", id="navigation-header"'); ?></li>
				<li><?php echo anchor('', '<i class="fa fa-home"></i>Home', 'home'); ?> </li>
				<li><?php echo anchor('/tournaments/compute_year_rank_gender', '<i class="fa fa-home"></i>Update rank list', 'title="Update rank list"'); ?> </li>
				<li><?php echo anchor('auth/admin_get_all_players', '<i class="fa fa-users"></i>Players', 'title="Players"'); ?> </a> 
					<ul> 
						<li><?php echo anchor('auth/admin_get_inactive_players', '<i class="fa fa-angle-right"></i>Activate new players', 'title="Activate new players"'); ?> </li>
						<li><?php echo anchor('auth/admin_get_autocreated_profile', '<i class="fa fa-angle-right"></i>Autocreated profiles', 'title="Auto created profiles"'); ?> </li>
					</ul>
				</li>
				<li><?php echo anchor('tournaments/set_nmbr_acc_tourn', 'Slovak champ options', 'title="Set number of acceptable tournament for Slovak champ"'); ?></li>
				<li><?php echo anchor('tournaments/admin_view_tournaments', '<i class="fa fa-sitemap"></i>Tournaments', 'title="Tournaments"'); ?> 
					<ul>
						<li><?php echo anchor('tournaments/admin_add_tournament', '<i class="fa fa-angle-right"></i>Add new tournament', 'title="Add new tournament"'); ?></li>
						<li><?php echo anchor('tournaments/import', '<i class="fa fa-angle-right"></i>Import tournament', 'title="Add new tournament"'); ?></li>
						<li><?php echo anchor('tournaments/registered_players', '<i class="fa fa-angle-right"></i>Registered players', 'title="Registered players"'); ?></li>
						<li><?php echo anchor('tournaments/admin_set_par_lap', '<i class="fa fa-angle-right"></i>Set par for baskets', 'title="Set par for baskets"'); ?></li>
					</ul>
				</li>
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

			