$(document).ready(function() {

$( "#vertical_slider" ).slider({ orientation: "vertical" })

// $( "#slider" ).slider({ animate: "fast" });

// console.log('hello worldsss')

$( ".main_wrapper" ).mouseup(function() {
	console.log('sfgsfd')
  // alert( "Handler for .mouseup() called." );
  $('#vertical_slider_value').html(($( ".vertical_slider" ).slider( "value" ) * 11) + 700)
  $('#horizontal_slider_value').html(Math.floor($( ".horizontal_slider" ).slider( "value" ) * 3.65))
});
})