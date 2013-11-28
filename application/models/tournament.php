<?php

class Tournament extends CI_Model{
  	function __construct(){
        // Call the Model constructor
        parent::__construct();
    }
    /**
    *
    */
    function addBaset($data){
    	$this->db->insert('baskets',$data);
    }

    /**
    *
    */
    function addLap($data){
    	$this->db->insert('laps',$data);
    }

    function get_all_tournaments(){
        $this->db->from('tournaments');
        $this->db->order_by("name", "asc");
        $query = $this->db->get();
        return $query->result();
    }

    function add_tournament($data){
        return $this->db->insert('tournaments',$data);
    }

    function get_tournament_id($name, $date){
        $this->db->select('tournament_id')
                    ->from('tournaments')
                    ->where('name', $name)
                    ->where('date', $date);
        $query = $this->db->get();
        debug ($query->result() );
    }
    
    function get_tournaments() {
    $q = $this -> db -> order_by('name')
					           -> get('tournaments');
	
	return $q -> result();
}


	

}