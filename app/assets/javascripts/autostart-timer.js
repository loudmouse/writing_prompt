document.addEventListener("turbolinks:load", function() {
  var clicked = false;
  $("#prompt_body").keyup(function(event) {
      if (event && clicked === false) {
          $("#timer_start_button").click();
          clicked = true;
      }
  });
});
