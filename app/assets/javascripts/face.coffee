@Face = (attr, canvas)->
  @image = attr.image
  @sclae = attr.scale
  @rotate = attr.rotate
  @id = attr.id
  @canvas = canvas
  @transition = {x: attr.transition_x, y: attr.transition_y}

  @pos = {x: 262, y: 150}
  @canvas.empty()
  @$face = null
  @height = 0
  @width = 0
  @init_render().then =>
    @update()

@Face.prototype.init_render = ->
  dfd = new $.Deferred()
  face = $('<div></div>').addClass('face').append('<img src="' + @image + '"></img>')

  @$face = face
  _this = this

  @$face.find('img').on 'load',  ->
    __this = this
    _this.canvas.append(face)

    interval = setInterval ->
      console.log 'checking'
      _this.height = $(__this).height()
      _this.width = $(__this).width()
      return if _this.height is 0
      console.log 'done'
      clearInterval interval
      dfd.resolve( "hurray" )
    , 10

  dfd.promise()

@Face.prototype.update = ->
  height = @height
  width  = @width

  offset_x = width/2
  offset_y = height/2

  console.log @$face.width()
  debugger
  @$face.css
    top:  (@pos.y - offset_y) + 'px'
    left: (@pos.x - offset_x) + 'px'

