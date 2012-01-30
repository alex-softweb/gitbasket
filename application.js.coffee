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

Array::empty = ->
  @length == 0

Array::delete = (element) ->
  ar = []
  while this[0]
    ar.unshift this.shift()
    ar.shift() if ar[0].atrim()==element
  ar.reverse()

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
        if hsh.confirm  # if confirmation is needed for a field
          id = hsh.id + '_confirmation' # find the password confirmation field
          err_id = hsh.id + '_error'
          unless $(hsh.id).val() == $(id).val()
            $(err_id).html(hsh.match_msg)
            @submt = false
          if ( hsh.id.match 'password' )  # for passwords check length
            unless $(hsh.id).val().length > hsh.len-1
              $(err_id).html(hsh.min_msg)
              @submt = false
          else      # for others check if blank
            unless $(hsh.id).val()
              $(err_id).html(hsh.msg)
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

jQuery.fn.ForceNumericOnly = ->
  @each ->
    $(this).keydown (e) ->
      key = e.charCode or e.keyCode or 0
      key is 8 or key is 9 or key is 46 or (key >= 37 and key <= 40) or (key >= 48 and key <= 57) or (key >= 96 and key <= 105)
