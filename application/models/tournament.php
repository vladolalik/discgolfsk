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
    
    function save_result( $data ){
        $this->db->insert( 'results', $data );
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return  $insert_id;
    }
    function save_baskets_for_result( $data ){
        $this->db->insert( 'number_of_baskets', $data );
    }

    function save_player_has_tournament( $data ){
        $this->db->insert( 'players_has_tournaments', $data );
    }
    function player_has_tournament( $data ){
        return $this->db->get_where( 'players_has_tournaments', $data );
    }


    function get_tournaments() 
    {
        $query = $this->db->order_by('date DESC')
                          ->get('tournaments');
        if ($query->num_rows() > 0){
            return $query->result_array(); 
        }
        return null;
    }

    /**
    * Function return all categories
    *
    *
    * @return array
    */
    function get_categories()
    {
        $query = $this->db->order_by('category')
                          ->get('categories');
        if ($query->num_rows() > 0){
            return $query->result_array();
        }
        return NULL;
    }

    function get_all_players()
    {

        $query = $this->db->query( "SELECT users.id as user_id, user_profiles.first_name, users.username, user_profiles.last_name, user_profiles.club, user_profiles.gender, user_profiles.birth_date, users.email 
                                    FROM users, user_profiles 
                                    WHERE (users.activated = '1' OR users.activated = '2' OR LOWER(users.username) = 'auto' ) AND users.id = user_profiles.user_id
                                    ORDER BY LOWER(user_profiles.last_name)
                                 ");
        if ($query->num_rows > 0) return $query->result_array();
    
    }

    function get_all_results($tournament_id, $player_id, $category_id)
    {

        $player = ($player_id != 'ALL')? 'AND p.user_id ='.$player_id : '';
        $query = $this->db->query(" SELECT u.user_id, c.category, r.*, p.final, p.disqualified, t.*, u.first_name, u.last_name, n.*
                                    FROM tournaments t, categories c, results r, user_profiles u, players_has_tournaments p, 
                                    number_of_baskets n
                                    WHERE p.tournament_id = $tournament_id AND u.user_id = p.user_id AND t.tournament_id = p.tournament_id AND
                                         p.category_id = c.category_id AND r.tournament_id = p.tournament_id AND p.user_id = r.user_id 
                                          $player AND c.category_id = '$category_id' AND r.result_id = n.result_id
                                    ORDER BY 
                                            CASE WHEN ISNULL (r.final_3) THEN 9999 END,
                                            CASE WHEN ISNULL (r.final_2) THEN 99999 END,
                                            CASE WHEN ISNULL (r.final_1) THEN 999999 END,
                                            ISNULL(p.disqualified) DESC, r.points

                                ");
        if ($query->num_rows()>0)
        {
            return $query->result_array();
        }
        return NULL;
    }


    /**
    * Function return all player stats
    * Created by Vlado
    *
    * @param int
    * @return array
    */
    function get_player_stats($player_id)
    {

        $query = $this->db->query(" SELECT u.*, c.category, c.category_id, r.*, p.final, p.disqualified, t.*, n.*
                                    FROM tournaments t, categories c, results r, user_profiles u, players_has_tournaments p, 
                                    number_of_baskets n
                                    WHERE u.user_id=p.user_id AND c.category_id = p.category_id AND t.tournament_id = p.tournament_id AND
                                          p.category_id=c.category_id AND r.tournament_id=p.tournament_id AND p.user_id=r.user_id AND
                                          p.user_id='$player_id' AND r.result_id=n.result_id
                                    ORDER BY  
                                            CASE WHEN ISNULL (r.final_3) THEN 9999 END,
                                            CASE WHEN ISNULL (r.final_2) THEN 99999 END,
                                            CASE WHEN ISNULL (r.final_1) THEN 999999 END,
                                            ISNULL(p.disqualified) DESC, r.points

                                ");
        if ($query->num_rows()>0)
        {
            return $query->result_array();
        }
        return NULL;

    }

    function get_user_data($player_id)
    {
        $query = $this->db->where('user_id', $player_id)
                          ->get('user_profiles');
        if ($query->num_rows()>0)
        {
            return $query->row_array();
        } 
        return NULL;
    }

    /**
    * Function return tournament attributes
    *
    * @param int
    * @return array
    */
    function get_tournament_by_id($id)
    {
        $query = $this->db->where('tournament_id', $id)
                          ->get('tournaments');
        if ($query->num_rows()==1)
        {
            return $query->row_array();
        }
        return NULL;
    }

/**
* Upload tournament photo
 *
 * @author Vladimir Lalik
 *
 * @param int
* @param string
* @param string
* @return boolean
 */

function update_photo($tournament_id, $filename, $thumb){
    $query = $this->db->select('photo, thumb')
                     ->where('tournament_id', $tournament_id)
                   ->get('tournaments');
    if ($query->num_rows == 1) 
    {
        $old_data = $query->row_array(); 
        if ($old_data['thumb'] != 'default-thumb.png' && $old_data['photo'] != 'default.png') 
        {
            unlink('uploads/images/'.$old_data['thumb']);
            unlink('uploads/images/'.$old_data['photo']);
        }
        $this->db->where('tournament_id', $tournament_id);
        $arr = array(
             'photo'=> $filename,
             'thumb' => $thumb
         );
        $this->db->update('tournaments', $arr);
        return TRUE;
    }
    return FALSE;
}

/**
* Function for update tournament attributes
*
* @param int
* @param array
* @return bool
*/

function update_tournament($tournament_id, $data)
{
    $this->db->where('tournament_id', $tournament_id)
             ->update('tournaments', $data);
    if ($this->db->affected_rows()==1){
        return TRUE;
    }
    return FALSE;
}

/**
* Function that delete tournament and all record, which are joined to this tournament
*
* @author Vladimir Lalik
* @param int
* @return bool
*/
function delete_tournament($tournament_id)
{
    if (!$this->help_functions->is_admin())
    {
        redirect();
    }
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('players_has_tournaments');
    $query = $this->db->where('tournaments_tournament_id', $tournament_id)
                      ->delete('registered_players');
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('results');
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('tournaments');
    if ($this->db->affected_rows()>0)
    {
        return TRUE;
    }                
    return FALSE;
}


}