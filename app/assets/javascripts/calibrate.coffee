$('document').ready ->
  $('.calibrate').click ->
    $.get('/faces/' + $(@).data('id') + '.json', (msg)->
      console.log msg
    )
    $('#calibrateFace').modal('show')
