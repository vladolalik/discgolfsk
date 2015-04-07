
<ul>
	<li id="calendar-header"><i class="fa fa-calendar"></i>Upcoming Tournaments</li>
<?php 
	if (isset($tournaments)){
		foreach ($tournaments as $key => $value) {
			$date = strtotime($value['date']);
			$date_to = strtotime($value['date_to']);
			$second_diff = $date - $date_to;
			
			if ($second_diff == 0){
				$print_date = date('d.m.Y', strtotime($value['date']));
			} else {
				$print_date = date('d.m', strtotime($value['date'])).'-'.date('d.m.Y', strtotime($value['date_to']));
			}
			
			echo '<li class="items">
				<b>'.anchor('tournaments/tournament_details/'.$value['tournament_id'], 
				'<i class="fa fa-trophy"></i>'.$print_date.', '.substr($value['name'],4).', '.$value['location'].', '.$value['sanction'], 
				'title="Details"').'</b></li>';
		}
	} else {
		echo '<li class="items"><i class="fa fa-hand-o-right"></i>There are no upcoming tournaments.</li>';
	}
?>
</ul>