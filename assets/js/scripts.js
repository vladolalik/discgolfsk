$(function(){

	/* IMPORT - skryvanie, zobrazovanie formu pre vlozenie noveho turnaja
	-------------------------------------------------------*/
	$('#import-new-tournament-form').hide();
	$('#import-new-tournament').click(function(){
		console.log( $( this ).is(':checked') );
		if( $( this ).is(':checked') ){
			$('#import-new-tournament-form').slideDown();
			$('#import-existing-tournament').fadeOut();
		}else{
			$('#import-new-tournament-form').slideUp();
			$('#import-existing-tournament').fadeIn();
		}
	});
});
