// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(function($) {
  // create a convenient toggleLoading function
  $("a[data-remote]").bind("ajax:beforeSend", function() { $("#ajax-indicator").show() });
  $("a[data-remote]").bind("ajax:complete", function() { $("#ajax-indicator").hide() });
});
