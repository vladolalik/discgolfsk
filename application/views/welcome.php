<?php $this->load->view('header', array('title' => 'Home', 'caption' => 'Home')); ?>

Hi, <strong><?php echo $username; ?></strong>! You are logged in now. <?php echo anchor('/auth/logout/', 'Logout'); 
	echo $this->session->userdata('email');?>

