$ ->
  userList = new List 'edit-product-page', valueNames: ['name']


  $('.edit_product').on 'click', (e) ->
    $('.edit_product').addClass 'active'

  $('#user-list, .search').on 'click', (e) ->
    $('.edit_product').removeClass 'active'

  $('li').on 'click', (e) ->
    $('li').removeClass 'active'
    $(e.target).addClass 'active'

  $(document).on 'keypress', (e) ->
    elem = $($(':focus')[0])
    if e.which == 13 && $(':focus').hasClass 'discount' #on enter
      $('#modifier_user_id').val elem.attr 'user-id'
      $('#modifier_ammount').val elem.val()
      $('#modifier_id').val elem.attr 'modifier-id'
      $('form.hidden').submit()
