window.btn_like = (vr) ->
  t_id = $("#"+vr).find("#t_id").val()
  $.ajax
    url: '/snippet_rate/'+vr+"/1/"+t_id
    #url: '/snippets_rate'
    #data: {id : $(".comANS").attr('id')}

window.btn_dislike = (vr) ->
  t_id = $("#"+vr).find("#t_id").val()
  $.ajax
    url: '/snippet_rate/'+vr+"/0/"+t_id
    #url: '/snippets_rate'
    #data: {id : $(".comANS").attr('id')}    

window.load_snippets = (t_id)->
  $.ajax
    url: '/load_snippets/'+t_id

window.show_snippet_form = (topic_id) ->
  id = "#t_"+topic_id  
  $(id).find('#snippet_mood_id').val('')
  $(id).find('#snippet_description').val('')
  $(id).find('#moods td').css('border', '1px solid white')
  $(id).find('#snippet_form').show()
  mood_id = ($(id).find('#snippet_mood_id').val() || 3)-1
  $(id).find('#snippet_form').find('#moods').find("td:eq("+mood_id+")").css('border', '1px solid black') 
  $(id).find('.snippet_mini').hide()
  $(id).find('#snippet_description').focus()

$ ->
  $('.cancel_btn').livequery "click", ->
    id = '#' + $(this).parents('.topic_div').attr("id")
    $(id).find('#edit_form').remove()
    $(id).find('#snippet_form').hide()
    $(id).find('.snippet_mini').show()

  $('#moods td').livequery "click", ->
    id = '#' + $(this).parents('.topic_div').attr("id")
    $(id).find('#moods td').css('border', '1px solid white')
    $(this).css('border', '1px solid black')
    $(id).find('#snippet_mood_id').val($(this).attr('id'))

  $(".width470").livequery "click", ->
    parent = $(this).closest(".comANS")
    if $(this).css('background-color') == 'transparent'
      $('.width470').removeClass('snip_bck') 
      parent.find('.width470').addClass('snip_bck')
      $('.loadin').show()
      $.ajax url: "/load_user"+"?snip_id=" + parent.attr("id")
    else
      parent.find('.width470').removeClass('snip_bck') 
      $('#usr').remove()
      $('#user_rating').remove()
      $('#conv').show()
      $('#rating').show()
  $(".width470").livequery "hover", ->
    $(this).css "cursor", "pointer"

  $('#new_snippet').livequery 'submit', ->
    false unless $('#snippet_description').val()

  $('.see_more').livequery 'click', ->
    parent = $(this).parents('.comANS')
    parent.find(".small").hide()
    parent.find(".large").show()
    $(this).hide()
    parent.find('.see_less').show()

  $('.see_less').livequery 'click', ->
    parent = $(this).parents('.comANS')
    parent.find(".large").hide()
    parent.find(".small").show()
    $(this).hide()
    parent.find('.see_more').show()

