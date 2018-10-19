$(window).bind("load", function() {

  $('#prompt-text-area').on( 'change keyup keydown paste cut', 'textarea', function (){
    $(this).height(0).height(this.scrollHeight);
  }).find( 'textarea' ).change();

});
