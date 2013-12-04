<?php


/**
 * Tournaments
 *
 * controller -> tournamets
 * - user account data,
 * - user profiles
 * @author	Branislav Ballon
 */
class Tournaments extends CI_Controller {

	function __construct(){
		parent::__construct();
		header('Content-Type: text/html; charset=utf-8');
		$this->load->model('tournament');
		$this->load->helper('form');
		$this->load->library('form_validation');
		$this->load->model('tournament');
		$this->load->helper(array('form','url','typography','file'));

		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		$this->load->library('security');
		$this->load->library('tank_auth');
		$this->lang->load('tank_auth');
	}

	public function index()
	{		
	 	redirect('/tournaments/view_results');
	}


	function admin_view_tournaments()
	{
		$data['tournaments'] = $this->tournament->get_tournaments();
		$this->load->view('tournament/admin_tournaments_view', $data);
	}


	/**
	* Function that create new tournament
	*
	* @author Michal Borcin
	* edited by Vladimir Lalik
	* @return void
	*/
	function admin_add_tournament()
	{
		if (!$this->tank_auth->is_logged_in())
		{
			redirect();
		}

		$this->form_validation->set_rules('name','Name','trim|required|xss_clean|strip_tags');
		$this->form_validation->set_rules('about','About','trim|xss_clean');
		$this->form_validation->set_rules('date','Date','required|xss_clean|callback_datecheck');
		$this->form_validation->set_rules('location','Location','trim|required|xss_clean|strip_tags');
		$this->form_validation->set_rules('rounds','Rounds','trim|required|xss_clean|is_natural_no_zero|strip_tags');
		$this->form_validation->set_rules('rounds_final','Final rounds','trim|required|xss_clean|is_natural_no_zero|strip_tags');
		$this->form_validation->set_message('datecheck', 'Tournament with selected name and date already exits!');
		if($this->form_validation->run()){
			$tournament_data = array(
					'name'			=>	$this->form_validation->set_value('name'),
					'date'			=>	$this->form_validation->set_value('date'),
					'location'		=>	$this->form_validation->set_value('location'),
					'nmbr_of_round'		=>	$this->form_validation->set_value('rounds'),
					'nmbr_of_fnl_laps'	=>	$this->form_validation->set_value('rounds_final'),
					'about' => $this->form_validation->set_value('about')
				);
			
				
			if ($this->tournament->add_tournament($tournament_data)) {
			
				//$this->load->view('tournament/success', $tournament_data);
				$this->session->set_flashdata('message', '<p class="success">Tournament was successfully created</p>');
				redirect('tournaments/admin_view_tournaments');
			}
				// inserte?	
		}else{
			$this->load->view('tournament/create');	
		}		
	}

	/**
	* Funkcia na validaciu duplicity dat pri vytvarani noveho turnaja
	*
	*
	* @return true/false
	* @author Michal Borcin
	*/
	public function datecheck($form_date)
	{
		/*$db_feed=$this->tournament->get_by_date($form_date);
		foreach ($db_feed as $row){
			if($this->form_validation->set_value('name')==$row['name']){
				return false;
			}
		}*/
		//echo $date;
		return true;
	}

	public function success()
	{

		$this->load->view('tournament/success');
	}

	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function import(){
		if (!$this->tank_auth->is_logged_in())
		{
			redirect();
		}
		$data['tournamets'] = $this->tournament->get_all_tournaments();
		$this->load->library('form_validation');

		if( isset($_POST['create']) ){ // ak  je zaskrtnute ako novy tak validujeme

			$data['create_checked'] = TRUE; // zapametanie checkboxu
			$this->form_validation->set_rules('name', '', 'trim|required|xss_clean|htmlspecialchars');
			$this->form_validation->set_rules('date', '', 'trim|required|xss_clean|htmlspecialchars');
			$this->form_validation->set_rules('location', '', 'trim|required|xss_clean|htmlspecialchars');
		}else{
			$data['create_checked'] = FALSE; // zapametanie checkboxu
		}
		
		if ( ($this->form_validation->run() || !isset($_POST['create']) ) && isset($_POST['submit']) ){  //ak je zvalidovane alebo netreba validovat
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'csv';
			$config["file_name"] = IMPORTED_TMP_FILE_NAME; // ulozene v config/constants
			$config["overwrite"] = TRUE;

			$this->load->library('upload', $config);

			if (  $this->upload->do_upload("userfile") ){ // po uspesnom uploadnuti sa idu parsovat data
				$data = array('upload_data' => $this->upload->data());

				if( isset($_POST['create'] ) ){ // ak je zakliknute ze chceme novy, tak ho vytvorime
					$tournament_data = array(
						'name'		=> $_POST['name'],
						'date'		=> $_POST['date'],
						'location'	=> $_POST['location'],
					);
					if ($this->tournament->add_tournament($tournament_data) ){
						debug('ulozilo');
						$data['tournament_id'] = $this->tournament->get_tournament_id($_POST['name'], $_POST['date']);
					}else{
						//chyba najvacsia pri ukladani
					}
				}else{ //inak si zapamatame idcko vybraneho
					$data['tournament_id'] = $_POST['existing_tournament_id'];
				}
				session_start();
				$_SESSION['tournament_id'] = $data['tournament_id'];
				// vytvorit novy tournament alebo poslat idecko 
				//redirect('tournaments/parse_imported_data');
				$this->parse_imported_data( $data );
			}
			else{
				
				$data['upload_error'] = array('error' => $this->upload->display_errors());
				$this->load->view('tournaments_import',$data);
			}
		}else{
			$this->load->view('tournaments_import',$data);	
		}
	}
	


	function do_upload(){

		
	}

	function __tournament_exist(){

	}


	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function __validete_player($name = "", $surname = "", $nationality = "", $category = "", $line_number = 0, $player_number = 0 ){
		$v_errors = "";

		$_POST['name'] 			= $name;					//ulozime
		$_POST['surname']		= $surname;
		$_POST['nationality'] 	= $nationality;
		$_POST['category']		= $category;

		$this->load->library('form_validation');
		$this->form_validation->set_rules('name', '', 'trim|required|xss_clean|htmlspecialchars');
		$this->form_validation->set_rules('surname', '', 'trim|required|xss_clean|htmlspecialchars');
		$this->form_validation->set_rules('nationality', '', 'trim|required|xss_clean|htmlspecialchars');
		$this->form_validation->set_rules('category', '', 'trim|required|xss_clean|htmlspecialchars');

		if ($this->form_validation->run())
		{
			$v_errors = "";
		}else{
			$v_errors .= " <div class='error' > </n>";
			$v_errors .= "Error in player data: ";
			$v_errors .= "<br /></n>";
			$v_errors .= validation_errors();
			$v_errors .= "csv line: ".$line_number;
			$v_errors .= "<br /></n>";
			$v_errors .= "player number: ".$player_number;
			$v_errors .= "</div></n>";
			//echo $v_errors;
		}

	   	$this->form_validation = new CI_Form_validation();
	   	return $v_errors;
	}


	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function parse_imported_data( $data = NULL ){
		if (!$this->tank_auth->is_logged_in())
		{
			redirect();
		}
		header('Content-Type: text/html; charset=utf-8');
		$dataString =  file_get_contents('./uploads/'.IMPORTED_TMP_FILE_NAME.'.csv', true);
		$v_errors = ""; 				// string do ktoreho sa postupne nabaluju validacne errory
		$player_number = 0;						// cislo kolko mien mame zo suboru prejdenych
		$player_lap_data = array();
		$player_final_lap_data = array();
		$all_players_lap_data = array();
		$all_players_final_lap_data = array();
		$valid_players = array();
		$data['validation_errors'] = "";
		$line_number = 0;
		$loaded_player_data = FALSE; 			// informacia o tom ci su pre noveho hraca ulozene uz nejake data

		$lines = explode("\n",$dataString); 	// rozdelime subor na pole riadkov
		$lines = array_slice($lines, 0, ( sizeof($lines) -1 ) );  
		foreach ($lines as $row) {				// prechadzame po riadku
			debug($row);
			$loaded_player_data = FALSE;
			$line_number++;
			$values = explode(CSV_COLUMN_SEPARATOR,$row);		// zozdelime riadok na slova
			debug($values);
			//if( strlen( $values[0] ) > 0 ){		// kontrola ci to nie je prazdne policko
				if(  ( (string) $values[0] !== "n" ) && ( (string)$values[0] !== "f" ) ){ //ak je to riadok s menom, priezviskom...
					$player_number++;
					
					/*tu doplnat udaje ktore chceme ukladat*/
					$name					= $values[0];					
					$surname				= $values[1];
					$nationality 			= $values[2];   
					$category				= $values[3];

					// volanie validacie
					$player_errors = $this->__validete_player($name ,$surname ,$nationality ,$category, $line_number, $player_number );
					if( $player_errors == ""){ // ak nie su errory ulozim ho a zapamatam si jeho id
						$valid_players[$player_number]['name'] 			= $name;
						$valid_players[$player_number]['surname'] 		= $surname;
						$valid_players[$player_number]['nationality'] 	= $nationality;
						$valid_players[$player_number]['category'] 		= $category;
					}else{
						$v_errors .= $player_errors;
						$data['validation_errors']  .= $player_errors;
					}
				}else if( $values[0] === "n" ){					//ak je riadok normalne kolo
					$loaded_player_data = TRUE;
					$baskets = array();
					$correct_row = TRUE;							
					for($i = 1; $i < count($values); $i++){		// prechadzame vysledky a ukladame do pola
						$holeCount = 0;
						if( is_numeric( $values[$i] ) ){
							$baskets[$i] =  $values[$i];
							$holeCount++;
						}else{
							$correct_row = FALSE;
						}
					}
					array_push($player_lap_data, $baskets);
				} else if( $values[0] === "f"  ){				//ak je riadok finalove_normalne kolo
					$loaded_player_data = TRUE;
					$final_laps = array();
					$correct_row = TRUE;
					for($i = 1; $i < count($values); $i++){		// prechadzame vysledky a ukladame do pola
						$holeCount = 0;
						if( is_numeric( $values[$i] ) ){ 		//kontrola ci je dana hodnota cislo
							$final_laps[$i] =  $values[$i];
							$holeCount++;
						}else{
							$correct_row = FALSE;
						}	
					}
					array_push($player_final_lap_data, $final_laps); // v poli $final_laps je kolo aktualneho hraca
				}	

			if( ( !$loaded_player_data && $player_number != 1 ) || ( $line_number === sizeof($lines) ) ){ // ak nasleduje novy hrac || koniec suboru : trebba ulozit udaje aktualnemu hracovi
				if( $line_number === sizeof($lines) ){ // ak je posledny tak ulozim na jeho miesto jeho udaje
					if( count( $player_lap_data) > 0 ) $all_players_lap_data[$player_number] = $player_lap_data;
					if( count( $player_final_lap_data) > 0 ) $all_players_final_lap_data[$player_number] = $player_final_lap_data;
				}else{ //ak nie je posledny, teda mame dalsieho nacitaneho tak na jeho miesto ulozim udaje, preto -1
					if( count( $player_lap_data) > 0 ) $all_players_lap_data[$player_number-1] = $player_lap_data;
					if( count( $player_final_lap_data) > 0 ) $all_players_final_lap_data[$player_number-1] = $player_final_lap_data;
				}
				$player_lap_data = array();			// pre kazdeho hraca vynulujeme jeho vysledkove polia
				$player_final_lap_data = array();	// pre kazdeho hraca vynulujeme jeho vysledkove polia	
			}
		} //end main foreach
		debug('koniec');



		// echo "--------------------------------------------------------------";
		// echo $v_errors;
		// echo "--------------------------------------------------------------";
		// debug($valid_players);
		// echo "--skore------------------------------------------------------------";
		// debug($all_players_lap_data);
		// echo "--Finalove------------------------------------------------------------";
		// debug($all_players_final_lap_data);

		$this->__compare_data( $valid_players, $all_players_lap_data, $all_players_final_lap_data, $data );
	} //end parse_imported_data


	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function __compare_data($players = array(), $laps_data = array(), $final_laps_data = array(), $data = array() ){

		$players = $this->__check_players_existence($players);
		$players = $this->__check_categories_existence($players);
		debug($players);
		debug($laps_data);
		debug($final_laps_data);
		debug($data);
		$data['players'] = $players;
		$data['laps_data'] = $laps_data;
		$data['final_laps_data'] = $final_laps_data;
		//debug($creating_errors);
		$_SESSION['players']=$players;
		$_SESSION['laps_data']=$laps_data;
		$_SESSION['final_laps_data']=$final_laps_data;
		$this->load->view('tournaments_confirmation', $data);	

		

	}

	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function __check_players_existence($players){
		foreach ($players as $key => $player) {
			//debug($player);
			$player_id = $this->help_functions->exists_profile($player['name'],$player['surname']);
			if( $player_id ){
				$players[$key]['exist'] = $player_id;
				//$creating_errors .= "<div>Hrac:".$player['name']." ".$player['surname']." uz existuje ".$key.". v poradi v svn subore </div>";
			}else{
				$players[$key]['exist'] = -1;
				//$this->help_functions->__create_auto_profile( $player['name'], $player['surname']);
				// vytvorime noveho hravca
			}
		}
		return $players;
	}


	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function __check_categories_existence($players){
		$this->load->model('category');
		foreach ($players as $key => $player) {
			$cat = $this->category->exist($player['category']);
			if($cat != null){
				$players[$key]['category_exist'] = $cat;
			}else{
				$players[$key]['category_exist'] = -1;
			}
		}
		return $players;
	}


	
	function __save_tournamet_properties( $tournament_id, $number_of_laps, $number_of_final_laps  ){
		$this->tournament->save_tournament_properties( $tournament_id, $number_of_laps, $number_of_final_laps );
	}

	function __get_laps_count( $laps_data ){
		$maximum_laps = 0;
		foreach ($laps_data as $key => $player_laps) {
			if ( count( $player_laps ) > $maximum_laps ){ $maximum_laps = count( $player_laps ); };
		}
	}

	function __get_number_of_laps( $laps_data ){
		$maximum_laps = 0;
		foreach ($laps_data as $key => $player_laps) {
			if ( count( $player_laps ) > $maximum_laps ){ $maximum_laps = count( $player_laps ); };
		}
		return $maximum_laps;
	}


	function __save_player_data( $tournament_id, $user_id, $player_laps_data, $player_final_laps_data = NULL, $number_of_laps, $number_of_final_laps, $category_id ){
		$points = 0;
		$data = array();
		$in_final = FALSE;
		$baskets_data 	  = array();
		$lap_count = 0;
		foreach ($player_laps_data as $lap_key => $lap) {
			$points += array_sum( $lap );
			$data['lap_'.($lap_key+1)] = array_sum( $lap );
			$baskets_data['no_bskts_'.($lap_key+1)] = count( $lap );
			$lap_count++;
		}
		if( $player_final_laps_data != NULL){
			foreach ($player_final_laps_data as $lap_key => $lap) {
				$points += array_sum( $lap );
				$data['final_'.($lap_key+1)] = array_sum( $lap );
				$baskets_data['no_final_'.($lap_key+1)] = count( $lap );
			}
		}
		if( ( $number_of_laps + $number_of_final_laps )  == count( $data ) ){
			$player_has_tournament['final'] = 1;
		}
		if( ( $number_of_laps )  < $lap_count ){
			$player_has_tournament['diqualified'] = 1;
		}

		$data['tournament_id'] 	=  $tournament_id;
		$data['user_id'] 		=  $user_id;
		$data['points']			=  $points;

		$baskets_data['result_id'] = $this->tournament->save_result( $data );
		$this->tournament->save_baskets_for_result( $baskets_data );

		$player_has_tournament['user_id'] = $user_id;
		$player_has_tournament['tournament_id'] = $tournament_id;
		$player_has_tournament['category_id'] = $category_id;
		if( !$this->tournament->player_has_tournament( $player_has_tournament ) ){
			$this->tournament->save_player_has_tournament( $player_has_tournament );	
		}
	}

	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function save_import_data(){
		if (!$this->tank_auth->is_logged_in())
		{
			redirect();
		}
		session_start();
		if( isset($_SESSION['players']) && isset($_SESSION['laps_data']) ){
			$players = $_SESSION['players'];
			$laps_data = $_SESSION['laps_data'];
			$final_laps_data = $_SESSION['final_laps_data'];
			$tournament_id = $_SESSION['tournament_id'];

			$number_of_laps = $this->__get_number_of_laps( $laps_data );
			$number_of_final_laps = $this->__get_number_of_laps( $final_laps_data );
		
			$this->__save_tournamet_properties( $tournament_id, $number_of_laps, $number_of_final_laps );


			foreach ($players as $key => $player) {
				if( ( $player['exist'] != -1 ) && ($player['category_exist'] != -1) && isset($_POST[$player['exist']]) ){
					if( !isset($final_laps_data[$key]) ){
						$final_laps_data[$key] = null;						
					}
					$this->__save_player_data( $tournament_id, $player['exist'], $laps_data[$key],  $final_laps_data[$key], $number_of_laps, $number_of_final_laps, $player['category_exist'] );
				}
				if( ( $player['exist'] == -1 ) && ($player['category_exist'] != -1) ){
					if( !isset($final_laps_data[$key]) ){
						$final_laps_data[$key] = null;						
					}
					$new_player_id =  $this->help_functions->__create_auto_profile( $player['name'], $player['surname']);
					$this->__save_player_data($tournament_id, $new_player_id, $laps_data[$key],  $final_laps_data[$key], $number_of_laps, $number_of_final_laps, $player['category_exist'] );
					//$this->__save_player_data( $player['exist'],$laps_data[$key], $final_laps_data[$key] );
				}

			}
		}
	}


  
  function view() {
   
       $data['tournaments'] = $this ->tournament -> get_tournaments();
      // $data['users'] = $this ->users -> get_users();
       $this->load->view('tournaments_view',$data);
  }
  
  function t_list() {
       $data['tournaments'] = $this->tournament->get_tournaments();
       $data['users'] = $this ->users -> get_users();
       
       
       debug($_POST['tournaments']);
       //$_POST['tournament_id'])
       $data['match'] = $this->users->get_match($_POST['tournaments'], $_POST['users']);
        
       $this->load->view('tournaments_view',$data); 
  
  }
  
  /**
  * Function filter results by tournaments, players, categories
  * 
  * @author Vladimir Lalik
  * @return void
  */

  
  function view_results()
  {

  	 $this->form_validation->set_rules('tournaments', 'Tournaments', 'trim|required|xss_clean');
  	 $this->form_validation->set_rules('players', 'Players', 'trim|required|xss_clean');
  	 $this->form_validation->set_rules('categories', 'Categories', 'trim|required|xss_clean');

  	if ($this->form_validation->run())
  	{
  		
	   	 $data['tournaments'] = $this->tournament->get_tournaments();
		 $data['users'] = $this->tournament->get_all_players();
		 $data['categories'] = $this->tournament->get_categories();

		 $tournament_id = $this->input->post('tournaments');
		 $player_id = $this->input->post('players');
		 $category_id = $this->input->post('categories');
	  	 $data['results'] = $this->tournament->get_all_results($tournament_id, $player_id, $category_id);
	  	 // compute ranking
	  	 //print_r($data['results']);
	  	 if ($data['results'] != NULL)
	  	 {
		  	  if ($player_id != 'ALL')
		  	  {
		  	 	if ($data['results']['0']['disqualified'] == '1')
		  	 	{
		  	 		$data['results']['0']['rank'] = '';	
		  	 	}
		  	 	else
		  	 	{
		  	 		$data['results']['0']['rank'] = $this->compute_rank($player_id, $tournament_id, $category_id);
		  	 	}
		  	 }
		  	 else 
		  	 {
			  	 $rank = 0;
				 foreach ($data['results'] as $key => $row)
				 {
				 	if ($row['disqualified'] != NULL)
				 	{
				 		$data['results'][$key]['rank'] = NULL;
				 	} 
				 	elseif ($key!=0 && $data['results'][$key-1]['points'] == $data['results'][$key]['points'])
				 	{
				 		$data['results'][$key]['rank'] = $rank;	
				 	} 
				 	else 
				 	{
				 		$rank = $rank + 1;
				 		$data['results'][$key]['rank'] = $rank;	
				 	}
				 }
			}
		}
		//print_r($data['results']);
		// die();
	  	 $this->load->view('result_view', $data);

	}  		
  	else 
  	{

	  	 $data['tournaments'] = $this->tournament->get_tournaments();
	  	 $data['users'] = $this->tournament->get_all_players();
	  	 $data['categories'] = $this->tournament->get_categories();
	  	 $last_tournament_id = $data['tournaments']['0']['tournament_id'];
	  	 $category_id = $data['categories']['0']['category_id'];
	  	 $player_id = 'ALL';
	  	 $data['results'] = $this->tournament->get_all_results($last_tournament_id, $player_id, $category_id);
	  	 if ($data['results'] != NULL)
	  	 {
		  	  if ($player_id != 'ALL')
		  	  {
		  	 	if ($data['results']['0']['disqualified'] == '1')
		  	 	{
		  	 		$data['results']['0']['rank'] = '';	
		  	 	}
		  	 	else
		  	 	{
		  	 		$data['results']['0']['rank'] = $this->compute_rank($player_id, $last_tournament_id, $category_id);
		  	 	}
		  	 }
		  	 else 
		  	 {
			  	 $rank = 0;
				 foreach ($data['results'] as $key => $row)
				 {
				 	if ($row['disqualified'] != NULL)
				 	{
				 		$data['results'][$key]['rank'] = NULL;
				 	} 
				 	elseif ($key!=0 && $data['results'][$key-1]['points'] == $data['results'][$key]['points'])
				 	{
				 		$data['results'][$key]['rank'] = $rank;	
				 	} 
				 	else 
				 	{
				 		$rank = $rank + 1;
				 		$data['results'][$key]['rank'] = $rank;	
				 	}
				 }
			}
		}
	  	 $this->load->view('result_view', $data);

	}
  }

/**
* Function that compute player rank in tournament
* @author Vladimir Lalik
* @return int
*/
function compute_rank($player_id, $tournament_id, $category_id)
{
	$results = $this->tournament->get_all_results($tournament_id,'ALL',$category_id);
	 $rank = 0;
	 foreach ($results as $key => $row)
	 {
	 	if ($row['disqualified'] != NULL)
	 	{
			$results[$key]['rank'] = NULL;
		} 
		elseif ($key!=0 && $results[$key-1]['points'] == $results[$key]['points'])
		{
			 $results[$key]['rank'] = $rank;	
		} 
		else 
		{
			 $rank = $rank + 1;
			 $results[$key]['rank'] = $rank;	
		}
		if ($row['user_id'] == $player_id)
		{
			return $rank;
		}
	}
}

/**
* Function that view player profile and stats
* @author Vladimir Lalik
* @return void
*
*/
function view_individual_results()
{
	$player_id = $this->uri->segment(3);
	$data = $this->tournament->get_user_data($player_id);
	$data['results'] = $this->tournament->get_player_stats($player_id);
	foreach ($data['results'] as $key => $row)
	{
		if ($data['results'][$key]['disqualified'] == '1')
		  	 	{
		  	 		$data['results'][$key]['rank'] = '';	
		  	 	}
		  	 	else
		  	 	{
					$data['results'][$key]['rank'] = $this->compute_rank($player_id, $row['tournament_id'], $row['category_id']);
				}
	}
	$this->load->view('individual_stats', $data);
}
  
 /**
 * Function for upload photo to tournament
 *
 * @author Vladimir Lalik
 * @param int
 * @return void
 *
 */
 function admin_upload_photo()
 {
 	/* Upload Settings */
	$config['upload_path'] = './uploads/tournaments';
	$config['allowed_types'] = 'gif|jpg|png';
	$config['max_size']	= '1920';
	$config['max_width']  = '1920';
	$config['width'] = '512';
	$config['max_height']  = '1280';
	/* Encrypting helps prevent the file name from being discerned once its saved */
	$config['encrypt_name'] = 'TRUE';
 
	/* Load the CodeIgniter upload library, feed it the config from above */
	$this->load->library('upload', $config);
 
	/* Checks if the do_upload function has been successfully executed ...
	... and if not, shows the upload form and any errors (if they exist) */
	if (!$this->upload->do_upload()){
 
		/* Loads the model (predefined database instructions, see below) ...
		... and assigns it a nickname, I went with 'foo' */
		//$this->load->model('tank_auth/users','foo');
	 
		/* Makes the logged-in user's id a nice, clean variable */
		$tournament_id = $this->uri->segment(3);
	 
		/* Use the model to gather all user profile information for that user_id */
		$tournament_data =  $this->tournament->get_tournament_by_id($tournament_id);
	 	//print_r($tournament_data);
	 	//die();
		/* Pass that data into the data variable (for the views) */
		$data = $tournament_data;
	 
		/* Process errors if they exist */
		$error = array('error' => $this->upload->display_errors());
	 	$error['tournament_id'] = $tournament_id;
		/* Pass everything into the views */
		//$this->load->view('templates/header', $data);
		$this->load->view('tournament/upload_picture', $error);
		//$this->load->view('upload_form', $error);
		//$this->load->view('templates/footer', $data);
	 
		/* ... if the file passes validation ... */ 
	} else { 
	 
		/* Load the users model, assign it alias 'foo' (or whatever you want) */
		//$this->load->model('tank_auth/users','foo');
	 
		/* Assign logged-in user ID to a nice, clean variable */
		$tournament_id = $this->uri->segment(3);
	 
		/* Assign the upload's metadata (size, dimensions, destination, etc.) ...
		... to an array with another nice, clean variable */
		$upload = (array) $this->upload->data();
	 
		/* Assign's the user's profile data to yet another nice, clean variable */
		$tournament_data =  $this->tournament->get_tournament_by_id($tournament_id);
	 	//print_r($tournament_data);
	 	//die();
		/* Uses two upload library features to assemble the file name (the name, and extension) */
		$filename = $upload['raw_name'].$upload['file_ext'];
	 
		/* Same with the thumbnail we'll generate, but with the suffix '_thumb' */
		$thumb = $upload['raw_name']."_thumb".$upload['file_ext'];
	 
		/* Set the rules for the upload */
		$config['image_library'] = 'gd2';
		$config['source_image']	= "./uploads/tournaments/".$filename;
		$config['create_thumb'] = TRUE;
		$config['maintain_ratio'] = TRUE;
		$config['width']	 = 512;
		$config['height']	= 512;
	 
		/* Load "image manipulation library", see CodeIgniter user guide */
		$this->load->library('image_lib', $config);
	 
		/* Resize the image! */
		$this->image_lib->resize();
	 
		/* Assign upload_data to $data variable */
		$data['upload_data'] = $this->upload->data();
	 
		/* Assign profile_data to $data variable */
		$data['tournament_data'] = $tournament_data;
	 
		/* Runs the users model (update_photo function, see below) and ...
		... loads the location of the photo new photo into user's profile */
		if ($this->tournament->update_photo($tournament_id, $filename, $thumb))
		{
			/* Load "success" view with all the data! */
			//$this->load->view('auth/upload_success', $data);
			$this->session->set_flashdata('message', '<p class="success">Picture was successfully changed!</p>');		
			redirect('tournaments/admin_view_tournaments');
		} 
		else
	 	{
	 		//$data['fail'] = 'Upload has failed';
			/* Load "success" view with all the data, but something went wrong in database */
			//$this->load->view('auth/upload_success', $data);
			$this->session->set_flashdata('message', '<p class="fail">Something went wrong, please try again :) </p>');
			redirect('tournaments/admin_upload_photo');		
	 
		}
	}
 }
  
}
?>