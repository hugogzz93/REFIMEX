$(document).on 'orders#new:loaded', ->
	console.log 'orders new loaded'
	ctx = $('#price_chart')
	lineChart = new Chart(ctx, 
  	type: 'line',
  	data: gon.chart_data,
  	options: {
    	hover:
      mode: 'index'
	  }
  )
