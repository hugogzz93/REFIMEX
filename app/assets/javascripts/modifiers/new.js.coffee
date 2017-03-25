$(document).on 'modifiers#new:loaded', ->
  $('select').selectize();

  $('#new_modifier select').on 'change', () ->
    uid = $('#modifier_user_id').val()
    pid = $('#modifier_product_id').val()

    if uid && pid
      $.ajax({
        url: "/modifiers/find",
        data: {user_id: uid, product_id: pid},
        success: (e) ->
          $('#modifier_id').val e.id
          $('#modifier_ammount').val e.ammount
        ,
        dataType: "json"
      });


