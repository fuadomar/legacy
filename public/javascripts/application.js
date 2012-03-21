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
