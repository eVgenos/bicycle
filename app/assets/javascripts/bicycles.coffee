$(document).on 'turbolinks:load', ->
  $('#search-bicycles input').keyup ->
    $.get $('#search-bicycles').attr('action'), $('#search-bicycles').serialize(), null, 'script'
    false
  return
