$('document').ready ->
  $('.calibrate').click ->
    $.get('/faces/' + $(@).data('id') + '.json', (msg)->
      Window.face = new Face(msg.face, $('.calibration-zone'))
    )

    $('#calibrateFace').modal('show')
  
  # make sure the hotkeys don't work when the modal is open
  $('#calibrateFace').on 'hidden.bs.modal', ->
    $(document).unbind 'keydown'

  # when the calibration modal opens
  # handle calibration hotkeys
  $('#calibrateFace').on 'show.bs.modal', ->
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

      Window.face.setTranslationOffset offset
      Window.face.setScale scale
      Window.face.setRotation rotation
    )
