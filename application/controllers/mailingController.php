<?php

class MailingController extends CI_Controller {
  
  function __construct() {
    parent::__construct();
    $this->load->model('mail_model');
    $this->load->helper('form');
    $this->load->helper('url');
    $this->load->helper('typography');
    //$this->load->library('email');
  }     
  
  function index() {    
    $data['user'] = $this->mail_model->selectAll(); 
    $data['tournaments'] = $this->mail_model->selectTournaments();  
    $data['cathegories'] = $this->mail_model->selectCathegories(); 
    $this->load->view('mail_view', $data);     
  }
  
  function send(){
    $this->load->library('form_validation');    
    $this->form_validation->set_rules('from', 'sender adress', 'required|xss_clean|htmlspecialchars|valid_email');
    $this->form_validation->set_rules('to', 'destination adress', 'required|xss_clean|htmlspecialchars|valid_emails');
    $this->form_validation->set_rules('message', 'message text', 'required|xss_clean|htmlspecialchars');
    $this->form_validation->set_rules('subject', 'subject', 'required|xss_clean|htmlspecialchars');
    
    if ($this->form_validation->run()) {
      $config = array(
        'protocol' => "smtp",
        'smtp_host' => "ssl://smtp.googlemail.com",
        'smtp_port' => 465,
        'smtp_user' => "tguncaga@gmail.com",
        'smtp_pass' => "xxxxxxxxxxxtajne",
        'mailtype'  => "html", 
        'charset'   => "utf-8"
      );
      $this->load->library('email', $config);
      $this->email->set_newline("\r\n");  
      
      $params = array(
        'from' =>$_POST['from'],
        'to' =>$_POST['to'],
        'subject' =>$_POST['subject'],
        'message' =>$_POST['message'],
      );  
      
      $cc_adresses = array();
      if (isset($_POST['mail_tournaments'])) {  
        $tmp = array();
        foreach($_POST['mail_tournaments'] as $obj) {
          $tmp[] = '\''.$obj.'\'';
        }         
        foreach($this->mail_model->selectMailByTournamentNames($tmp) as $obj) {
          $cc_adresses[] = $obj->email;
        }
      }        
      if (isset($_POST['mail_categories'])) {  
        $tmp = array();
        foreach($_POST['mail_categories'] as $obj) {
          $tmp[] = '\''.$obj.'\'';
        }         
        foreach($this->mail_model->selectMailByCategoryNames($tmp) as $obj) {
          $cc_adresses[] = $obj->email;
        }
      }
      if (isset($_POST['mail_users'])) {        
        //$params['cc'] = implode(", ", $_POST['mail_users']);
        foreach($_POST['mail_users'] as $obj) {
          $cc_adresses[] = $obj;
        } 
      }
      
      if (!empty($cc_adresses)) {
        $cc_unique = (array_unique($cc_adresses));
        $params['cc'] = implode(", ", $cc_unique);
        $data['sent_cc'] = $cc_unique;        
      }                       
          
      //$this->mail_model->send($params);
      
      $data['sent_to'] = $_POST['to'];      
      $data['user'] = $this->mail_model->selectAll();    
      $data['tournaments'] = $this->mail_model->selectTournaments();  
      $data['cathegories'] = $this->mail_model->selectCathegories();  
      $this->load->view('mail_view', $data);
      //$this->load->view('mail_send_view');      
    } else {
      $data['user'] = $this->mail_model->selectAll();    
      $data['tournaments'] = $this->mail_model->selectTournaments();  
      $data['cathegories'] = $this->mail_model->selectCathegories();  
      $this->load->view('mail_view', $data); 
    }    
  }     
}