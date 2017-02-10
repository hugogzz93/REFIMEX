$ ->
  userList = new List 'edit-product-page', valueNames: ['name']


  $('.edit_product').on 'click', (e) ->
    $('.edit_product').addClass 'active'

  $('.content').on 'click', (e) ->
    $('.edit_product').removeClass 'active'