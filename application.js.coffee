# custom contains functions that should be loaded before others in the tree.
#= require jquery
#= require jquery_ujs
#= require jquery-1.7.min.js
#= require custom
#= require_tree .

String::trim = ->
  @replace /^\s+|\s+$/g, ""

String::atrim = ->
  @replace /\s+/, ""

$ ->
  $("#last_browsed_id").change ->
    window.location = "/conversations/"+$(this).val() 

$.extend $.fn, 
  blank: ->
    if $(this).val() == ''
      true
    else
      false

$.extend $.fn, 
  validate: (arr)->
    $(this).submit ->    # trigger on submit
      $('.errors').html('')    # clear prev error values
      @submt = true            # returning true will submit the action
      for hsh in arr           
        if ( hsh.id.match 'password' ) && hsh.confirm  # for passwords only
          id = hsh.id + '_confirmation' # find the password confirmation field
          err_id = hsh.id + '_error' 
          unless $(hsh.id).val().length > hsh.len-1
            $(err_id).html(hsh.min_msg)
            @submt = false
          unless $(hsh.id).val() == $(id).val()
            $(err_id).html(hsh.match_msg)
            @submt = false
        else                               
          if id= hsh.error_id
            id = hsh.error_id
            $(hsh.error_id).html('')    
          else
            id = hsh.id + '_error' 
          unless $(hsh.id).val()     # Check if field is blank 
            $(id).html(hsh.msg)
            @submt = false
      if navigator.appName == "Microsoft Internet Explorer"
        $("input[type=text]").each ->
          if $(this).attr('placeholder') && $(this).blank()
            $(this).val($(this).attr('placeholder')) # add placeholder back
        $("input[type=password]").each ->
          if $(this).attr('placeholder') && $(this).blank()
            $(this).val($(this).attr('placeholder')) # add placeholder back
            document.getElementById($(this).attr('id')).type = 'text' # Show text 
      @submt


