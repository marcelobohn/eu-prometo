// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require Chart.min
//= require_tree .


function click() {
  console.log('click')
}

// $(document).on('page:change', function(event) {
// $(document).on('load', function(event) {
  // page_ready();
// });

// $('document').ready(function(){
//   page_ready();
// });

// function page_ready(){
//   $('#state_id').on('change',function(){
//     get_cities($(this).val());
//   });
// };

$(document).on("change", "#state_id", function(event){
  event.preventDefault();
  get_cities($(this).val());
});

function get_cities(state_id) {
  $('#city_id').empty();
  if (state_id > 0) {
    $.ajax({
     type: "POST",
     url: "/address/cities",
     data: { id: state_id, needs_manager: true },
     dataType: 'json',
     success: function(cities) {
       $('#city_id').append('<option value=""></option>');
       $(cities).each(function(index,city) {
         $('#city_id').append('<option value="' + city.id + '">' + city.name + '</option>');
       });
     }
   })
 };
};