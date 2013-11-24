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
		$this->load->model('tournament');
		$this->load->helper(array('form','url','typography','file'));
	}

	function index(){
		echo('index function');
	}

	function import(){
		$this->load->view('tournaments_import');
	}
	

	/** 
	* Uploadnutie a vytvorenie docasneho suboru pre import
	* !pozor -> aby fungovalo treba nahradit v /config/memes 'csv'	=>	array('application/vnd.ms-excel', 'text/anytext', 'text/plain', 'text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel'),
	* @return string
	*/
	function do_upload(){
		$config['upload_path'] = './uploads/';
		$config['allowed_types'] = 'csv';
		$config["file_name"] = IMPORTED_TMP_FILE_NAME; // ulozene v config/constants
		$config["overwrite"] = TRUE;

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload("userfile")){
			$error = array('error' => $this->upload->display_errors());
			$this->load->view('tournaments_import',$error);
		}
		else{
			$data = array('upload_data' => $this->upload->data());
			redirect('tournaments/parse_imported_data');
		}
	}

	function parse_imported_data(){
		$dataString =  file_get_contents('./uploads/'.IMPORTED_TMP_FILE_NAME.'.csv', true);
		$validation_errors = "";
		$lines = explode("\n",$dataString);
		foreach ($lines as $row) {
			$values = explode(":",$row);
			if( strlen( $values[0] ) > 0 ){
				if(  ( (string) $values[0] !== "n" ) && ( (string)$values[0] !== "f" ) ){ //ak je to riadok s menom, priezviskom...

					// vyplname kvoli vstavanej validacii, aby sme mohli vyuzit napr xss_clean
					$_POST['name'] 			= $values[0];					//ulozime
					$_POST['surname']		= $values[1];
					$_POST['nationality'] 	= $values[2];
					$_POST['category']		= $values[3];

					$name					= $values[0];					//ulozime
					$surname				= $values[1];
					$nationality 			= $values[2];
					$category				= $values[3];

					// validacia zisteneho hraca
					$this->load->library('form_validation');
					$this->form_validation->set_rules('name', '', 'trim|required|xss_clean|htmlspecialchars');
					$this->form_validation->set_rules('surname', '', 'trim|required|xss_clean|htmlspecialchars');
					$this->form_validation->set_rules('nationality', '', 'trim|required|xss_clean|htmlspecialchars');
					$this->form_validation->set_rules('category', '', 'trim|required|xss_clean|htmlspecialchars');
					

					if ($this->form_validation->run())
					{
						echo"ok";
						// zistit ci existuje ak neexistue vytvorit
					}else{
						echo"zleje";
						//
					}

					debug('Meno: ' . $name . ' priezvisko: ' . ' narodnost: ' . $nationality . ' kategoria ' . $category );
				}else if( $values[0] === "n" ){					//ak je riadok normalne kolo
					$laps = array();
					$correct_row = TRUE;
					for($i = 1; $i < count($values); $i++){		// prechadzame vysledky a ukladame do pola
						$holeCount = 0;
						if( is_numeric( $values[$i] ) ){
							$laps[$i] =  $values[$i];
							$holeCount++;
						}else{
							$correct_row = FALSE;
						}
					}
					// v poli $laps je kolo aktualneho hraca
					debug($laps);
					//skontrolovat validnost
					// ulozit aktualnemu hracovi
				} else if( $values[0] === "f"  ){
					$final_laps = array();
					$correct_row = TRUE;
					for($i = 1; $i < count($values); $i++){		// prechadzame vysledky a ukladame do pola
						$holeCount = 0;
						if( is_numeric( $values[$i] ) ){
							$final_laps[$i] =  $values[$i];
							$holeCount++;
						}else{
							$correct_row = FALSE;
						}	
					}
					// v poli $final_laps je kolo aktualneho hraca
					debug('finale');
					debug($final_laps);
					//skontrolovat validnost
					// ulozit aktualnemu hracovi
				}	
			}
			debug('<br/>'.'-----------------------------novy riadok-----------'.'<br/>');
		}
	}
}
?>