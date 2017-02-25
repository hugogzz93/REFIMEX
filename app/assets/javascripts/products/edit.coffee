$(document).on 'products#edit:loaded', ->
	console.log 'products edit loaded'
	ctx = $('#product_chart')
	debugger
	lineChart = new Chart(ctx, 
  	type: 'line',
  	data: gon.chart_data,
  	options: {
    	hover:
      mode: 'index'
	  }
  )
