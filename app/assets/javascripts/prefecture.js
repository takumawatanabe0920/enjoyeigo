$('select-parent').change(function() {
        var text = $('option:selected').text();

        console.log( text );
    });
