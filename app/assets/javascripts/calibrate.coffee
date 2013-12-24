$('document').ready ->
  $('.calibrate').click ->
    $.get('/faces/' + $(@).data('id') + '.json', (msg)->
      face = new Face(msg.face, $('.calibration-zone'))
    )
    $('#calibrateFace').modal('show')
