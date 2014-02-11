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
        $this->db->order_by( "date", "desc" );
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

    function save_lap( $tournament_id, $user_id, $number, $is_final = FALSE ){
        $this->db->set( 'tournament_id', $tournament_id );
        $this->db->set( 'user_id',  $user_id );
        $this->db->set( 'number',   $number );
        $this->db->set( 'final',    $is_final );
        $this->db->insert( 'lap' );
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return  $insert_id;
    }

    function save_basket( $shots, $lap_id, $number){
        $this->db->set('shots', $shots);
        $this->db->set('lap_id', $lap_id);
        $this->db->set('number', $number);
        $this->db->insert( 'basket' );
    }


    //  function save_lap( $tournament_id, $order, $baskets_number, $is_final = FALSE ){
    //     $this->db->set( 'tournament_id', $tournament_id );
    //     $this->db->set( 'nmbr_of_bskts', $baskets_number );
    //     $this->db->set( 'is_final', $is_final );
    //     $this->db->set( 'order', $order );
    //     $this->db->insert( 'laps' );
    // }
    
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

    function get_all_player_tournaments( $player_id ){
        $this->db->select()
                ->from( 'players_has_tournaments' )
                ->where( 'user_id', $player_id );
        $query = $this->db->get();
        return $query->result();
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

    /** 
    * Function return category data by id
    * 
    * @param int
    * @return array
    */
    function get_category_by_id($category_id)
    {
        $select=$this->db->where('category_id', $category_id)
                         ->get('categories');
        if ($select->num_rows()==1)
        {
            return $select->row_array();
        }
        return NULL;
    }

    /**
    * Function update category
    * 
    * @param int
    * @return bool
    */
    function udpate_category($category_id, $data)
    {
        $this->db->where('category_id', $category_id)
                 ->update('categories', $data);
        if ($this->db->affected_rows()==1)
        {
            return TRUE;
        }
        return FALSE;
    }

    /**
    * Function add new category
    *
    * @param string
    */
    function add_category($data)
    {
        $query=$this->db->insert('categories', $data);
        if ($this->db->affected_rows()==1)
        {
            return TRUE;
        }
        return FALSE;
    }
    
    /**
    * Function delete category by id
    * 
    * 
    * @param int
    * @return bool
    */
    function delete_cat($category_id)
    {
        $this->db->where('category_id', $category_id)
                 ->delete('categories');

        if($this->db->affected_rows()==1)
        {
            return TRUE;
        }
        return FALSE;
    }

    /**
    * Function return all activated or auto-created players
    *
    * @author Vladimir Lalik
    * @return array
    */

     function get_all_players()
    {

        $query = $this->db->query( "SELECT statistics_users.id as user_id, statistics_user_profiles.first_name, statistics_users.username, statistics_user_profiles.last_name, statistics_user_profiles.club, statistics_user_profiles.gender, statistics_user_profiles.birth_date, statistics_users.email 
                                    FROM statistics_users, statistics_user_profiles 
                                    WHERE (statistics_users.activated = '1' OR statistics_users.activated = '2' OR LOWER(statistics_users.username) = 'auto' ) AND statistics_users.id = statistics_user_profiles.user_id
                                    ORDER BY LOWER(statistics_user_profiles.last_name)
                                 ");
        if ($query->num_rows > 0) return $query->result_array();
    
    }


    function get_foreign_score()
    {
        $query = $this->db->query( "SELECT u.id as user_id, p.first_name, u.username, p.last_name, 
                                            f1.score as foreign_1, f2.score as foreign_2, f3.score as foreign_3, f4.score as foreign_4
                                    FROM statistics_users u, statistics_user_profiles p 
                                    LEFT JOIN statistics_foreign_tournaments f1 ON (f1.user_id=p.user_id AND f1.number='1')
                                    LEFT JOIN statistics_foreign_tournaments f2 ON (f2.user_id=p.user_id AND f2.number='2')
                                    LEFT JOIN statistics_foreign_tournaments f3 ON (f3.user_id=p.user_id AND f3.number='3')
                                    LEFT JOIN statistics_foreign_tournaments f4 ON (f4.user_id=p.user_id AND f4.number='4')
                                    WHERE (u.activated = '1' OR u.activated = '2' OR LOWER(u.username) = 'auto' ) AND u.id = p.user_id
                                    ORDER BY LOWER(p.last_name)
                                 ");
        if ($query->num_rows > 0) return $query->result_array();
    }

    /**
    * Function set score from foreign tournaments
    * @param int
    * @param int
    * @param double
    */
    function set_foreign_score($user_id, $number, $score)
    {
        $select=$this->db->where('user_id', $user_id)
                         ->where('number', $number)
                         ->get('foreign_tournaments');

        
        if ($select->num_rows=='1')
        {
            $data=array(
                'score'=>$score
            );
            $this->db->where('user_id', $user_id)
                     ->where('number', $number)
                     ->update('foreign_tournaments', $data);
        } 
        else 
        {
            $data=array(
                'score'=>$score,
                'user_id'=>$user_id,
                'number'=>$number
            );
           $this->db->insert('foreign_tournaments', $data);
        }
    }

    /**
    * Function delete all foreign results
    * @author Vladimir Lalik
    */
    function delete_foreign_result()
    {
        $this->db->empty_table('foreign_tournaments');
    }

    /**
    * Function delete foreign results of one player specify by id
    * @author Vladimir Lalik
    * @param int
    */
    function delete_individual_foreign_score($user_id)
    {
        $this->db->where('user_id', $user_id)
                 ->delete('foreign_tournaments');
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
    * Function return all results by two main categroies OPEN and WOMEN
    * @author Vladimir Lalik
    */

    function get_all_results_open_women($tournament_id, $player_id, $category)
    {

        if ($category==0){
            $cat = "open";
        } else {
            $cat = "women";
        }
        $player = ($player_id != 'ALL')? 'AND p.user_id ='.$player_id : '';
        $query = $this->db->query(" SELECT u.user_id, c.category, r.*, p.final, p.disqualified, t.*, u.first_name, u.last_name, n.*
                                    FROM statistics_tournaments t, statistics_categories c, statistics_results r, statistics_user_profiles u, statistics_players_has_tournaments p, 
                                    statistics_number_of_baskets n
                                    WHERE p.tournament_id = $tournament_id AND u.user_id = p.user_id AND t.tournament_id = p.tournament_id 
                                          AND r.tournament_id = p.tournament_id AND p.user_id = r.user_id AND c.category_id=p.category_id 
                                          $player AND LOWER(c.category) LIKE '%$cat%' AND r.result_id = n.result_id
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
            if (file_exists($_SERVER['DOCUMENT_ROOT'].'/statistics/uploads/tournaments/'.$old_data['thumb']))
            {
                unlink($_SERVER['DOCUMENT_ROOT'].'/statistics/uploads/tournaments/'.$old_data['thumb']);    
            }
            if (file_exists($_SERVER['DOCUMENT_ROOT'] .'/statistics/uploads/tournaments/'.$old_data['photo']))
            {
                unlink($_SERVER['DOCUMENT_ROOT'] .'/statistics/uploads/tournaments/'.$old_data['photo']);
            }
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
    //delete results
    $this->db->query("DELETE FROM statistics_basket 
                      WHERE lap_id IN (SELECT lap_id 
                                       FROM statistics_lap 
                                       WHERE tournament_id='$tournament_id'
                                      )");
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('lap');
    $this->db->query("DELETE FROM statistics_number_of_baskets 
                      WHERE result_id IN (SELECT result_id 
                                       FROM statistics_results 
                                       WHERE tournament_id='$tournament_id'
                                      )");

    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('results');
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('players_has_tournaments');

    // delete registered players
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('register_options');
    
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('registered_players');
    
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('tournaments');

    if ($this->db->affected_rows()>0)
    {
        return TRUE;
    }                
    return FALSE;
}

/**
* Function delete tournament results
* @author Vladimir Lalik
* @param int
* @return bool
*/
function delete_tournament_results($tournament_id)
{
    $this->db->query("DELETE FROM statistics_basket 
                      WHERE lap_id IN (SELECT lap_id 
                                       FROM statistics_lap 
                                       WHERE tournament_id='$tournament_id'
                                      )");
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('lap');
    $this->db->query("DELETE FROM statistics_number_of_baskets 
                      WHERE result_id IN (SELECT result_id 
                                       FROM statistics_results 
                                       WHERE tournament_id='$tournament_id'
                                      )");

    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('results');
    $query = $this->db->where('tournament_id', $tournament_id)
                      ->delete('players_has_tournaments');
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
    $position = $this->db->where('tournament_id', $registration_data['tournament_id'])
                       ->count_all_results('registered_players');
                       
    $position = $position+1;

    $registration_data['position']=$position; // position in list of players registered to tournament
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
* @param int
* @return array
*/
function get_registerd_players($tournament_id)
{
    $select=$this->db->query("SELECT u.first_name, u.last_name, c.category, o_food.what food, r.position, o_accom.what accom, r.user_id, r.note
                              FROM  statistics_registered_players r
                              LEFT JOIN statistics_register_options AS o_food ON o_food.option_id=r.food_id
                              LEFT JOIN statistics_register_options AS o_accom ON o_accom.option_id=r.accom_id
                              LEFT JOIN statistics_user_profiles AS u ON u.user_id=r.user_id
                              LEFT JOIN statistics_categories AS c ON c.category_id=r.category_id
                              WHERE r.tournament_id='$tournament_id'"
                            );

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

/**
* Function return data about every lap for player with id from parameter.
* @author Vladimir Lalik
* @param int
* @return array
*/
function get_lap_info($player_id)
{
    $select = $this->db->query("SELECT l.tournament_id, b.par, b.shots, l.number, l.final, t.nmbr_of_round, t.nmbr_of_fnl_laps, b.number count 
                                FROM statistics_lap l, statistics_basket b, statistics_tournaments t
                                WHERE l.user_id='$player_id' AND l.lap_id=b.lap_id AND t.tournament_id=l.tournament_id
                                ORDER BY tournament_id, l.final, l.number, b.number");
    if ($select->num_rows()>0){
        return $select->result_array();
    }
    return NULL;
}


/**
* Function return par for one tournament and category
*
* @author Vladimir Lalik
*
*/
function get_par_by_id_gender($tournament_id, $gender)
{
    $gender=strtolower($gender);
    $select = $this->db->query("SELECT b.number, b.par, l.final, p.category_id, t.name  
                                FROM statistics_basket b, statistics_lap l, statistics_players_has_tournaments p, statistics_tournaments t, statistics_user_profiles u
                                WHERE b.lap_id=l.lap_id AND l.tournament_id=p.tournament_id AND t.tournament_id=p.tournament_id
                                AND l.tournament_id='$tournament_id' AND u.user_id=p.user_id AND LOWER(u.gender)='$gender' AND l.user_id=p.user_id
                                order by l.final, b.number");
    return $select->result_array();
}

function get_par_by_id($tournament_id)
{
    $select = $this->db->query("SELECT DISTINCT p.category_id, b.number, l.number no_round, b.par, l.final, t.name  
                                FROM statistics_basket b, statistics_lap l, statistics_players_has_tournaments p, statistics_tournaments t
                                WHERE b.lap_id=l.lap_id AND l.tournament_id=p.tournament_id AND t.tournament_id=p.tournament_id
                                AND l.tournament_id='$tournament_id' AND l.user_id=p.user_id
                                order by p.category_id, l.number, l.final, b.number");
    return $select->result_array();
}


/**
* Function return number of normal round in tournament 
* @author Vladimir Lalik
* @param int
* @return int
*
*/
function get_nmbr_of_round($tournament_id)
{
    $select=$this->db->select('nmbr_of_round')
                     ->where('tournament_id', $tournament_id)
                     ->get('tournaments');
    $number = $select->row('nmbr_of_round');
    return $number;
}

/**
* Function return number of final round in tournament 
* @author Vladimir Lalik
* @param int
* @return int
*
*/
function get_nmbr_of_final_round($tournament_id)
{
    $select=$this->db->select('nmbr_of_fnl_laps')
                     ->where('tournament_id', $tournament_id)
                     ->get('tournaments');
    $number = $select->row('nmbr_of_fnl_laps');
    return $number;
}



function set_lap_par($tournament_id, $category_id, $par, $basket_number, $lap_number, $final)
{
    /*var_dump($tournament_id);
    var_dump($category_id);
    var_dump($par);
    var_dump($number);
    die();*/
    $query = $this->db->query("UPDATE statistics_basket b, statistics_players_has_tournaments p, statistics_lap l
                              SET b.par='$par'
                              WHERE b.lap_id = l.lap_id AND p.tournament_id='$tournament_id' AND l.tournament_id=p.tournament_id 
                                    AND b.number='$basket_number' AND l.number='$lap_number' AND l.final='$final' AND 
                                    l.user_id IN 
                                                (SELECT t.user_id 
                                                 FROM  statistics_players_has_tournaments t
                                                 WHERE  t.category_id='$category_id' AND t.tournament_id='$tournament_id'
                                                 ) "
                              );
    if ($this->db->affected_rows()>0){
        return TRUE;
    }
    return FALSE;
}

function set_lap_par_gender($tournament_id, $gender, $par, $number)
{
    /*var_dump($tournament_id);
    var_dump($category_id);
    var_dump($par);
    var_dump($number);
    die();*/
    $gender=strtolower($gender);
    $query = $this->db->query("UPDATE statistics_basket b, statistics_players_has_tournaments p, statistics_lap l, statistics_user_profiles u
                              SET b.par='$par'
                              WHERE b.lap_id = l.lap_id AND p.tournament_id='$tournament_id' AND l.user_id=p.user_id AND l.tournament_id=p.tournament_id AND u.user_id=p.user_id AND LOWER(u.gender)='$gender'
                                    AND b.number='$number' ");
    //print_r($query);
    if ($this->db->affected_rows()>0){
        return TRUE;
    }
    return FALSE;
}

/** 
* Function return all players from tournament who were not disqualified by category
*
* @author Vladimir Lalik
* @param int
* @return array
*/
function get_not_disq_players($tournament_id, $category_id)
{
    
    $select=$this->db->query("SELECT u.user_id 
                              FROM statistics_user_profiles u, statistics_players_has_tournaments p
                              WHERE p.tournament_id='$tournament_id' AND u.user_id=p.user_id AND p.category_id='$category_id' AND p.disqualified IS NULL");
    if ($select->num_rows()>0){
        return $select->result_array(); 
    }
    return NULL;
}

/** 
* Function return all players from tournament who were not disqualified by gender
*
* @author Vladimir Lalik
* @param int
* @return array
*/
function get_not_disq_players_open_women($tournament_id, $category)
{
    if ($category==0){
        $cat = "open";
    } else {
        $cat = "women";
    }
   /* $select=$this->db->query("SELECT u.user_id 
                              FROM statistics_user_profiles u, statistics_players_has_tournaments p, statistics_categories c
                              WHERE p.tournament_id='$tournament_id' AND u.user_id=p.user_id AND LOWER(c.category) LIKE '%$cat%'  
                              AND p.disqualified IS NULL AND p.category_id=c.category_id");
    if ($select->num_rows()>0){
        return $select->result_array(); 
    }
    return NULL;
*/

    $query = $this->db->query(" SELECT u.user_id, c.category, r.*, p.final, p.disqualified, t.*, u.first_name, u.last_name, n.*
                                FROM statistics_tournaments t, statistics_categories c, statistics_results r, statistics_user_profiles u, statistics_players_has_tournaments p, 
                                statistics_number_of_baskets n
                                WHERE p.tournament_id = $tournament_id AND u.user_id = p.user_id AND t.tournament_id = p.tournament_id AND
                                     p.category_id = c.category_id AND r.tournament_id = p.tournament_id AND p.user_id = r.user_id 
                                     AND r.result_id = n.result_id AND LOWER(c.category) LIKE '%$cat%' AND p.disqualified IS NULL
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
* Function update score of player in tournament
* @author Vladimir Lalik
* @param int
* @param int
* @param int
* @return void
*/
function update_score($tournament_id, $user_id, $score)
{
    $where = array(
        'tournament_id'=>$tournament_id,
        'user_id'=>$user_id
    );
    $this->db->where($where)
             ->update('players_has_tournaments', array('score'=>$score));
}


function get_score_actual_year($player_id, $category)
{
    // 0 is for category OPEN
    // 1 is for category WOMEN
    if ($category==0){
        $cat = "open";
    } else {
        $cat = "women";
    }
    $select=$this->db->query("SELECT SUM(score) sum
                              FROM statistics_players_has_tournaments p, statistics_tournaments t, statistics_categories c
                              WHERE p.user_id='$player_id' AND p.tournament_id=t.tournament_id AND DATEDIFF(CURDATE(),DATE(t.date)) <= 365 AND c.category_id=p.category_id AND LOWER(c.category) LIKE '%$cat%' " );
    return $select->row_array();
}

function get_foreign_results($user_id)
{
    $select=$this->db->where('user_id', $user_id)
                     ->get('foreign_tournaments');
    if ($select->num_rows()>0)
    {
        return $select->result_array();
    }
    else 
    {
        return null;
    }
}


function get_score_actual_slovak($player_id, $category)
{
   $select=$this->db->select('nmbr_accept_tourn')
                    ->get('slovak_champ');
   $nmbr_accept_tourn=$select->row_array('nmbr_accept_tourn'); 
   $nmbr_accept_tourn=$nmbr_accept_tourn['nmbr_accept_tourn'];
  
   $select=$this->db->query("SELECT p.score, t.slovak_champ, t.name, p.user_id FROM statistics_players_has_tournaments p, statistics_tournaments t, statistics_categories c
                              WHERE p.user_id='$player_id' AND p.tournament_id=t.tournament_id AND YEAR(t.date) = YEAR(CURDATE()) AND LOWER(c.category) LIKE '%$category%' AND p.category_id=c.category_id
                               ORDER BY p.score DESC
                              LIMIT 0, $nmbr_accept_tourn" );
    return $select->result_array();
}

function update_year_score($user_id, $score, $category)
{
    // 0 is for category OPEN
    // 1 is for category WOMEN
    if ($category==0){
        $cat = "open";
    } else {
        $cat = "women";
    }
    // update or insert into table ranking
    $select=$this->db->where('user_id', $user_id)
                     ->get('ranking');
    if ($select->num_rows()>0)
    {
        $this->db->where('user_id', $user_id)
                 ->update('ranking', array($cat.'_score'=>$score, 'last_update'=>date('Y-m-d H:i:s')));
    } 
    else 
    {
        $data = array (
            $cat.'_score'=>$score,
            'user_id'=>$user_id,
            'last_update'=>date('Y-m-d H:i:s')
        );

        $this->db->insert('ranking', $data);
    }
}


function update_slovak_DG_score($user_id, $category, $score)
{

    // update or insert into table ranking
    $select=$this->db->where('user_id', $user_id)
                     ->get('ranking');
    if ($select->num_rows()>0)
    {
        $this->db->where('user_id', $user_id)
                 ->update('ranking', array($category.'_slovak_DG'=>$score, 'last_update'=>date('Y-m-d H:i:s')));
    } 
    else 
    {
        $data = array (
            $category.'_slovak_DG'=>$score,
            'user_id'=>$user_id,
            'last_update'=>date('Y-m-d H:i:s')
        );

        $this->db->insert('ranking', $data);
    }
}

/**
* Function return year ranking with score from all tournaments in current year
* @author Vladimir Lalik
* @return array
*/
function get_year_ranking($category)
{
   // var_dump($gender);
    $category=strtolower($category);
    $select = $this->db->query("SELECT rank.".$category."_score, rank.last_update, u.user_id, u.first_name, u.last_name, @curRank := @curRank + 1 AS rank
                                FROM statistics_user_profiles u, statistics_users us, statistics_ranking rank, (SELECT @curRank := 0)  r
                                WHERE u.user_id=us.id AND rank.user_id=u.user_id AND
                                        (us.activated='1' OR us.activated='2' OR us.username='auto') 
                                        AND rank.".$category."_score != '0' AND rank.".$category."_score IS NOT NULL AND u.user_id IN (SELECT  DISTINCT pl.user_id
                                                                                   FROM statistics_players_has_tournaments pl, statistics_categories c, statistics_tournaments t
                                                                                   WHERE pl.category_id=c.category_id AND pl.tournament_id=t.tournament_id AND LOWER(c.category) LIKE '%$category%' AND 
                                                                                   DATEDIFF(CURDATE(),DATE(t.date)) <= 365
                                                                                   ORDER BY pl.user_id
                                                                                   ) 
                                ORDER BY rank.".$category."_score DESC");
    if ($select->num_rows()>0){
        return $select->result_array();
    }
    return NULL;

}


/**
* Function return Slovak DG league ranking with score from all tournaments in current year
* @author Vladimir Lalik
* @return array
*/
function get_slovak_DG_ranking($category)
{
   // var_dump($gender);
    $category=strtolower($category);
    $select = $this->db->query("SELECT rank.".$category."_slovak_DG, rank.last_update, u.user_id, u.first_name, u.last_name, @curRank := @curRank + 1 AS rank
                                FROM statistics_user_profiles u, statistics_users us, statistics_ranking rank, (SELECT @curRank := 0)  r
                                WHERE u.user_id=us.id AND rank.user_id=u.user_id AND
                                        (us.activated='1' OR us.activated='2' OR us.username='auto') 
                                        AND rank.".$category."_slovak_DG != '0' AND rank.".$category."_score IS NOT NULL AND u.user_id IN (SELECT  DISTINCT pl.user_id
                                                                                   FROM statistics_players_has_tournaments pl, statistics_categories c, statistics_tournaments t
                                                                                   WHERE pl.category_id=c.category_id AND pl.tournament_id=t.tournament_id AND LOWER(c.category) LIKE '%$category%' AND 
                                                                                   DATEDIFF(CURDATE(),DATE(t.date)) <= 365
                                                                                   ORDER BY pl.user_id
                                                                                   ) 
                                ORDER BY rank.".$category."_slovak_DG DESC");
    if ($select->num_rows()>0){
        return $select->result_array();
    }
    return NULL;

}

/**
* Function return score in all tournaments in current year
* @author Vladimir Lalik
* @param int
* @return array
*/
function get_score_tournaments($user_id, $category)
{
    //for rank by gender
    /*$where=$this->db->select('gender')
                    ->where('user_id', $user_id)
                    ->get('user_profiles');
    $gender=strtolower($where->row('gender'));
    */

    $select=$this->db->query("SELECT u.first_name, u.last_name, t.name, t.date, p.score,  u.slovak_champ_score, ranking.rank, c.category
                              FROM statistics_user_profiles u, statistics_tournaments t, statistics_players_has_tournaments p, statistics_categories c, 
                                  (SELECT rank.".$category."_score, u.user_id, u.first_name, u.last_name, @curRank := @curRank + 1 AS rank
                                    FROM statistics_user_profiles u, statistics_users us, statistics_ranking rank, (SELECT @curRank := 0)  r
                                    WHERE u.user_id=us.id AND rank.user_id=u.user_id AND
                                            (us.activated='1' OR us.activated='2' OR us.username='auto') 
                                            AND rank.".$category."_score != '0' AND rank.".$category."_score IS NOT NULL AND u.user_id IN (SELECT  DISTINCT pl.user_id
                                                                                       FROM statistics_players_has_tournaments pl, statistics_categories c, statistics_tournaments t
                                                                                       WHERE pl.category_id=c.category_id AND pl.tournament_id=t.tournament_id AND LOWER(c.category) LIKE '%$category%' AND 
                                                                                       DATEDIFF(CURDATE(),DATE(t.date)) <= 365
                                                                                       ORDER BY pl.user_id
                                                                                       ) 
                                    ORDER BY rank.".$category."_score DESC) ranking
                              WHERE c.category_id=p.category_id AND 
                                    u.user_id='$user_id' AND  ranking.user_id=u.user_id AND u.user_id=p.user_id AND t.tournament_id=p.tournament_id AND DATEDIFF(CURDATE(),DATE(t.date)) <= 365
                              ORDER BY p.score DESC, t.date DESC");
    if ($select->num_rows()>0)
    {
        return $select->result_array();
    }
    return NULL;
}

/**
* Function that return data for slovak ranking
* @author Vladimir Lalik
* @param string
* @return array
*
*/
function get_slovak_ranking($gender)
{
    
   
    $gender=strtolower($gender);
    $select = $this->db->query("SELECT u.slovak_champ_score year_score, u.user_id year_score, u.first_name, u.last_name, @curRank := @curRank + 1 AS rank
                                FROM statistics_user_profiles u, statistics_users us, (SELECT @curRank := 0)  r
                                WHERE LOWER(u.gender)='$gender' AND u.user_id=us.id AND (us.activated='1' OR us.activated='2' OR us.username='auto') 
                                ORDER BY u.slovak_champ_score DESC");
    if ($select->num_rows()>0){
        print_r($select->result_array());
        die();
        return $select->result_array();
    }
    return NULL;
                     
}
/**
* Function set number of acceptable tournaments for slovak champ ranklist
* @author Vladimir Lalik
* @param int
* @return bool
*/

function set_nmbr_acc_tourn($number)
{
    $this->db->empty_table('slovak_champ');
    $this->db->insert('slovak_champ', array('nmbr_accept_tourn'=>$number) );
             
    if ($this->db->affected_rows()==1)
    {
        return TRUE;
    }
    return FALSE;
}

function get_nmbr_accept_tourn()
{
    $select=$this->db->select('nmbr_accept_tourn')
                    ->get('slovak_champ');
    return $select->row_array();
}



/**
* Function delete all player results in selected tournament
* @author Branislav Ballon
* @param int
* @return bool
*/
function delete_player_results_in_tournament( $tournament_id, $player_id ){
    if (!$this->help_functions->is_admin())
    {
        redirect($tournament_id, $player_id);
    }

    $this->db->where('tournament_id', $tournament_id)
                        ->where('user_id', $player_id)
                        ->delete('players_has_tournaments');

    $query = $this->db->query("DELETE statistics_number_of_baskets FROM statistics_number_of_baskets LEFT JOIN statistics_results ON statistics_results.result_id = statistics_number_of_baskets.result_id WHERE statistics_results.tournament_id = '$tournament_id' 
        AND statistics_results.user_id = '$player_id'");

     $this->db->where('tournament_id', $tournament_id)
                        ->where('user_id', $player_id)
                        ->delete('results');
    $query = $this->db->query("DELETE statistics_basket FROM statistics_basket LEFT JOIN statistics_lap ON statistics_lap.lap_id = statistics_basket.lap_id WHERE statistics_lap.tournament_id = '$tournament_id' 
        AND statistics_lap.user_id = '$player_id'");
     $this->db->where('tournament_id', $tournament_id)
                        ->where('user_id', $player_id)
                        ->delete('lap');
    if ($this->db->affected_rows()>0)
    {
        return TRUE;
    }                
    return FALSE;
    }



/**
* Function return options for registration on tournament for one tournament selected by tournament_id
* @author Vladimir Lalik
* @param int 
* @return array
*/
function get_options_tournament($tournament_id)
{
    $select=$this->db->where('tournament_id', $tournament_id)
                     ->get('register_options');
    if ($select->num_rows()>0)
    {
        return $select->result_array();
    }
    else 
    {
        return NULL;
    }
}

/**
* Function update if exists this option or if not insert it
* @author Vladimir Lalik
* @param string
* @param int
* @param string
* @param int
* @return void
*/
function insert_option($what, $number, $type, $tournament_id)
{
    $this->db->where('number', $number)
             ->where('type', $type)
             ->where('tournament_id', $tournament_id);

    if ($this->db->count_all_results('register_options')==0){
        $data=array(
            'number'=>$number,
            'what'=>$what,
            'type'=>$type,
            'tournament_id'=>$tournament_id
        );
        $this->db->insert('register_options', $data);
    } else {
        $data=array(
            'what'=>$what
        );
        $this->db->where('number', $number)
                 ->where('type', $type)
                 ->where('tournament_id', $tournament_id)
                 ->update('register_options', $data);
    }
}

/**
* Function delete option
* @author Vladimir Lalik
* @param int
* @param string
* @param int
* @return void
*/
function delete_option($number, $type, $tournament_id)
{
    $where=array(
        'number'=>$number,
        'type'=>$type,
        'tournament_id'=>$tournament_id
    );
    $this->db->delete('register_options', $where);
}

/**
* Function delete registration of player
* @author Vladimir Lalik
* @param int
* @param int
*
*/
function delete_registration($user_id, $tournament_id)
{
    $select=$this->db->select('position')
                       ->where('user_id', $user_id)
                       ->where('tournament_id', $tournament_id)
                       ->get('registered_players');
    $position=$select->row('position');
    //print_r($position);
   // die();

    $this->db->delete('registered_players', array('user_id'=>$user_id, 'tournament_id'=>$tournament_id));
    
    // update positions after deleted record

    $select=$this->db->where('position >', $position)
                     ->get('registered_players');
    
    $data=$select->result_array();
    
    if ($data!=NULL){
        foreach ($data as $record){
            $pos=$record['position']-1;
            $this->db->where('register_player_id', $record['register_player_id']);
            $this->db->update('registered_players',array('position'=>$pos) );
        }
    }
}

}