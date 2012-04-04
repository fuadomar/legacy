// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(function($) {
    // create a convenient toggleLoading function
    $("a[data-remote]").bind("ajax:beforeSend", function() {
        $("#ajax-indicator").show()
    });
    $("a[data-remote]").bind("ajax:complete", function() {
        $("#ajax-indicator").hide()
    });
});



$(document).ready(function(){
    $('#save_progess_submit_top').bind('click', function(){
        $('#new_medical_instruction .content form').submit();
    });
    $('#save_progess_submit_bottom').bind('click', function(){
        $('#new_medical_instruction .content form').submit();
    });

});


$(document).ready(function(){
    $('a[rel*=facebox]').facebox();
});


function validateDigit(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    if ((key < 48 || key > 57) && !(key == 8 || key == 9 || key == 13 || key == 37 || key == 39 || key == 46) ){
        theEvent.returnValue = false;
        if (theEvent.preventDefault) theEvent.preventDefault();
    }
}