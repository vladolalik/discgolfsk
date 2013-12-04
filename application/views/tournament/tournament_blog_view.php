<?php  $this->load->view('header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); 
	
	foreach ($tournaments as $key=>$row)
	{
		$this->load->view('tournament/tournament_review', $row);
	}
	echo $this->pagination->create_links();
?>