if $('.width470').hasClass('snip_bck') 
  $ ->
    $('#rating').hide()
    $('#conv').hide()
    $('#usr').remove()
    $('#user_rating').remove()
    $("#<%= @id %>").find('.width470').find('b').contents().unwrap() 
    $('.right_box').prepend("<%=j render 'partial/user_rating' %>")
    $('.right_box').prepend("<%=j render 'partial/user', user_profile: @user_profile %>")
    $('.loadin').hide()
    checkedId = $("form.rating_ballot > input:checked").attr("id")
    $("form.rating_ballot > label[for=" + checkedId + "]").prevAll().andSelf().addClass "bright"
    user_checkedId = $("form.user_rating_ballot > input:checked").attr("id")
    $("form.user_rating_ballot > label[for=" + user_checkedId + "]").prevAll().andSelf().addClass "bright"
else
  $('.loadin').hide()
  $('#conv').show()
  $('#rating').show()
  
