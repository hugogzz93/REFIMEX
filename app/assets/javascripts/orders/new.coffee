$(document).on 'orders#new:loaded', ->
	console.log 'orders new loaded'

	#update form
	$('#order_units').on 'change', (e) ->
		if(e.target.value <= 0)
			$(e.target).addClass('invalid')
		else 
			$(e.target).removeClass('invalid')
			$('#total_price').html( "$#{((gon.pp.final_price-gon.discount.ammount) * e.target.value).toFixed(2)}" )

	# load chart
	ctx = $('#price_chart')
	lineChart = new Chart(ctx, 
		type: 'line',
		data: gon.chart_data,
		options: {
			hover:
				mode: 'index'
			}
			)