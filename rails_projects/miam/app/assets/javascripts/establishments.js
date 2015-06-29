$(document).ready(function() {
  alert("coucou");
  
  $("#choix_bieres").on("keyup", function() {
    var queryString = 'prefix=' + $(this).val();
    console.log(queryString);
    $.get( '/cities/search_cities', queryString, false, "script");
  });
});