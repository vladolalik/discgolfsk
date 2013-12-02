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
		
		$this->form_validation->set_rules('name','NAME','trim|required|xss_clean|strip_tags');
		$this->form_validation->set_rules('date','DATE','required|xss_clean|callback_datecheck');
		$this->form_validation->set_rules('location','LOCATION','trim|required|xss_clean|strip_tags');
		$this->form_validation->set_rules('rounds','ROUNDS','trim|required|xss_clean|is_natural_no_zero|strip_tags');
		$this->form_validation->set_rules('rounds_final','FINAL ROUNDS','trim|required|xss_clean|is_natural_no_zero|strip_tags');
		$this->form_validation->set_message('datecheck', 'Tournament with selected name and date already exits!');
		if($this->form_validation->run()){
			$tournament_data = array(
					'name'			=>	$this->form_validation->set_value('name'),
					'date'			=>	$this->form_validation->set_value('date'),
					'location'		=>	$this->form_validation->set_value('location'),
					'nmbr_of_round'		=>	$this->form_validation->set_value('rounds'),
					'nmbr_of_fnl_laps'	=>	$this->form_validation->set_value('rounds_final')
				);
			//print_r($tournament_data);
				
			if ($this->tournament->insert_entry($tournament_data)) {
				$this->load->view('tournament/success', $tournament_data);

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
		$data['tournamets'] = $this->tournament->get_all_tournaments();

		debug($_POST);

		$this->load->library('form_validation');

		if( isset($_POST['create']) ){ // ak nie je zaskrtnute ako novy tak validujeme
			debug('novy');
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
				$_SESSION['tournament_id']=$data['tournament_id'];
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
		header('Content-Type: text/html; charset=utf-8');
		$dataString =  file_get_contents('./uploads/'.IMPORTED_TMP_FILE_NAME.'.csv', true);
		$v_errors = ""; 				// string do ktoreho sa postupne nabaluju validacne errory
		$player_number = 0;						// cislo kolko mien mame zo suboru prejdenych
		$player_lap_data = array();
		$player_final_lap_data = array();
		$all_players_lap_data = array();
		$all_players_final_lap_data = array();
		$valid_players = array();
		$line_number = 0;
		$loaded_player_data = FALSE; 			// informacia o tom ci su pre noveho hraca ulozene uz nejake data

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
		//debug($players);
		//debug($data);
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


	/**
	* Funkcia
	*
	*
	* @return void
	* @author Branislav Ballon
	*/
	function __save_player_data($player_id, $user_data, $user_fianl_data = null){
		if( $player_id == -1 ){
			
		}

		// $this->tournament->__save_user_tournament();
		// $this->tournament->save_user_tournament_data();


	}

	function __save_tournamet_properties( $tournament_id, $laps_data, $final_laps_data ){
		debug( $laps_data );
		$maximum_laps = 0;
		$maximum_final_laps = 0;
		foreach ($laps_data as $key => $player_laps) {
			if ( count( $player_laps ) > $maximum_laps ){ $maximum_laps = count( $player_laps ); };
		}
		foreach ($final_laps_data as $key => $player_laps) {
			if ( count( $player_laps ) > $maximum_final_laps ){ $maximum_final_laps = count( $player_laps ); };
		}
		$this->tournament->save_tournament_properties( $tournament_id, $maximum_laps, $maximum_final_laps );
	}


	function __save_laps( $tournament_id, $laps_data, $final_laps_data ){
		foreach ( $laps_data as $key => $player_laps ) { //zoberiem prveho hraca
			foreach ( $player_laps as $lap_key => $lap ) { //prechazdam jednotlivimi lapmi prveho hraca a zistujem pocet kosov a ukladam			
				$this->tournament->save_lap( $tournament_id, $lap_key, count( $lap ) );
			//	debug (count( $lap ) );
			}
			break;
		}
		foreach ( $final_laps_data as $key => $player_laps ) { // to iste pre finalove lapy
			foreach ( $player_laps as $lap_key => $lap ) { //prechazdam jednotlivimi lapmi prveho hraca a zistujem pocet kosov a ukladam			
				$this->tournament->save_lap( $tournament_id, $lap_key, count( $lap ), TRUE );
			//	debug (count( $lap ) );
			}
			break;
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
		session_start();
		if( isset($_SESSION['players']) && isset($_SESSION['laps_data']) ){
			$players = $_SESSION['players'];
			$laps_data = $_SESSION['laps_data'];
			$final_laps_data = $_SESSION['final_laps_data'];
			$tournament_id = $_SESSION['tournament_id'];
			$this->__save_tournamet_properties( $tournament_id, $laps_data, $final_laps_data );
			$this->__save_laps( $tournament_id, $laps_data, $final_laps_data );

			// unset($_SESSION['players']);
			// unset($_SESSION['laps_data']);
			// unset($_SESSION['final_laps_data']);
			foreach ($players as $key => $player) {
				if( ( $player['exist'] == TRUE ) && ($player['category_exist'] == TRUE) && isset($_POST[$player['exist']]) ){
					$this->__save_player_data( $player['exist'], $laps_data[$key], $final_laps_data[$key] );
				}
				if( ( $player['exist'] == FALSE ) && ($player['category_exist'] == TRUE) ){
					//debug($player);
					//$this->__save_player_data( $player['exist'],$laps_data[$key], $final_laps_data[$key] );
				}

			}
		}
		debug($players);
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
  
  
  function view_results()
  {

  	 $this->form_validation->set_rules('tournaments', 'Tournaments', 'trim|required|xss_clean');
  	 $this->form_validation->set_rules('players', 'Players', 'trim|required|xss_clean');

  	if ($this->form_validation->run())
  	{

	   	 $data['tournaments'] = $this->tournament->get_tournaments();
		 $data['users'] = $this->tournament->get_all_players();
	  	 $data['results'] = $this->tournament->get_all_results($this->input->post('tournaments'), $this->input->post('players'));
	  	 $this->load->view('tournaments_view', $data);

	}  		
  	else 
  	{

	  	 $data['tournaments'] = $this->tournament->get_tournaments();
	  	 $data['users'] = $this->tournament->get_all_players();
	  	 $data['results'] = $this->tournament->get_all_results(1, 'ALL');
	  	 $this->load->view('tournaments_view', $data);

	}
  }

  
  
}
?>