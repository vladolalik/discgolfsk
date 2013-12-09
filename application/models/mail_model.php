<?php

class Mail_model extends CI_Model {
  
  function selectAll() {
    //$q = $this->db->query('SELECT * FROM user');
    $q = $this->db->get('users');
    return $q->result();
  }
  
  function firstNameByMail($mail) {
    $mail = '\''.$mail.'\'';
    $q = $this->db->query('SELECT first_name, last_name FROM user_profiles WHERE user_id = (SELECT id FROM users WHERE email = '.$mail.')');
    return $q->result();  
  }
  
  function selectTournaments() {
    $q = $this->db->query('SELECT name FROM tournaments');
    return $q->result();  
  }
  
  function selectCurrentTournaments() {
    $q = $this->db->query('SELECT name FROM tournaments where date>=CURDATE()');
    return $q->result();  
  }
  
  function selectCathegories() {
    $q = $this->db->query('SELECT category FROM categories'); 
    return $q->result();  
  }
  
  function selectMailByCategoryNames($names) {
    $q = $this->db->query('select email from users where id in 
        (select user_profiles_id from players_has_tournaments where category_id in 
        (select category_id from categories where category in ('.implode(",", $names).')))');  
    return $q->result();  
  }
  
  function selectMailByTournamentNames($names) {
    $q = $this->db->query('select email from user_profiles where id in 
        (select user_profiles_id from players_has_tournaments where tournament_id in 
        (select tournament_id from tournaments where name in ('.implode(",", $names).')))');
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


