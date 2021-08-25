Control = MeowC.core.Control
Theme = MeowC.core.Theme
Graphics = love.graphics
Mouse = love.mouse

SelectOpt = Control\extend "SelectOpt",{
  isHovred: false
  isPressed: false
  text: ""
  color: nil
  LineHight: 1
  size: 0
  font: nil
  textDrawable: nil
  autoSize: true
  drawBg: true
  bgColor: nil
  bgOffsetX: 5
  bgOffsetY: 5
}


with SelectOpt
  .init = (font, text, color, size = 15) =>
    @super.init self
    @size = size
    @text = text
    @color = color
    @setClip true
    @setEnabled true
    @bgColor = {1, 1, 1, 1}

    if font
      @font = Graphics.newFont font, @size
    else
      @font = Graphics.newFont @size

    @textDrawable = Graphics.newText @font, @text
    @font\setLineHeight @LineHight
    @setContactArea!

    @on "UI_DRAW", @onDraw, self
    @on "UI_MOUSE_ENTER", @onMouseEnter, self
    @on "UI_MOUSE_LEAVE", @onMouseLeave, self
    @on "UI_MOUSE_DOWN", @onMouseDown, self
    @on "UI_MOUSE_UP", @onMouseUp, self


  .setContactArea = =>
    if @autoSize
      @setSize @textDrawable\getWidth!, @textDrawable\getHeight!
    else
      _, wt = @font\getWrap @text, @getWidth!
      text = ""
      for i, v in ipairs wt
        if i == #wt
          text ..= v
        else
          text ..= v .. "\n"
        @textDrawable\set text

  .onDraw = =>
    box = @getBoundingBox!
    r, g, b, a = Graphics.getColor!
    Graphics.setColor @color
    if @drawBg
      Graphics.setColor @bgColor
      Graphics.draw @textDrawable, box\getX! - @bgOffsetX , box\getY! - @bgOffsetY
      Graphics.setColor @color
    Graphics.draw @textDrawable, box\getX!, box\getY!
    Graphics.setColor r, g, b, a

  .onMouseDown = =>
    print "Start"

  .setColor = (c) =>
    @color = c

  .setBgColor = (c) =>
    @bgColor = c

  .setBgOffset = (ox = nil, oy = nil) =>
    @bgOffsetX = ox or @bgOffsetX
    @bgOffsetY = oy or @bgOffsetY

  .onMouseEnter = =>
    @isHovred = true
    if Mouse.getSystemCursor "hand"
      Mouse.setCursor(Mouse.getSystemCursor("hand"))

  .onMouseLeave = =>
    @isHovred = false
    Mouse.setCursor!

  .onMouseDown = (x, y) =>
    print "Start"
    @isPressed = true

  .onMouseUp = (x, y) =>
    @isPressed = false

SelectOpt




