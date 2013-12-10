<?php

class Mail_model extends CI_Model {
  
  function selectAll() {
    //$q = $this->db->query('SELECT * FROM user');
    $q = $this->db->where('activated', '1')
                  ->get('statistics_users');
    return $q->result();
  }
  
  function firstNameByMail($mail) {
   // $mail = '\''.$mail.'\'';
    //$q = $this->db->query("SELECT first_name, last_name FROM statistics_user_profiles WHERE user_id = (SELECT id FROM statistics_users WHERE activated='1' AND email ='$mail')");
    $q = $this->db->query("SELECT p.first_name, p.last_name FROM statistics_user_profiles p, statistics_users u WHERE u.id=p.user_id AND u.activated='1' AND u.email='$mail'");
    return $q->result();  
  }
  
  function selectTournaments() {
    $q = $this->db->query('SELECT name FROM statistics_tournaments');
    return $q->result();  
  }
  
  function selectCurrentTournaments() {
    $q = $this->db->query('SELECT name FROM statistics_tournaments where date>=CURDATE()');
    return $q->result();  
  }
  
  function selectCathegories() {
    $q = $this->db->query('SELECT category FROM statistics_categories'); 
    return $q->result();  
  }
  
  function selectMailByCategoryNames($names) {
    $q = $this->db->query('select email from statistics_users where id in 
        (select user_profiles_id from statistics_players_has_tournaments where category_id in 
        (select category_id from statistics_categories where category in ('.implode(",", $names).')))');  
    return $q->result();  
  }
  
  function selectMailByTournamentNames($names) {
    $q = $this->db->query('select email from statistics_user_profiles where id in 
        (select user_profiles_id from statistics_players_has_tournaments where tournament_id in 
        (select tournament_id from statistics_tournaments where name in ('.implode(",", $names).')))');
    return $q->result();  
  }
  
  function send($params) {    
    $this->email->from($params['from']);
    $this->email->to($params['to']);
    if (array_key_exists('cc', $params)) {
      $this->email->cc($params['cc']);
    }    
    $this->email->subject($params['subject']);
    $this->email->message(auto_typography($params['message']));
    $this->email->send();
  }
}


