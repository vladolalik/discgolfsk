<?php

class Tournament extends CI_Model{
  	function __construct(){
        // Call the Model constructor
        parent::__construct();
    }
    /**
    *
    */
    function addBaset( $data ){
    	$this->db->insert( 'baskets', $data );
    }

    /**
    *
    */
    function addLap( $data ){
    	$this->db->insert( 'laps', $data );
    }

    function get_all_tournaments(){
        $this->db->from( 'tournaments' );
        $this->db->order_by( "name", "asc" );
        $query = $this->db->get();
        return $query->result();
    }

    function add_tournament( $data ){
        return $this->db->insert( 'tournaments', $data );
    }

    function get_tournament_id( $name, $date ){
        $this->db->select( 'tournament_id' )
                    ->from( 'tournaments' )
                    ->where( 'name', $name )
                    ->where( 'date', $date );
        $query = $this->db->get();
        $ret = $query->row();
        return $ret->tournament_id;
    }

    function save_tournament_properties( $tournament_id, $maximum_laps, $maximum_final_laps ){
        $this->db->where( 'tournament_id', $tournament_id );
        $this->db->set( 'nmbr_of_round', $maximum_laps );
        $this->db->set( 'nmbr_of_fnl_laps', $maximum_final_laps );
        $this->db->update( 'tournaments' ); 
    }

    function save_lap( $tournament_id, $order, $baskets_number, $is_final = FALSE ){
        $this->db->set( 'tournament_id', $tournament_id );
        $this->db->set( 'nmbr_of_bskts', $baskets_number );
        $this->db->set( 'is_final', $is_final );
        $this->db->set( 'order', $order );
        $this->db->insert( 'laps' );
    }
    
    function get_tournaments() {
    $q = $this -> db -> order_by('name')
					           -> get('tournaments');
	
	return $q -> result();
}


	function get_by_date($date)
    {
        $query= $this->db->get_where('tournaments', array('date'=>$date));
        return $query->result_array();
    }

    function insert_entry($data)
    {
        /*$this->title   = $tournament_data['name'];
        $this->content = $_POST['content'];
        $this->date    = time();*/

        $this->db->insert('tournaments', $data);
        return $this->db->affected_rows();
    }

}