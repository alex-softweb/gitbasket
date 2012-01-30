Array::delte = (element) ->
  ar = []
  while this[0]
    ar.unshift this.shift()
    ar.shift() if(parseInt(ar[0])==parseInt(element))
  ar.reverse()

window.onload = ->
  # Run this code only if an element with id 'tags' is found
  if $('#tags').val()
    # interrupt submission to pass values in hidden fields
    $('.before_submit').submit ->
      $('#ids').val(ids) 
      $('#emailz').val(emails) 
    names = []
    ids = []    # will rontain string elements
    emails = []
    arr = $('#tags').val().split(',')
    user_email = arr.shift().atrim()
    while arr[0]
      names.push {id: arr.shift(), value: arr.shift().trim(), img: arr.shift()}
    $ ->
      # Jquery UI autocomplete requires a hash for the selection menu
      $('.send_box').autocomplete(
        source: names
        # select is triggered when enter is pressed on an item. 
        select: (event, ui) ->    # ui.item refers to selected item  
          if ids.indexOf(ui.item.id) < 0   # Check if item already added
            $('.sendRow').append("<div class='users' id='"+ui.item.id+"' ><img src="+ui.item.img+"></img><b>"+ui.item.value+"</b><div class='remove_user'><a href='javascript:'>x</a></div></div>")
            ids.push ui.item.id   # ids stores added ikonverse user ids
            ui.item.value = ''      
        ).data("autocomplete")._renderItem = (ul, item) ->
          $("<li></li>").data("item.autocomplete", item).append("<a><img src="+item.img+"/> <b>"+item.value+"</b></a>").appendTo ul
      # _renderItem is overwritten to show custom selection

      # check for blur or enter key events
      $('.send_box').blur ->
        alrt $(this)
      $('.send_box').keypress (event)->
        if (event.keyCode==13)  # check if enter is pressed
          alrt $(this)

      alrt = (field) ->
        input = field.val() # get text field value
        # input is blank when enter is pressed on dropdown
        if (input == '')
        # blank out text field when user is selected from dropdown
          field.val('')  
        else if user_email == input.atrim()  # atrim clears all \s 
          $('.red_msg').html("You will be a part of the created Konversation")
          field.val('')  
        # check if email has already been entered
        else if emails.indexOf(input) > 0 
          $('.red_msg').html("You have already added that friend")
        # store string if it matches email pattern
        else if (input.match /.+@.+\..+/)
          $('.sendRow').append("<div class='users' id= 'email'><a><b></b>"+input+"</a><a href='javascript:' class='remove_user'>x</a></div>")
          emails.push input  # emails stores entered email address 
          field.val('')  
        # check if non email string is entered
        else if (input.match /\w/)
          $('.red_msg').html("Input should be an email address or select a friend from the list")
    
      $('.remove_user').livequery "click", ->
        id =  $(this).parents('.users').attr('id')
        $(this).parents('.users').remove()
        console.log ids
        console.log id
        ids.delte(id)
        console.log ids
