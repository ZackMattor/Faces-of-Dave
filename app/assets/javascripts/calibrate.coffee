$.fn.serializeObject = ->
  o = {}
  a = @serializeArray()
  $.each a, ->
    if o[@name] isnt `undefined`
      o[@name] = [o[@name]]  unless o[@name].push
      o[@name].push @value or ""
    else
      o[@name] = @value or ""
  o

$('document').ready ->
  $('.calibrate').click ->
    $.get('/faces/' + $(@).data('id') + '.json', (msg)->
      Window.face = new Face(msg.face, $('.calibration-zone'))

      $('#calibrate_face_form input[name="translate_x"]').val(Window.face.getTranslationOffset().x)
      $('#calibrate_face_form input[name="translate_y"]').val(Window.face.getTranslationOffset().y)
      $('#calibrate_face_form input[name="rotation"]').val(Window.face.getRotation())
      $('#calibrate_face_form input[name="scale"]').val(Window.face.getScale())
    )

    $('#calibrateFace').modal('show')
  
  # make sure the hotkeys don't work when the modal is open
  $('#calibrateFace').on 'hidden.bs.modal', ->
    $(document).unbind 'keydown'

  # when the calibration modal opens
  # handle calibration hotkeys
  $('#calibrateFace').on 'show.bs.modal', ->
    $('#submit-calibration').click ->
      $.ajax
        data: {face: $('#calibrate_face_form').serializeObject()}
        url: '/faces/' + Window.face.id + '/calibrate'
        type: 'put'
        success: ->
          $('#calibrateFace').modal 'hide'

    $(document).bind("keydown", (e)->
      UP    = 38
      DOWN  = 40
      LEFT  = 37
      RIGHT = 39

      offset = Window.face.getTranslationOffset()
      scale = Window.face.getScale()
      rotation = Window.face.getRotation()

      switch e.keyCode
        when UP
          if e.shiftKey
            scale += .01
          else
            offset.y -= 1

        when DOWN
          if e.shiftKey
            scale -= .01
          else
            offset.y += 1

        when LEFT
          if e.shiftKey
            rotation -= 1
          else
            offset.x -= 1

        when RIGHT
          if e.shiftKey
            rotation += 1
          else
            offset.x += 1

      $('#calibrate_face_form input[name="translate_x"]').val(offset.x)
      $('#calibrate_face_form input[name="translate_y"]').val(offset.y)
      $('#calibrate_face_form input[name="rotation"]').val(rotation)
      $('#calibrate_face_form input[name="scale"]').val(scale)
      
      Window.face.setTranslationOffset offset
      Window.face.setScale scale
      Window.face.setRotation rotation
    )
