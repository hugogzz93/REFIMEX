$ ->
  ctx = $('#product_chart')
  lineChart = new Chart(ctx, 
    type: 'line',
    data: gon.chart_data,
    options: {
      hover:
         mode: 'index'
    }
  )
  