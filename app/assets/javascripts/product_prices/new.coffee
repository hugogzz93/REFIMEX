$(document).on 'product_prices#new:loaded', ->
  $('#product_price_active_date').datepicker({
	  	minDate: new Date(),
	  	dateFormat: 'dd-mm-yy'
  	})
  
