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
        $query = $this->db->get_where( 'players_has_tournaments', $data );
        return $query->num_rows;
    }

    /**
    * Function return all tournaments ordered by date DESC
    *
    * @author Vladimir Lalik
    * @return array
    *
    */
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
    * Function return all tournaments ordered by date DESC for pagination
    *
    * @param int
    * @param int
    * @author Vladimir Lalik
    * @return array
    *
    */
    function get_tournaments_paginate($from, $to) 
    {
        $query = $this->db->order_by('date DESC')
                          ->get('tournaments', $to, $from);
        if ($query->num_rows() > 0){
            return $query->result_array(); 
        }
        return null;
    }

    /**
    * Function return number of tournaments
    *
    * @author Vladimir Lalik
    * @return int
    */
    function get_nmbr_tournaments()
    {
        $query= $this->db->get('tournaments');
        return $query->num_rows();
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

        $query = $this->db->query( "SELECT statistics_users.id as user_id, statistics_user_profiles.first_name, statistics_users.username, statistics_user_profiles.last_name, statistics_user_profiles.club, statistics_user_profiles.gender, statistics_user_profiles.birth_date, statistics_users.email 
                                    FROM statistics_users, statistics_user_profiles 
                                    WHERE (statistics_users.activated = '1' OR statistics_users.activated = '2' OR LOWER(statistics_users.username) = 'auto' ) AND statistics_users.id = statistics_user_profiles.user_id
                                    ORDER BY LOWER(statistics_user_profiles.last_name)
                                 ");
        if ($query->num_rows > 0) return $query->result_array();
    
    }

    function get_all_results($tournament_id, $player_id, $category_id)
    {

        $player = ($player_id != 'ALL')? 'AND p.user_id ='.$player_id : '';
        $query = $this->db->query(" SELECT u.user_id, c.category, r.*, p.final, p.disqualified, t.*, u.first_name, u.last_name, n.*
                                    FROM statistics_tournaments t, statistics_categories c, statistics_results r, statistics_user_profiles u, statistics_players_has_tournaments p, 
                                    statistics_number_of_baskets n
                                    WHERE p.tournament_id = $tournament_id AND u.user_id = p.user_id AND t.tournament_id = p.tournament_id AND
                                         p.category_id = c.category_id AND r.tournament_id = p.tournament_id AND p.user_id = r.user_id 
                                          $player AND c.category_id = '$category_id' AND r.result_id = n.result_id
                                    ORDER BY 
                                            CASE WHEN (r.final_3 IS NULL) THEN 9999 END,
                                            CASE WHEN (r.final_2 IS NULL) THEN 99999 END,
                                            CASE WHEN (r.final_1 IS NULL) THEN 999999 END,
                                            (case when p.disqualified is null then 1 else 0 end) DESC, r.points

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
                                    FROM statistics_tournaments t, statistics_categories c, statistics_results r, statistics_user_profiles u, statistics_players_has_tournaments p, 
                                    statistics_number_of_baskets n
                                    WHERE u.user_id=p.user_id AND c.category_id = p.category_id AND t.tournament_id = p.tournament_id AND
                                          p.category_id=c.category_id AND r.tournament_id=p.tournament_id AND p.user_id=r.user_id AND
                                          p.user_id='$player_id' AND r.result_id=n.result_id
                                    ORDER BY  
                                            CASE WHEN  (r.final_3 IS NULL) THEN 9999 END,
                                            CASE WHEN  (r.final_2 IS NULL) THEN 99999 END,
                                            CASE WHEN  (r.final_1 IS NULL) THEN 999999 END,
                                            (case when p.disqualified is null then 1 else 0 end)
                                             DESC, r.points

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
        if ($old_data['thumb'] != '' && $old_data['photo'] != '') 
        {
            unlink($_SERVER['DOCUMENT_ROOT'].'/statistics/uploads/tournaments/'.$old_data['thumb']);
            unlink($_SERVER['DOCUMENT_ROOT'] .'/statistics/uploads/tournaments/'.$old_data['photo']);
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
    $query = $this->db->where('tournament_id', $tournament_id)
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

/**
* Function register player for tournament
*
* @author Vladimir Lalik
* @param array
* @return bool
*/
function register_player($registration_data)
{
    $select = $this->db->where('user_id', $registration_data['user_id'])
                       ->where('tournament_id', $registration_data['tournament_id'])
                       ->get('registered_players');
    if ($select->num_rows()==0)
    {
        $query = $this->db->insert('registered_players', $registration_data);
        if($this->db->affected_rows() == 1)
        {
            return TRUE;
        } 
        else
        {
            return FALSE;
        }
    }
    return FALSE;
}


/**
* Function returns registerd players for tournament with id in param
*
* @author Vladimir Lalik
* @param array
* @return array
*/
function get_registerd_players($data)
{
    $select=$this->db->select('*')
                     ->where($data)
                     ->from('registered_players')
                     ->join('user_profiles', 'registered_players.user_id=user_profiles.user_id')
                     ->join('categories','registered_players.category_id=categories.category_id')
                     ->get();
    if ($select->num_rows()>0)
    {
        return $select->result_array();
    }
    return NULL;
}

/**
* Function return tournaments which match date from parameters
*
* @author Vladimir Lalik
* @param date
* @return array
*
*/
function get_by_date($date)
{
    $query=$this->db->where('date', $date)
                    ->get('tournaments');
    return $query->result_array();
}

}