swal "<%= j @message %>", "<%= j @submessage %>", "<%= j @type %>"
$('li[modifier-id=<%= @object.id %>] .price').html "$ <%= @object.price %>"
