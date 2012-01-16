$ ->
  $('#start_block').show()
window.show = (condition) ->
  switch condition
    when 'start'
      $('#start_block').show()
      $('#get_one').css('left', '85px')
    when 'open'
      $('#open_block').show()
      $('#get_one').css('left', '300px')
      $('#start').removeClass('active')
    when 'friend'
      $('#friend_block').show()
      $('#get_one').css('left', '500px')
      $('#start').removeClass('active')
    when 'add'
      $('#add_block').show()
      $('#get_one').css('left', '700px')
      $('#start').removeClass('active')
    when 'complete'
      $('#complete_block').show()
      $('#get_one').css('left', '900px')
      $('#start').removeClass('active')
window.hide = (condition) ->
  switch condition
    when 'start'
      $('#start_block').hide()
    when 'open'
      $('#open_block').hide()
      $('#get_one').css('left', '85px')
      $('#start_block').show()
      $('#start').addClass('active')
    when 'friend'
      $('#friend_block').hide()
      $('#get_one').css('left', '85px')
      $('#start_block').show()
      $('#start').addClass('active')
    when 'add'
      $('#add_block').hide()
      $('#get_one').css('left', '85px')
      $('#start_block').show()
      $('#start').addClass('active')
    when 'complete'
      $('#complete_block').hide()
      $('#get_one').css('left', '85px')
      $('#start').addClass('active')
      $('#start_block').show()
$ -> 
  $('#see_all').click ->
    $('.hiden').fadeIn(1000)
    $('.see_all').remove()

  arr = [
    id: "#first_name"
    msg: "First name cannot be blank"
  ,
    id: "#last_name"
    msg: "Last name cannot be blank"
  ,
    id: "#user_password"
    min_msg: 'Minimum 4 characters required' 
    match_msg: 'Password confirmation did not match'  
    len: 4
  ]
  $('#new_user').validate(arr)

  $('#user_email').blur ->
    $.getJSON '/test.json', (data) ->
      $.each data, (key,val) ->
        alert val
###
    $.ajax 
      type: 'get'
      url: '/test.json'
      datatype: 'json'
      contentType: 'application/json'
      success: (data) ->
        alert data[attr]

