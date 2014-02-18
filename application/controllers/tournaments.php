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

		if (!($this->help_functions->is_admin()))
		{
			redirect();
		}
		$this->load->library('pagination');
		$config['base_url'] = base_url().'index.php/tournaments/admin_view_tournaments/'	;
		$config['total_rows'] = $this->tournament->get_nmbr_tournaments();
		$config['per_page'] = 20; 
		$config['full_tag_open'] = '<div id="pagination">';
		$config['full_tag_close'] = '</div>';
							
		$config['first_link'] = 'First';
		$config['last_link'] = 'Last';
							
		$config['next_tag_open'] = '<span class="next">';
		$config['next_tag_close'] = '</span>';
							
		$config['prev_tag_open'] = '<span class="prev">';
		$config['prev_tag_close']= '</span>';

		$this->pagination->initialize($config); 
		if ($this->uri->segment(3) == NULL)
		{
			$number = 0;
		} 
		else 
		{
			$number= $this->uri->segment(3);
		}

		$data['tournaments']=$this->tournament->get_tournaments_paginate($number, $config['per_page']);
		$this->load->view('tournament/admin_tournaments_view', $data);

		/*
		$data['tournaments'] = $this->tournament->get_tournaments();
		$this->load->view('tournament/admin_tournaments_view', $data);
		*/
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
		$this->form_validation->set_rules('about','About','trim');
		$this->form_validation->set_rules('allow_registration','Allow registration','trim|xss_clean|strip_tags');
		$this->form_validation->set_rules('date','Date','required|xss_clean|callback_datecheck');
		$this->form_validation->set_rules('date_to','Date to','required|xss_clean|callback_datecheck');
		$this->form_validation->set_rules('location','Location','trim|required|xss_clean|strip_tags');
		$this->form_validation->set_rules('rounds','Rounds','trim|required|xss_clean|is_natural_no_zero|strip_tags');
		$this->form_validation->set_rules('rounds_final','Final rounds','trim|required|xss_clean|is_natural_no_zero|strip_tags');
		$this->form_validation->set_rules('capacity','Capacity of tournament','trim|required|xss_clean|is_natural|strip_tags');
		$this->form_validation->set_rules('lat','Lattitude','trim|xss_clean|strip_tags');
		$this->form_validation->set_rules('lng','Longtitude','trim|xss_clean|strip_tags');
		$this->form_validation->set_rules('max_open','Parameter of tournament','trim|xss_clean|strip_tags|numeric');
		$this->form_validation->set_rules('max_women','Parameter of tournament','trim|xss_clean|strip_tags|numeric');
		$this->form_validation->set_rules('slovak_champ','Slovak championship','trim|xss_clean|strip_tags|numeric');
		$this->form_validation->set_message('datecheck', 'Tournament with selected name and date already exits!');
		$this->form_validation->set_rules('dir_name','Director\'s Name','trim|required|xss_clean|strip_tags');
		$this->form_validation->set_rules('dir_phone','Director\'s phone','trim|numeric|xss_clean|strip_tags');
		$this->form_validation->set_rules('dir_email','Director\'s email','trim|required|valid_email|xss_clean|strip_tags');
		if($this->form_validation->run()){
			$allow_registration=$this->form_validation->set_value('allow_registration');
			if ($allow_registration == NULL)
			{
				$allow_registration = 0;	
			}
			$slovak_champ=$this->form_validation->set_value('slovak_champ');
			if ($slovak_champ == NULL)
			{
				$slovak_champ = 0;	
			}
			
			$tournament_data = array(
					'name'			=>	$this->form_validation->set_value('name'),
					'date'			=>	$this->form_validation->set_value('date'),
					'date_to'			=>	$this->form_validation->set_value('date_to'),
					'location'		=>	$this->form_validation->set_value('location'),
					'nmbr_of_round'		=>	$this->form_validation->set_value('rounds'),
					'nmbr_of_fnl_laps'	=>	$this->form_validation->set_value('rounds_final'),
					'about' => $this->form_validation->set_value('about'),
					'allow_registration' => $allow_registration,
					'slovak_champ' => $slovak_champ,
					'lat'=>$this->form_validation->set_value('lat'),
					'lng'=>$this->form_validation->set_value('lng'),
					'max_open'=>$this->form_validation->set_value('max_open'),
					'max_women'=>$this->form_validation->set_value('max_women'),
					'capacity'=>$this->form_validation->set_value('capacity'),
					'dir_name'=>$this->form_validation->set_value('dir_name'),
					'dir_phone'=>$this->form_validation->set_value('dir_phone'),
					'dir_email'=>$this->form_validation->set_value('dir_email')
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
		$db_feed=$this->tournament->get_by_date($form_date);
		foreach ($db_feed as $row){
			if($this->form_validation->set_value('name')==$row['name']){
				return false;
			}
		}
		//var_dump($date);
		return true;
	}

	public function success()
	{

		$this->load->view('tournament/success');
	}

	/**
	* Funkcia sluzi na ulozenie suboru a spracovanie formulara na vytvorenie nového alebo použitie existujúceho tournamentu
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
			$this->form_validation->set_rules('about','About','trim|xss_clean');
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
						'name'			=>	$this->form_validation->set_value('name'),
						'date'			=>	$this->form_validation->set_value('date'),
						'location'		=>	$this->form_validation->set_value('location'),
						'about' 		=> $this->form_validation->set_value('about')
					);
					if ($this->tournament->add_tournament($tournament_data) ){
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
	* Player validation help function if gender is valid
	*
	*
	* @return boolean
	* @author Branislav Ballon
	*/
	function validate_gender($gender){
		return ($gender == "Male" || $gender == "Female");
	}


	/**
	* Interná funkcia slúťiaca na validáciu dát hráča pri importe, na vstupe sú dané všetky atribúty pre hráča
	* ktoré preju internou validaciu codeignitera, v prípade že daný hráč nie je válídny, vráti o tom informáciu
	*
	*
	* @return string
	* @author Branislav Ballon
	*/
	function __validete_player($name = "", $surname = "", $gender = "", $category = "",$birth_date = "", $line_number = 0, $player_number = 0 ){
		$v_errors = "";

		$_POST['name'] 			= $name;					//ulozime
		$_POST['surname']		= $surname;
		$_POST['gender'] 		= $gender;
		$_POST['category']		= $category;
		$_POST['birth_date']	= $birth_date;

		$this->load->library('form_validation');
		$this->form_validation->set_rules('name', '', 'trim|required|xss_clean|htmlspecialchars');
		$this->form_validation->set_rules('surname', '', 'trim|required|xss_clean|htmlspecialchars');
		$this->form_validation->set_rules('gender', '', 'trim|required|xss_clean|htmlspecialchars|callback_validate_gender');
		$this->form_validation->set_rules('category', '', 'trim|required|xss_clean|htmlspecialchars');
		$this->form_validation->set_rules('birth_date', '', 'trim|xss_clean|htmlspecialchars');

		$this->form_validation->set_message('validate_gender','Gender is not valid! Please use only Male or Female.');

		if ($this->form_validation->run())
		{
			$v_errors = "";
		}else{
			$v_errors .= " <div class='player-error' > </n>";
			$v_errors .= "Error in player data: ";
			// $v_errors .= "</n>";
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
	* Funkcia na na spracovanie (parsovanie) importovaného súboru, prejde celý súbor po riadkoch
	* ukladá si všetky dáta, pričom keď narazí na hráča tak ho zvaliduje, všetky údake ukladá do polí 
	* player-lap-data - vzdy index hraca -> lapy -> kose
	* final_laps_data - vzdy index hraca -> lapy -> kose
	* players - udaj o hracovi -> hodnotu
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
		$dataString = str_replace("\r\n", "\n", $dataString);
		$lines = explode("\n",$dataString); 	// rozdelime subor na pole riadkov
		$lines = array_slice($lines, 0, ( sizeof($lines) -1 ) );  
		foreach ($lines as $row) {				// prechadzame po riadku
			$loaded_player_data = FALSE;
			$line_number++;
			$values = explode(CSV_COLUMN_SEPARATOR,$row);		// zozdelime riadok na slova
			//if( strlen( $values[0] ) > 0 ){		// kontrola ci to nie je prazdne policko
				if(  ( (string) $values[0] !== "n" ) && ( (string)$values[0] !== "f" ) ){ //ak je to riadok s menom, priezviskom...
					$player_number++;
					
					/*tu doplnat udaje ktore chceme ukladat*/
					$name					= $values[0];					
					$surname				= $values[1];
					$gender 				= $values[2];   
					$category				= $values[3];
					//defaultne teda nevyplnene je 0000-00-00 iba ked chceme mat s rovankym menom tak  zoberieme inu hodnotu
					$birth_date				= ( $values[4] != null ) ? $values[4] : "0000-00-00";

					// volanie validacie
					$player_errors = $this->__validete_player($name ,$surname ,$gender ,$category, $birth_date, $line_number, $player_number );
					if( $player_errors == ""){ // ak nie su errory ulozim ho a zapamatam si jeho id
						$valid_players[$player_number]['name'] 			= $name;
						$valid_players[$player_number]['surname'] 		= $surname;
						$valid_players[$player_number]['gender'] 		= $gender;
						$valid_players[$player_number]['category'] 		= $category;
						$valid_players[$player_number]['birth_date'] 	= $birth_date;
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
		$players = $this->__check_players_has_tournament($players, $data['tournament_id']);

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
			$player_id = $this->help_functions->exists_profile($player['name'],$player['surname'], $player['birth_date']);
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
	function __check_players_has_tournament($players, $tournament_id){
		foreach ($players as $key => $player) {
			$data['user_id'] = $player['exist'];
			$data['tournament_id'] = $tournament_id;
			$data['category_id'] = $player['category_exist'];

			$player_has_tournament = $this->tournament->player_has_tournament($data);
			if( $player_has_tournament ){
				$players[$key]['has_tournament'] =  1;
			}else{
				$players[$key]['has_tournament'] = -1;
			}
		}
		return $players;
	}


	/**
	* Funkcia ktorá, zisťuje existenciu kategórie
	*
	*
	* @return array
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

	/**
	* Function to save player imported data
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function __save_player_data( $tournament_id, $user_id, $player_laps_data, $player_final_laps_data = NULL, $number_of_laps, $number_of_final_laps, $category_id ){
		$points = 0;
		$data = array();
		$in_final = FALSE;
		$baskets_data 	  = array();
		$lap_count = 0;
		$disq = false;
		foreach ($player_laps_data as $lap_key => $lap) {
			$points += array_sum( $lap );
			$data['lap_'.($lap_key+1)] = array_sum( $lap );
			$baskets_data['no_bskts_'.($lap_key+1)] = count( $lap );
			$lap_count++;

			if ($data['lap_'.($lap_key+1)]=='0'){
				$disq=true;
			}

			//NEW BASKETS
			$lap_id = $this->tournament->save_lap( $tournament_id, $user_id, $lap_key+1, FALSE );
			//debug($lap_id);
			foreach ( $lap as $basket_key => $basket ) {
				$this->tournament->save_basket( $basket, $lap_id, $basket_key );
			}
			
			//NEW BASKETS


		}
		if( $player_final_laps_data != NULL){
			foreach ($player_final_laps_data as $lap_key => $lap) {
				$points += array_sum( $lap );
				$data['final_'.($lap_key+1)] = array_sum( $lap );
				$baskets_data['no_final_'.($lap_key+1)] = count( $lap );


			//NEW BASKETS
			$lap_id = $this->tournament->save_lap( $tournament_id, $user_id, $lap_key+1, TRUE );
			//debug($lap_id);
			foreach ( $lap as $basket_key => $basket ) {
				$this->tournament->save_basket( $basket, $lap_id, $basket_key );
			}
			
			//NEW BASKETS
			}
		}
		if( ( $number_of_laps + $number_of_final_laps )  == count( $data ) ){
			$player_has_tournament['final'] = 1;
		}
		if( (( $number_of_laps )  > $lap_count ) || $disq ){
			$player_has_tournament['disqualified'] = 1;
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
	* Fumction to save loaded data
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
				if(    ( ( $player['exist'] != -1 ) && ($player['category_exist'] != -1) ) && (isset($_POST[$player['exist']]) ||  ($player['has_tournament'] == -1) ) ){
					if( !isset($final_laps_data[$key]) ){
						$final_laps_data[$key] = null;						
					}
					//ak chceme vymať pôvodné dáta, $player['exist'] = player_id, $player['has_tournamet'] = tournament_id
					if( isset( $_POST[$player['exist']] ) && $player['has_tournament'] != -1 ){
						if( $this->tournament->delete_player_results_in_tournament($tournament_id, $player['exist'] ) ){
						
						}
					}
					$this->__save_player_data( $tournament_id, $player['exist'], $laps_data[$key],  $final_laps_data[$key], $number_of_laps, $number_of_final_laps, $player['category_exist'] );
				}
				if( ( ( $player['exist'] == -1 ) && ($player['category_exist'] != -1)  && (isset($_POST[$player['exist']]) ||  ($player['has_tournament'] == -1) ) ) ){
					if( !isset($final_laps_data[$key]) ){
						$final_laps_data[$key] = null;						
					}
					$new_player_id =  $this->help_functions->__create_auto_profile( $player['name'], $player['surname'],  $player['gender'], null, $player['birth_date']);
					$this->__save_player_data($tournament_id, $new_player_id, $laps_data[$key],  $final_laps_data[$key], $number_of_laps, $number_of_final_laps, $player['category_exist'] );
					//$this->__save_player_data( $player['exist'],$laps_data[$key], $final_laps_data[$key] );
				}

				//treba ošetriť podmienku, že chcem zamazať existujúce výsledky hráča
				//if( $this->tournament->delete_player_results_in_tournament($_POST['tournament_id'], $_POST['player_id'] ) ){}

			}
		}
		$this->compute_year_rank_open_women();	
		$this->session->set_flashdata('message', 'Data imported, set pars data');
		// redirect('tournaments/admin_view_tournaments');
		redirect('tournaments/admin_set_par_lap/'.$tournament_id);
	}

	function admin_delete_results(){
		if (!$this->tank_auth->is_logged_in())
		{
			redirect();
		}
		$data['players'] = $this->tournament->get_all_players();
		

		if( isset($_POST['player_id']) && isset($_POST['submit']) ){
			$data['player_id'] = $_POST['player_id'];

			$player_tournaments = $this->tournament->get_all_player_tournaments($_POST['player_id']);
			$data['tournaments'] = array();
			foreach ($player_tournaments as $key => $player_tournament) {
				$data['tournaments'][] = $this->tournament->get_tournament_by_id( $player_tournament->tournament_id );
			}
		}


		if( isset($_POST['player_id']) && isset($_POST['delete']) ){
			if( $this->tournament->delete_player_results_in_tournament($_POST['tournament_id'], $_POST['player_id'] ) ){
				
				$this->session->set_flashdata('message', 'Data deleted');
			}
			$this->session->set_flashdata('message', 'Data deleted');
			$this->load->view('tournament/admin_view_tournaments');
		}
		$this->load->view('tournament/admin_delete_results', $data);	
	}



  
  
  /**
  * Function filter results by tournaments, players, categories
  * 
  * @author Vladimir Lalik
  * @return void
  */

  
  function view_results()
  {

  	 $this->form_validation->set_rules('tournaments', 'Tournaments', 'trim|required|xss_clean|strip_tags');
  	// $this->form_validation->set_rules('players', 'Players', 'trim|required|xss_clean|strip_tags'); // if selecting players is enabled
  
  	if ($this->form_validation->run())
  	{
  		
	   	 $data['tournaments'] = $this->tournament->get_tournaments();
		// $data['users'] = $this->tournament->get_all_players();
		 $data['categories'] = $this->tournament->get_categories();

		 $tournament_id = $this->input->post('tournaments');
		 //$player_id = $this->input->post('players');
		 
		 if ($tournament_id!=NULL && $data['categories']!=NULL)
		 {
		 	 foreach ($data['categories'] as $key => $category) {
		 	 	
		 	 	 $category_id = $category['category_id'];
			  	 //$data['results'][$category_id] = $this->tournament->get_all_results($tournament_id, $player_id, $category_id); // if selecting players is enabled
			  	 $data['results'][$category_id] = $this->tournament->get_all_results($tournament_id, 'ALL', $category_id);
			  	 // compute ranking
			  	 //print_r($data['results']);
			  	 if ($data['results'][$category_id] != NULL)
			  	 {
				  	 /* if ($player_id != 'ALL')
				  	  {
				  	 	if ($data['results'][$category_id]['0']['disqualified'] == '1')
				  	 	{
				  	 		$data['results'][$category_id]['0']['rank'] = '';	// if selecting players is enabled
				  	 	}
				  	 	else
				  	 	{
				  	 		$data['results'][$category_id]['0']['rank'] = $this->compute_rank($player_id, $tournament_id, $category_id);
				  	 	}
				  	 }
				  	 else 
				  	 {*/
					  	 $rank = 0;
					  	 $same = 0;
						 foreach ($data['results'][$category_id] as $key => $row)
						 {
						 	if ($row['disqualified'] != NULL)
						 	{
						 		$data['results'][$category_id][$key]['rank'] = NULL;
						 	} 
						 	elseif ($key!=0 && $data['results'][$category_id][$key-1]['points'] == $data['results'][$category_id][$key]['points'])
						 	{
						 		$data['results'][$category_id][$key]['rank'] = $rank;	
						 		$same = $same + 1;
						 	} 
						 	else 
						 	{
						 		$rank = $rank + 1 + $same;
						 		$same = 0;
						 		$data['results'][$category_id][$key]['rank'] = $rank;	
						 	}
						 }
					//}
				}
			}
			//print_r($data['results']);
			// die();
		}
		$this->load->view('result_view', $data);
		   
		  

	}  		
  	else 
  	{

	  	 $data['tournaments'] = $this->tournament->get_tournaments();
	  	 $data['users'] = $this->tournament->get_all_players();
	  	 $data['categories'] = $this->tournament->get_categories();
	  	 $last_tournament_id = $data['tournaments']['0']['tournament_id'];
	  	 $player_id = 'ALL';

	  	if ($last_tournament_id!=NULL && $data['categories']!=NULL)
		{
		  	 
			 foreach ($data['categories'] as $key => $category) {
			 	 $category_id = $category['category_id'];

			  	 $data['results'][$category_id] = $this->tournament->get_all_results($last_tournament_id, $player_id, $category_id);
			  	 if ($data['results'][$category_id] != NULL)
			  	 {
				  	 /* if ($player_id != 'ALL')
				  	  {
				  	 	if ($data['results'][$category_id]['0']['disqualified'] == '1')
				  	 	{
				  	 		$data['results'][$category_id]['0']['rank'] = '';	// if selecting players is enabled
				  	 	}
				  	 	else
				  	 	{
				  	 		$data['results'][$category_id]['0']['rank'] = $this->compute_rank($player_id, $last_tournament_id, $category_id);
				  	 	}
				  	 }
				  	 else 
				  	 {*/
					  	 $rank = 0;
						 foreach ($data['results'][$category_id] as $key => $row)
						 {
						 	if ($row['disqualified'] != NULL)
						 	{
						 		$data['results'][$category_id][$key]['rank'] = NULL;
						 	} 
						 	elseif ($key!=0 && $data['results'][$category_id][$key-1]['points'] == $data['results'][$category_id][$key]['points'])
						 	{
						 		$data['results'][$category_id][$key]['rank'] = $rank;	
						 	} 
						 	else 
						 	{
						 		$rank = $rank + 1;
						 		$data['results'][$category_id][$key]['rank'] = $rank;	
						 	}
						 }
					}
				//}
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
	return NULL;
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
	if ($data['results']!=null)
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
	//get stats for every round and basket
	$data['laps'] = $this->tournament->get_lap_info($player_id);
	//print_r($data);
	//
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
 	if (!$this->help_functions->is_admin())
	{
		redirect();
	}
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


/**
* Function thaht update tournament attributes
*
* @author Vladimir Lalik
* @return void
*/

 function admin_update_tournament()
 {
 	if (!$this->help_functions->is_admin())
	{
		redirect();
	}
	$tournament_id = $this->uri->segment(3);
	$data = $this->tournament->get_tournament_by_id($tournament_id);
	if ($data == NULL) {
		redirect('/tournaments/admin_view_tournaments');
	}
	$this->form_validation->set_rules('name','Name','trim|required|xss_clean|strip_tags');
	$this->form_validation->set_rules('about','About','trim');
	$this->form_validation->set_rules('allow_registration','Allow registration','trim|xss_clean|strip_tags');
	$this->form_validation->set_rules('date','Date','required|xss_clean');
	$this->form_validation->set_rules('date_to','Date to','required|xss_clean');
	$this->form_validation->set_rules('location','Location','trim|required|xss_clean|strip_tags');
	$this->form_validation->set_rules('capacity','Capacity','trim|required|xss_clean|is_natural|strip_tags');
	$this->form_validation->set_rules('rounds','Rounds','trim|required|xss_clean|is_natural_no_zero|strip_tags');
	$this->form_validation->set_rules('rounds_final','Final rounds','trim|required|xss_clean|is_natural_no_zero|strip_tags');
	$this->form_validation->set_rules('slovak_champ','Slovak championship','trim|xss_clean|strip_tags|numeric');
	$this->form_validation->set_rules('lat','Lattitude','trim|xss_clean|strip_tags');
	$this->form_validation->set_rules('lng','Longtitude','trim|xss_clean|strip_tags');
	$this->form_validation->set_rules('max_open','Parameter of tournament','trim|xss_clean|strip_tags|numeric');
	$this->form_validation->set_rules('max_women','Parameter of tournament','trim|xss_clean|strip_tags|numeric');
	$this->form_validation->set_rules('dir_name','Director\'s Name','trim|required|xss_clean|strip_tags');
	$this->form_validation->set_rules('dir_phone','Director\'s phone','trim|numeric|xss_clean|strip_tags');	
	$this->form_validation->set_rules('dir_email','Director\'s email','trim|valid_email|xss_clean|strip_tags');
	$this->form_validation->set_message('datecheck', 'Tournament with selected name and date already exits!');
	if($this->form_validation->run()){
		$allow_registration = $this->form_validation->set_value('allow_registration');
		if ($allow_registration == NULL)
		{
			$allow_registration = 0;	
		}
		$slovak_champ=$this->form_validation->set_value('slovak_champ');
		if ($slovak_champ == NULL)
		{
			$slovak_champ = 0;	
		}
		
		$tournament_data = array(
					'name'			=>	$this->form_validation->set_value('name'),
					'date'			=>	$this->form_validation->set_value('date'),
					'date_to'			=>	$this->form_validation->set_value('date_to'),
					'location'		=>	$this->form_validation->set_value('location'),
					'nmbr_of_round'		=>	$this->form_validation->set_value('rounds'),
					'nmbr_of_fnl_laps'	=>	$this->form_validation->set_value('rounds_final'),
					'about' => $this->form_validation->set_value('about'),
					'allow_registration' => $allow_registration,
					'slovak_champ' => $slovak_champ,
					'lat'=>$this->form_validation->set_value('lat'),
					'lng'=>$this->form_validation->set_value('lng'),
					'max_open'=>$this->form_validation->set_value('max_open'),
					'max_women'=>$this->form_validation->set_value('max_women'),
					'capacity'=>$this->form_validation->set_value('capacity'),
					'dir_name'=>$this->form_validation->set_value('dir_name'),
					'dir_phone'=>$this->form_validation->set_value('dir_phone'),
					'dir_email'=>$this->form_validation->set_value('dir_email')
				);
			
				
		if ($this->tournament->update_tournament($tournament_id, $tournament_data)) {
			
				//$this->load->view('tournament/success', $tournament_data);
			$this->session->set_flashdata('message', '<p class="success">Tournament was successfully updated!</p>');
			redirect('tournaments/admin_view_tournaments');
		} else {
			$this->session->set_flashdata('message', '<p class="fail">Tournament was not updated!</p>');
			redirect('tournaments/admin_view_tournaments');
		}
				// inserte?	
	}else{

		$this->load->view('tournament/update_tournament', $data);	

	}		
}


/**
* Function delete tournament and all results join with tournament and registered players
* @author Vladimir Lalik
*
*/
function admin_delete_tournament()
{
	if (!$this->help_functions->is_admin())
	{
		redirect();
	}
	$tournament_id = $this->uri->segment(3);
	
	if ( $this->tournament->delete_tournament($tournament_id))
	{
		$this->session->set_flashdata('message', '<p class="success">Tournament was deleted!</p>');
		redirect('tournaments/admin_view_tournaments');
	} 
	else 
	{
		$this->session->set_flashdata('message', '<p class="fail">Tournament was not deleted!</p>');
		redirect('tournaments/admin_view_tournaments');
	}
}

function admin_delete_tournament_results()
{
	if (!$this->help_functions->is_admin())
	{
		redirect();
	}
	$tournament_id = $this->uri->segment(3);
	
	if ($this->tournament->delete_tournament_results($tournament_id))
	{
		$this->session->set_flashdata('message', '<p class="success">Tournaments results was deleted!</p>');
		redirect('tournaments/admin_view_tournaments');
	} 
	else 
	{
		$this->session->set_flashdata('message', '<p class="fail">Tournament results was not deleted!</p>');
		redirect('tournaments/admin_view_tournaments');
	}	
}

function view_tournaments()
{
	$this->load->library('pagination');
	$config['base_url'] = base_url().'index.php/tournaments/view_tournaments/'	;
	$config['total_rows'] = $this->tournament->get_nmbr_tournaments();
	$config['per_page'] = 10;  
	$config['full_tag_open'] = '<div id="pagination">';
	$config['full_tag_close'] = '</div>';
						
	$config['first_link'] = 'First';
	$config['last_link'] = 'Last';
						
	$config['next_tag_open'] = '<span class="next">';
	$config['next_tag_close'] = '</span>';
						
	$config['prev_tag_open'] = '<span class="prev">';
	$config['prev_tag_close']= '</span>';

	$this->pagination->initialize($config); 
	if ($this->uri->segment(3) == NULL)
	{
		$number = 0;
	} 
	else 
	{
		$number= $this->uri->segment(3);
	}

	$data['tournaments']=$this->tournament->get_tournaments_paginate($number, $config['per_page']);
	$this->load->view('tournament/tournament_blog_view', $data);
}


/**
* Function that view details of tournament and allow 
*
* @author Vladimir Lalik
* @return void
*
*/
function tournament_details()
{
	$tournament_id=$this->uri->segment(3);
	$data=$this->tournament->get_tournament_by_id($tournament_id);
	if ($data==NULL)
	{
		redirect('tournaments/view_tournaments');
	}

	$data['options']=$this->tournament->get_options_tournament($tournament_id);

	$this->form_validation->set_rules('category_id','Category','trim|required|xss_clean|strip_tags');
	$this->form_validation->set_rules('tournament_id','Tournament','trim|required|xss_clean|strip_tags');
	$this->form_validation->set_rules('food','Food','trim|xss_clean|strip_tags');
	$this->form_validation->set_rules('accom','Accommodation','trim|xss_clean|strip_tags');
	$this->form_validation->set_rules('note','Note','trim|xss_clean|strip_tags');
	if ($this->form_validation->run()){
		
		if (!$this->tank_auth->is_logged_in()) 
		{
			redirect(); // redirect if user is not logged in
		}
		
		$registration_data = array(
			'user_id'=>$this->session->userdata('id'),
			'tournament_id'=>$this->form_validation->set_value('tournament_id'),
			'category_id'=>$this->form_validation->set_value('category_id'),
			'accom_id'=>$this->form_validation->set_value('accom'),
			'food_id'=>$this->form_validation->set_value('food'),
			'note'=>$this->form_validation->set_value('note')
		);

		if ($this->tournament->register_player($registration_data))
		{
			$this->session->set_flashdata('message', '<p class="success">You are register in tournament '.$data['name'].' ('.$data['date'].')</p>');
			redirect('tournaments/tournament_details/'.$data['tournament_id']);
		} 
		else 
		{
			$this->session->set_flashdata('message', '<p class="fail"> You are already registered in tournament '.$data['name'].' ('.$data['date'].'). If not contact administrator.</p>');
			redirect('tournaments/tournament_details/'.$data['tournament_id']);
		}
		//print_r($registration_data);
		//die();
	}
	else 
	{
		$date_tourn = new DateTime($data['date']);
		$date_now = new DateTime('now');
		$interval = $date_tourn->diff($date_now);
		$data['will'] = $interval->invert;
		$data['categories']=$this->tournament->get_categories();
		//print_r($interval);
		$this->load->view('tournament/tournament_details', $data);
	}
}


/**
* Function that view registerd players in tournament
*
* @author Vladimir Lalik
* @return void
*
*/
function registered_players()
{
	
	$this->form_validation->set_rules('tournament_id','Tournament','trim|required|xss_clean|strip_tags');
	$data['tournaments']=$this->tournament->get_tournaments();
	
	if ($this->form_validation->run())
	{
		$tournament=array(
			'tournament_id'=>$this->form_validation->set_value('tournament_id')
		);
		$data['registered_players']=$this->tournament->get_registerd_players($this->form_validation->set_value('tournament_id'));
		$data['tournament']=$this->tournament->get_tournament_by_id($tournament['tournament_id']);

		$this->load->view('tournament/registered_players_view', $data);
	} 
	else 
	{
		$this->load->view('tournament/registered_players_view', $data);
	}
}


/**
* Function that view registerd players in tournament with more info for administrator
*
* @author Vladimir Lalik
* @return void
*
*/
function admin_registered_players()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$this->form_validation->set_rules('tournament_id','Tournament','trim|required|xss_clean|strip_tags');
	$data['tournaments']=$this->tournament->get_tournaments();
	
	if ($this->form_validation->run())
	{
		$tournament=array(
			'tournament_id'=>$this->form_validation->set_value('tournament_id')
		);
		$data['registered_players']=$this->tournament->get_registerd_players($this->form_validation->set_value('tournament_id'));
		$data['tournament']=$this->tournament->get_tournament_by_id($tournament['tournament_id']);

		$this->load->view('tournament/admin_registered_players_view', $data);
	} 
	else 
	{
		$this->load->view('tournament/admin_registered_players_view', $data);
	}
}


/**
* Function that view all categories
* @author Vladimir Lalik
* @return void
*/
function admin_get_categories()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$data['categories'] = $this->tournament->get_categories();
	$this->load->view('categories_view', $data);
}

/**
* Function for update category name
* @author Vladimir Lalik
*
* @return void
*/
function admin_update_cat()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$category_id = $this->uri->segment(3);
	$this->form_validation->set_rules('category', 'Category_name', 'trim|required|min_length[2]|xss_clean');
	if ($this->form_validation->run())
	{
		$data = array(
			'category'=>$this->form_validation->set_value('category')
		);

		if ($this->tournament->udpate_category($category_id, $data))
		{
			$this->session->set_flashdata('message', '<p class="success">Category was updated</p>');
			redirect('tournaments/admin_get_categories');
		}
		else
		{
			$this->session->set_flashdata('message', '<p class="fail">Category was not updated</p>');
			$this->load->view('update_category', $data);
		}
	}
	else 
	{	
		$data = $this->tournament->get_category_by_id($category_id);
		if ($data==NULL)
		{
			redirect('tournaments/admin_get_categories');
		}
		$this->load->view('update_category', $data);
	}
}

/**
* Function add new category 
*
* @author Vladimir Lalik
* @return void
*/
  
function admin_add_category()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$this->form_validation->set_rules('category', 'Category_name', 'trim|required|min_length[2]|xss_clean');
	if ($this->form_validation->run())
	{
		$data = array(
			'category'=>$this->form_validation->set_value('category')
		);

		if ($this->tournament->add_category($data))
		{
			$this->session->set_flashdata('message', '<p class="success">New category was added.</p>');
			redirect('tournaments/admin_get_categories');
		}
		else
		{
			$this->session->set_flashdata('message', '<p class="fail">Category was not added.</p>');
			redirect('tournaments/add_category');
		}
	}
	else 
	{	
		$this->load->view('add_category');
	}
}

/**
* Function delete category
* 
*@author Vladimir Lalik
* @return void
*/
function admin_delete_cat()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$category_id = $this->uri->segment(3);
	if ($this->tournament->delete_cat($category_id))
	{
		$this->session->set_flashdata('message', '<p class="success">Category was deleted</p>');
		redirect('tournaments/admin_get_categories');
	}
	else 
	{
		$this->session->set_flashdata('message', '<p class="fail">Category was not deleted</p>');
		redirect('tournaments/admin_get_categories');	
	}
}


/**
* Function mual add results 
*@author Branislav Ballon
* @return void
*/
function admin_add_result(){
		$this->load->library('form_validation');
		$this->form_validation->set_rules('player_id', 'trim|required');
		
		if ($this->form_validation->run()){
			// ulozime
			//debug($_POST);
			// $data = array(
			// 	'text' => $_POST['text'],
			// );
			
			// $this->notes_model->addNote($data);
			
			// redirect('notes');
		}
		else{
			// chyba
			$data['tournaments'] 	= $this->tournament->get_all_tournaments();
			$data['players'] 		= $this->tournament->get_all_players();
			$this->load->view( 'tournament/add_results', $data );
		}
}


/**
* Function that set par for laps by categories
* @author Vladimir Lalik
* @return void
*/

function admin_set_par_lap()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$tournament_id = $this->uri->segment(3);
	
	$number_of_round=$this->tournament->get_nmbr_of_round($tournament_id);
	$number_of_final=$this->tournament->get_nmbr_of_final_round($tournament_id);

	$this->form_validation->set_rules('category_id','Category','trim|required|xss_clean|strip_tags');
	$data['categories']=$this->tournament->get_categories();
	$data['number_of_round'] = $number_of_round;
	$data['number_of_final'] = $number_of_final;

	// set validation rules for all fields
	foreach($data['categories'] as $category)
	{
		for ($num=1; $num<=$number_of_round; $num++) // all rounds
		{
			for ($i=1; $i<=20; $i++) // all baskets
			{
				/*
				Structure of name is basket_[rank of basket]_[category_id]_[rank of round]
				*/
				$this->form_validation->set_rules('basket_'.$i.'_'.$category['category_id'].'_'.$num, 'Basket '.$i, 'trim|xss_clean|is_numeric');
			}
		}
		// final rounds
		for ($num=1; $num<=$number_of_final; $num++) // all final rounds
		{
			for ($i=1; $i<=20; $i++) // all baskets
			{
				/*
				Structure of name is basket_[rank of basket]_[category_id]_[rank of round]
				*/
				$this->form_validation->set_rules('final_'.$i.'_'.$category['category_id'].'_'.$num, 'Basket '.$i, 'trim|xss_clean|is_numeric');
			}
		}
	}
	if ($this->form_validation->run())
	{
		//zapis
		//skotrolujem vsetky kategorie
		foreach ($data['categories'] as $key => $value) {
				
				//normal rounds
				$result = FALSE;
				for ($num=1; $num<=$number_of_round; $num++) // all rounds
				{
					for ($i=1; $i<=20; $i++)
					{
						if ($this->form_validation->set_value('basket_'.$i.'_'.$value['category_id'].'_'.$num)!=NULL)
						{
							//arguments for set_lap_par(tournament_id, value of par, number of basket, number of round, final round if it is final then 1 else 0)
							$res = $this->tournament->set_lap_par($tournament_id, $value['category_id'], $this->form_validation->set_value('basket_'.$i.'_'.$value['category_id'].'_'.$num),$i, $num, 0);
							$result = $result || $res;
							
						}
					}
				}
				// final rounds
				for ($num=1; $num<=$number_of_final; $num++) // all final rounds
				{
					for ($i=1; $i<=20; $i++)
					{
						if ($this->form_validation->set_value('final_'.$i.'_'.$value['category_id'].'_'.$num)!=NULL)
						{
							//arguments for set_lap_par(tournament_id, value of par, number of basket, number of round, final round if it is final then 1 else 0)
							$res = $this->tournament->set_lap_par($tournament_id, $value['category_id'], $this->form_validation->set_value('final_'.$i.'_'.$value['category_id'].'_'.$num),$i,$num, 1);
							$result = $result || $res;
							
						}
					}
				}			
		}
		if ($result)
		{
			$this->session->set_flashdata('message', '<p class="success">Par was updated</p>');
		}
		else 
		{
			//die();
			$this->session->set_flashdata('message', '<p class="fail">Som data was probably not updated. Please check it</p>');	
		}
		redirect('tournaments/admin_set_par_lap/'.$tournament_id);
	}
	 else
	{
		$par = $this->tournament->get_par_by_id($tournament_id);
		//print_r($par);

		foreach ($par as $key => $value){
			//$row['basket_'.$value['number'].$value['category_id']] =array('par'=>$value['par'], 'category_id'=>$value['category_id']);
			if ($value['final']==0 || $value['final']==NULL)
			{
				$row['basket_'.$value['number'].'_'.$value['category_id'].'_'.$value['no_round']] =$value['par'];
			} 
			else
			{
				$row['final_'.$value['number'].'_'.$value['category_id'].'_'.$value['no_round']] =$value['par'];
			}
		}
		//print_r($row);
		//die();
		$data['unique_par'] = NULL;
		if (isset($row)){
			$data['unique_par'] = $row;	
		}
		$data['tournament'] = $this->tournament->get_tournament_by_id($tournament_id);
		$this->load->view('tournament/admin_set_par', $data);
	} 

}


/**
* Function that set par for laps by categories
* @author Vladimir Lalik
* @return void
*/

function __admin_set_par_lap_gender()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$tournament_id = $this->uri->segment(3);
	
	
	$this->form_validation->set_rules('gender','Gender','trim|required|xss_clean|strip_tags');
	//$data['categories']=$this->tournament->get_categories();

	// set validation rules for all fields
	for ($j=0; $j<2; $j++)
	{
		if ($j==0){
			$gender="male";
		}else{
			$gender="female";
		}
		for ($i=1; $i<=20; $i++)
		{
			$this->form_validation->set_rules('basket_'.$i.'_'.$gender, 'Basket '.$i, 'trim|xss_clean|is_numeric');
		}
	}
	if ($this->form_validation->run())
	{
		//zapis
		//skotrolujem vsetky kategorie
			$result = FALSE;
			for ($j=0; $j<2; $j++)
			{
				if ($j==0){
					$gender="male";
				}else{
					$gender="female";
				}

				
				for ($i=1; $i<=20; $i++)
				{
					if ($this->form_validation->set_value('basket_'.$i.'_'.$gender)!=NULL)
					{
						$res = $this->tournament->set_lap_par_gender($tournament_id, $gender, $this->form_validation->set_value('basket_'.$i.'_'.$gender),$i);
						$result = $result || $res;
						
					}
				}
		}
		if ($result)
		{
			$this->session->set_flashdata('message', '<p class="success">Par was updated</p>');
		}
		else 
		{
			$this->session->set_flashdata('message', '<p class="fail">Par was probably not updated. Please check it</p>');	
		}
		redirect('tournaments/admin_set_par_lap_gender/'.$tournament_id);
	}
	 else
	{
		for ($j=0; $j<2; $j++)
			{
				if ($j==0){
					$gender="male";
				}else{
					$gender="female";
				}

			$par = $this->tournament->get_par_by_id_gender($tournament_id, $gender);
			foreach ($par as $key => $value){
				//$row['basket_'.$value['number'].$value['category_id']] =array('par'=>$value['par'], 'category_id'=>$value['category_id']);
				$row['basket_'.$value['number'].'_'.$gender] =$value['par'];
			}
		}
		$data['unique_par'] = NULL;
		if (isset($row)){
			$data['unique_par'] = $row;	
		}
		$data['tournament'] = $this->tournament->get_tournament_by_id($tournament_id);

		$this->load->view('tournament/admin_set_par_gender', $data);
	} 

}



/**
* Function that compute score of players by category
*
* @author Vladimir Lalik
*
*/

/*function __compute_year_rank()
{
	$tournaments = $this->tournament->get_tournaments();
	$categories = $this->tournament->get_categories();
	foreach ($tournaments as $key => $tournament) {
		// ziskat vsetkych nediskvalifikovanych hracov
		foreach ($categories as $category) {
			var_dump($tournament['tournament_id']);
			var_dump($category['category_id']);
			$players = $this->tournament->get_not_disq_players($tournament['tournament_id'], $category['category_id']);
			var_dump($players);
			if ($tournament['par'] != NULL)
			{
				$count = count($players); // pocet zucastnenych hracov
				if ($players!=NULL)
				{
					foreach ($players as $player) {
						$rank = $this->compute_rank($player['user_id'], $tournament['tournament_id'], $category['category_id']); // poradie hraca
						$score = (($count-$rank+1)/$count)*$tournament['par'];
						var_dump($rank);
						$this->tournament->update_score($tournament['tournament_id'], $player['user_id'], $score);
					}
				}
			}
		}
	}

	// vypocitam score za rok pre kazdeho hraca
	$players = $this->tournament->get_all_players();
	foreach ($players as $player) {
		$sum = $this->tournament->get_score_actual_year($player['user_id']);
		print_r($sum['sum']);
		$this->tournament->update_year_score($player['user_id'], $sum['sum']);
	}
	redirect('tournaments/admin_view_tournaments');
}*/
/**
* rank list compute score for category male and female
* @author Vladimir Lalik
*/

function compute_year_rank_open_women()
{
	$tournaments = $this->tournament->get_tournaments();
	foreach ($tournaments as $key => $tournament) {
		// ziskat vsetkych nediskvalifikovanych hracov
		$categories = array(
			'0'=>'max_open',
			'1'=>'max_women'
		);
		for ($i=0; $i<2; $i++) { // vypocet skore pre dve hlvane kategorie open a women 0 znamena OPEN a 1 znamena WOMEN
			
			$players = $this->tournament->get_not_disq_players_open_women($tournament['tournament_id'], $i);	
			$total_same_players=0;  //celkovy pocet hracov s rovnakym skore
			$last_score=-9999; 
			$num_similar_score=0; // pocet-1 za sebou iducich hracov
			$same_players=null; //pole hracov s rovnakym skore

			if ($tournament[$categories[$i]] != NULL)
			{
				$count = count($players); // pocet zucasntenych hracov
				if ($players!=NULL)
				{
					
					foreach ($players as $key=>$player) 
					{

						$rank = $this->__compute_rank_open_women($player['user_id'], $tournament['tournament_id'], $i); // vypocet poradia daneho hraca
						$score = (($count-($rank+$total_same_players)+1)/$count)*$tournament[$categories[$i]]; // skore daneho hraca (pripocitava sa pocet rovnakych doteraz najdenych co zabezpeci spravnost vypoctu)

						// zistovanie rovnakeh skore ak sa rovna skore aktualneho hraca so skore toho predoslehho hraca
						
						if (round($score,2)==round($last_score,2))
						{
							if ($num_similar_score==0) // ak je to druhy sa opakujuci musim zaratat aj ten pred nim 
							{
								$same_players['0_'.$total_same_players] = array(
									'user_id'=>$players[$key-1]['user_id'],
									'score'=>(($count-($rank+$total_same_players)+1)/$count)*$tournament[$categories[$i]],
									'tournament_id'=>$tournament['tournament_id']
								);
								//$num_similar_score=$num_similar_score+1;
							}

							$num_similar_score=$num_similar_score+1;
							$same_players[$num_similar_score.'_'.$total_same_players] = array (
									'user_id'=>$player['user_id'],
									'score'=>(($count-(($rank+$total_same_players)+$num_similar_score)+1)/$count)*$tournament[$categories[$i]],
									'tournament_id'=>$tournament['tournament_id']
							);
							

						}
						else if ($num_similar_score!=0) // ak sa nezhoduje dalsi v poradi a uz mam aspon 2 zhodne 
						{
							$total_same_players = $total_same_players + $num_similar_score; // zvysi sa celkovy pocet rovnakych
							
							$num_similar_score=0; // vynulujem pocet aktualnych
							

							// skore hracov ktory mali rovnaky vysledok v turnaji
							// updatnem skore hracov ktory mali rovnake skore spravim z ich skore priemer a ten im ulozim 
							$sum=0; 
							foreach($same_players as $same_player)
							{
								//var_dump($same_player['score']);
								$sum=$sum+$same_player['score'];
								
							}
							unset($same_player);
							//var_dump($same_players);
							// priemer tych co mali rovnake skore
							$average=$sum/count($same_players);
							//var_dump($average);

							foreach($same_players as $same_player)
							{
								$this->tournament->update_score($tournament['tournament_id'], $same_player['user_id'], $average);			
							}
							$same_players=null;
						}

						$score = (($count-($rank+$total_same_players)+1)/$count)*$tournament[$categories[$i]];
						$last_score = $score;
						//var_dump($player['user_id']);
						//var_dump($total_same_players);
						//var_dump($rank);
						//var_dump($score);
						$this->tournament->update_score($tournament['tournament_id'], $player['user_id'], $score);
					}

					if ($num_similar_score!=0) // ak sa nezhoduje dalsi v poradi a uz mam aspon 2 zhodne 
					{
							$total_same_players = $total_same_players + $num_similar_score; // zvysi sa celkovy pocet rovnakych
							
							$num_similar_score=0; // vynulujem pocet aktualnych
							

							// skore hracov ktory mali rovnaky vysledok v turnaji
							// updatnem skore hracov ktory mali rovnake skore spravim z ich skore priemer a ten im ulozim 
							$sum=0; 
							foreach($same_players as $same_player)
							{
								//var_dump($same_player['score']);
								$sum=$sum+$same_player['score'];
								
							}
							unset($same_player);
							//var_dump($same_players);
							// priemer tych co mali rovnake skore
							$average=$sum/count($same_players);
							//var_dump($average);

							foreach($same_players as $same_player)
							{
								$this->tournament->update_score($tournament['tournament_id'], $same_player['user_id'], $average);			
							}
							$same_players=null;
					}
					
				}
			}
		}
	}
	
	//die();
	// vypocitam score za rok pre kazdeho hraca
	$players = $this->tournament->get_all_players();
	foreach ($players as $player) {
		for ($i=0; $i<2; $i++) 
		{
			$sum = $this->tournament->get_score_actual_year($player['user_id'], $i);
			//$slovak_champ_sum=$this->tournament->get_score_actual_slovak($player['user_id']);
			//var_dump($sum['sum']);
			//die();
			$this->__compute_slovak_DG_score($player['user_id'], $i);			
			$this->tournament->update_year_score($player['user_id'], $sum['sum'], $i);
		}
	}	
	//die();
	redirect('tournaments/admin_view_tournaments');
}


/**
* Function that compute score in slovak DG league
* @author Vladimir Lalik
* 
*/
function __compute_slovak_DG_score($user_id, $category)
{
	$categories = array(
		'0'=>'open',
		'1'=>'women'
	);
	$players = $this->tournament->get_all_players();
	
	$results = $this->tournament->get_score_actual_slovak($user_id, $categories[$category]);
	$foreign_results = $this->tournament->get_foreign_results($user_id);
	//print_r($results);
	//print_r($foreign_results);

	$results_order_array = array();  // new array as a column to sort collector

	if ($results!=null)
	{
		foreach ($results as $content) {
			if ($content['slovak_champ']=='1'){
				$results_order_array[] = 1.5 * $content['score'];
			} else {
				$results_order_array[] = $content['score'];
			}
		}
	}
	if ($foreign_results!=null)
	{
		foreach ($foreign_results as $content) {
			$results_order_array[] = $content['score'];
		}
	}

	sort($results_order_array, SORT_NUMERIC);
	//print_r($results_order_array);
	
	$count=$this->tournament->get_nmbr_accept_tourn(); // pocet turnajov ktore sa akceptuju do hodnotenia
	$count=intval($count['nmbr_accept_tourn']);
	$index=count($results_order_array)-1; // najvyssi index v usporiadanom poli vysledkov
	$sum=0;
	while($index>=0 && $count>0)
	{
		$sum=$sum+$results_order_array[$index];
		$index--;
		$count--;
		//var_dump($count);
	}
	//print_r($sum);
	$this->tournament->update_slovak_DG_score($user_id, $categories[$category], $sum);

}


/**
* Function set score from foreign tournaments
*
*
*/
function set_foreign_score()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}

	$data['players']=$this->tournament->get_foreign_score();
	foreach ($data['players'] as $key => $player) {
		for($i=1; $i<5; $i++)
		{
			$this->form_validation->set_rules('foreign_'.$i.'_'.$player['user_id'], 'Tornament '.$i.' '.$player['last_name'].' '.$player['first_name'], 'trim|numeric|xss_clean');

		}	
	}

	if ($this->form_validation->run())
	{
		foreach ($data['players'] as $key => $player) {
			for($i=1; $i<5; $i++)
			{
				$score=$this->form_validation->set_value('foreign_'.$i.'_'.$player['user_id']);
				if ($score!=null)
				{
					$this->tournament->set_foreign_score($player['user_id'], $i, $score);
				}
			}	
		}
		$this->session->set_flashdata('message', '<p class="success">Score from foreign tournaments was updated.</p>');
		redirect('tournaments/set_foreign_score');
	}

	$this->load->view('tournament/set_foreign_score', $data);
}

/**
* Function delete all foreing results
* @author Vladimir Lalik
*/
function admin_delete_foreign_score()
{	
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$this->tournament->delete_foreign_result();
	redirect('tournaments/set_foreign_score');
}

function admin_delete_individual_foreign_score()
{
	$user_id=$this->uri->segment(3);
	$this->tournament->delete_individual_foreign_score($user_id);
	redirect('tournaments/set_foreign_score');
}

/**
* Function that compute player rank in tournament by two main categories OPEN and WOMEN
* @author Vladimir Lalik
* @return int
*/
function __compute_rank_open_women($player_id, $tournament_id, $category)
{
	 $results = $this->tournament->get_all_results_open_women($tournament_id,'ALL',$category);
	 //print_r($results);
	 //die();
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
	return NULL;
}


/**
* Function view ranking of players from current year
* 
* @author Vladimir Lalik
*
*/
function year_ranking()
{
 	$data['open'] = $this->tournament->get_year_ranking('open');
 	$data['women'] = $this->tournament->get_year_ranking('women');
 	//print_r($data);
 	$data['name']="Ranking";
 	$this->load->view('tournament/year_ranking', $data);

}


function slovak_DG_league()
{
	$data['open'] = $this->tournament->get_slovak_DG_ranking('open');
 	$data['women'] = $this->tournament->get_slovak_DG_ranking('women');
 	//print_r($data);
 	$data['name']="Slovak DG league";
 	$this->load->view('tournament/slovak_DG_league', $data);
}


/** 
* Function that show user score in tournaments from current year 
* @author Vladimir Lalik
* @return void
*
*/
function tournaments_score()
{
	$user_id=$this->uri->segment(3);
	$data = $this->tournament->get_user_data($user_id);
	$data['women']=$this->tournament->get_score_tournaments($user_id, 'women');
	$data['open']=$this->tournament->get_score_tournaments($user_id, 'open');
	//print_r($data);
	$this->load->view('tournament/tournaments_score', $data);
}

/**
* Function for setting number of tournaments which count to Slovak championship
* @author Vladimir Lalik
* @return void
* 
*/
function set_nmbr_acc_tourn()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$this->form_validation->set_rules('nmbr_accept_tourn', 'Number of tournaments which count to Slovak DG league ranklist ', 'trim|required|is_natural|is_int|xss_clean');
	if ($this->form_validation->run())
	{
		if ($this->tournament->set_nmbr_acc_tourn($this->form_validation->set_value('nmbr_accept_tourn')))
		{
			$this->session->set_flashdata('message', '<p class="succes">Number of tournaments which count to Slovak championship ranklist was updated</p>');
		} 
		else
		{
			$this->session->set_flashdata('message', '<p class="succes">Number of tournaments which count to Slovak championship ranklist was updated</p>');	
		}
		redirect('tournaments/set_nmbr_acc_tourn');

	} 
	else
	{
		$data = $this->tournament->get_nmbr_accept_tourn();
		$this->load->view('tournament/set_nmbr_acc_tourn', $data); 
	}
}

function admin_set_reg_option()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$tournament_id=$this->uri->segment(3);
	$data['options']=$this->tournament->get_options_tournament($tournament_id);
	$data['tournament']=$this->tournament->get_tournament_by_id($tournament_id);

	for($i=1; $i<5;$i++){
		$this->form_validation->set_rules('food_'.$i, 'Food '.$i, 'trim|min_length[2]|xss_clean');
		$this->form_validation->set_rules('accom_'.$i, 'Accommodation '.$i, 'trim|min_length[2]|xss_clean');
	}
	
	if ($this->form_validation->run())
	{
		for($i=1; $i<5;$i++){
			if ($this->form_validation->set_value('food_'.$i)!=NULL){
				$this->tournament->insert_option($this->form_validation->set_value('food_'.$i), $i, 'food', $tournament_id);
			} else {
				$this->tournament->delete_option($i,'food', $tournament_id);
			}
			if ($this->form_validation->set_value('accom_'.$i)!=NULL){
				$this->tournament->insert_option($this->form_validation->set_value('accom_'.$i), $i, 'accom', $tournament_id);
			} else {
				$this->tournament->delete_option($i,'accom', $tournament_id);
			}
		}
		$this->load->view('tournament/set_option_registration', $data);
	} 
	else 
	{
		$this->load->view('tournament/set_option_registration', $data);
	}
}

/** 
* Function allow to admin log off player from tournament
* @author Vladimir Lalik
*
*
*/

function admin_delete_registration()
{
	if (!($this->help_functions->is_admin()))
	{
		redirect();
	}
	$user_id=$this->uri->segment(3);
	$tournament_id=$this->uri->segment(4);
	$this->tournament->delete_registration($user_id, $tournament_id);
	redirect('tournaments/admin_registered_players/');
}

}

?>