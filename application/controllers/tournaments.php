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
		$this->load->view('tournaments/import');
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
			$this->load->view('tournaments/import',$error);
		}
		else{
			$data = array('upload_data' => $this->upload->data());
			redirect('tournaments/parse_imported_data');
		}
	}

	function parse_imported_data(){
		$dataString =  file_get_contents('./uploads/'.IMPORTED_TMP_FILE_NAME.'.csv', true);
		debug($dataString);
		$lines = explode("\n",$dataString);
		
		/*begin - debug*/
		echo '<br/>'.'<br/>'.'<br/>';
		foreach ($lines as $row) {
			debug($row);
			echo '<br/>';
		}
		/*end - debug*/

		foreach ($lines as $row) {
			$values = explode(":",$row);
			foreach ($values as $value){
				debug('hodnota: '.$value.'<br/>');
			}
			debug('-----------------------------novy riadok-----------'.'<br/>');

			/* PSEUDO - ukladanie dat
			if( zacinaju_udaje_o_novom_hracovi() && nie_je_prvy() && je_koniec_suboru() ){
				if(skontroluj_ci_uz_existuhe()){
					insertni_jeho_data();
				}else{
					vytvor_hraca();
					insertni_jeho_data();
				}
				vycisti_data_o_aktualnom_hracovi();
			}else{
				ukladaj_data_o_aktualnom_hracovi();
			}
			*/
				
		}
	}
}
?>