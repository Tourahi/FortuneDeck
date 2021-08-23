Control = MeowC.core.Control
import Colors from MeowUI.core.Theme
Graphics = love.graphics
import Flux from MeowUI.core

-- Extend from the Control class
ImageCanvas = Control\extend "ImageCanvas",{
  theme: nil
  isHovered: false
  drawable: nil
  rot: 0
  scaleX: 1
  scaleY: 1
  originOffsetX: 0
  originOffsetY: 0
  shearingX: 0
  shearingY: 0
  tween: nil
}

with ImageCanvas
  .init = (fileName) =>
    -- call the parent constructor
    @super.init(self)

    @setClip true
    @setEnabled true

    @setImage fileName

    -- event Connections
    @on "UI_DRAW", @onDraw, self

  .setImage = (filename) =>
    if filename
      @drawable = Graphics.newImage filename
      @resetSize!

  .resetSize = =>
    if @drawable
      @setWidth @drawable\getWidth! * @scaleX
      @setHeight @drawable\getHeight! * @scaleY
    else
      @setWidth 0
      @setHeight 0

  .onDraw = =>
    Graphics.push!
    box = @getBoundingBox!
    Graphics.draw @drawable, box\getX!, box\getY!,
      @rot, @scaleX, @scaleY, @originOffsetX, @originOffsetY,
      @shearingX, @shearingY
    Graphics.pop!

  .setScale = (sx = nil, sy = nil) =>
    @scaleX = sx or @scaleX
    @scaleY = sy or @scaleY

  .getScale = =>
    @scaleX, @scaleY

  .setOriginOffset = (ox = nil, oy= nil) =>
    @originOffsetX = ox or @originOffsetX
    @originOffsetY = oy or @originOffsetY

  .getOriginOffset = =>
    @originOffsetX, @originOffsetY

  .setShearing = (sx = nil, sy = nil) =>
    @shearingX = sx or @shearingX
    @shearingY = sx or @shearingY

  .scaleContactArea = (sx, sy) =>
    @setWidth @drawable\getWidth! * sx
    @setHeight @drawable\getHeight! * sy

  .move = =>
    if @scaleX > 0.5 and @scaleY > 0.5
      @tween = Flux.to self, 2, { scaleX: 0.5, scaleY: 0.5 }
      @tween\oncomplete () ->
        @resetSize!
        @tween = Flux.to @getBoundingBox!, 2, { x: @parent\getX! + @parent.theme.stroke,
          y: @parent\getY! + @parent.theme.stroke }



ImageCanvas
