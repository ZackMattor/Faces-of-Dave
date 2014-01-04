@Face = (attr, canvas)->
  @image = attr.image
  @scale = attr.scale
  @rotation = attr.rotation
  @id = attr.id
  @canvas = canvas
  @translate = {x: attr.translate_x, y: attr.translate_y}

  @pos = {x: 274, y: 140}
  @canvas.empty()
  @$face = null
  @height = 0
  @width = 0
  @init_render().then =>
    @update()
  return

@Face.prototype.init_render = ->
  dfd = new $.Deferred()
  face = $('<div></div>').addClass('face').append('<img src="' + @image + '"></img>')

  @$face = face
  _this = this

  @$face.find('img').on 'load',  ->
    __this = this
    _this.canvas.append(face)

    # this is how we make sure the image is loaded in the dom before we start
    interval = setInterval ->
      _this.height = $(__this).height()
      _this.width = $(__this).width()
      return if _this.height is 0
      clearInterval interval
      dfd.resolve( "hurray" )
    , 10

  dfd.promise()

@Face.prototype.update = ->
  height = @height
  width  = @width

  offset_x = width/2
  offset_y = height/2

  console.log @scale
  transformString = 'scale(' + @scale + ') rotate(' + @rotation + 'deg)'


  @$face.css
    top:  (@pos.y - offset_y + @translate.y) + 'px'
    left: (@pos.x - offset_x + @translate.x) + 'px'
    '-webkit-transform': transformString,
    '-moz-transform': transformString,
    '-ms-transform': transformString,
    '-o-transform': transformString,
    'transform': transformString,

####
# GETTERS
####
@Face.prototype.getTranslationOffset = ->
  @translate

@Face.prototype.getScale = ->
  @scale

@Face.prototype.getRotation = ->
  @rotation

####
# SETTERS
####
@Face.prototype.setRotation = (rotation)->
  @rotation = rotation
  @update()

@Face.prototype.setScale = (scale)->
  @scale = scale
  @update()

@Face.prototype.setTranslationOffset = (pos)->
  @translate.x = pos.x if pos.x
  @translate.y = pos.y if pos.y
  @update()
