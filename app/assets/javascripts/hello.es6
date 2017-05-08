// test es6
class Hello {
  constructor() {
    alert('Hello!');
  }
}

// new Hello();

$(document).on("click", "#teste", function(event){
	event.preventDefault();
	var person = prompt("Please enter your name", "Harry Potter");
	if (person != null) {
		var data_person = {"order_id" : $('.form').data('order-id'), "person_name" : person};
		$.ajax({
			url: "/orders/new_person",
			type: "POST",
			data: data_person,
			dataType: "js",
			success: function(result) {
				// console.log('successfully');
				// $("#list_people").html("<%= escape_javascript(render partial: 'form_person', locals: { f: @order.order_person } ) %>");
				$('#table_order_people tr:last').after(result);
				// result = data;
			}
		// }).done(function( result ) {
			// console.log(result);
		});
		// $('#table_order_people').after(result);
		// alert(result);
	}
});
