<?php
class Category extends CI_Model{
	function __construct(){
        // Call the Model constructor
        parent::__construct();
    }

    function exist($name = null){
    	if( ! isset( $name ) ) return false;
    	$this->db->select('category_id')
                    ->from('categories')
                    ->where('category', $name);
        $query = $this->db->get();
        if($query->num_rows() > 0){
		    return $query->first_row()->category_id;
		}
		else{
		    return null;
		}
    }
}