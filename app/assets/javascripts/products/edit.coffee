# $ ->
#   userList = new List 'edit-product-page', valueNames: ['name']


#   $('.edit_product').on 'click', (e) ->
#     $('.active').removeClass 'active'
#     $('.edit_product').addClass 'active'

#   $('.search').on 'click', (e) ->
#     $('.active').removeClass 'active'

#   $('li').on 'click', (e) ->
#     $('.active').removeClass 'active'
#     $(e.target).closest 'li'
#                .addClass 'active'
#                .find 'input'
#                .focus()


#   $(document).on 'keypress', (e) ->
#     elem = $($(':focus')[0])
#     if e.which == 13 && $(':focus').hasClass 'discount' #on enter
#       $('#modifier_user_id').val elem.attr 'user-id'
#       $('#modifier_ammount').val elem.val()
#       $('#modifier_id').val elem.attr 'modifier-id'
#       $('form.hidden').submit()
