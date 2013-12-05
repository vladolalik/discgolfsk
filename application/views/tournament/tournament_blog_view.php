<?php  $this->load->view('header', array('title'=>'Tournaments', 'caption'=>'Tournaments')); 
	
if ($tournaments != NULL) 
{
	foreach ($tournaments as $key=>$row)
	{
		$this->load->view('tournament/tournament_review', $row);
	}
	echo $this->pagination->create_links();
} else 
{
	echo '<p> There are no tournaments</p>';
}
?>