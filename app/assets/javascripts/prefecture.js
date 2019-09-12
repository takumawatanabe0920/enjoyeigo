$(document).on('turbolinks:load', function() {
  $('#select-parent').change(function() {
        var text = $('option:selected').text();

        console.log( text );
     });
   });
