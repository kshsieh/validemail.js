jQuery ->
  $.fn.validEmail = ->

    validateEmail = =>
      input = $(@).text()
      replaceContent = ""
      matched = input.match(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/gi)
      i = 0
      if matched
        while i < matched.length
          replaceContent += "<span class='valid-email' contenteditable='false'>#{matched[i]}</span>&nbsp;"
          i++
        $(@).html(' ')
        $(@).prepend(replaceContent)

    validateEmail()

    # invalidates pressing of enter
    # keeps user from creating a new line in the field
    $(@).keypress (e) ->
      e.which isnt 13

    # if keypress is tab, space, or comma
    # clear replaced content
    # find matching emails, iterate through matches,
    # and replace with valid email spans after cleaning field
    # (unbinding comma for now until i get a fix)
    $(@).keydown (event) =>
      if event.keyCode is 9 or event.keyCode is 32 # or event.keyCode is 188
        validateEmail()

    # populates hidden field with all valid emails
    $(@).focusout ->
      emailsToSend = ""
      $('.valid-email').each () ->
        emailsToSend += $(@).text() + " "
      $('.js-emails-field').val(emailsToSend)
