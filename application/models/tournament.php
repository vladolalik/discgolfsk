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


	

}