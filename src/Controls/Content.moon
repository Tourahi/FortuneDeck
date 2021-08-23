Control = MeowC.core.Control
Theme = MeowC.core.Theme
Graphics = love.graphics

Content = Control\extend "Content",{
  theme: nil
  isHovered: false
}

with Content
  .init = =>
    @super.init(self)
    @theme = table.copy(Theme\getInstance!\getProperty "content")
    @setClip true
    @setEnabled true
    -- event Connections
    @on "UI_DRAW", @onDraw, self
    @on "UI_MOUSE_ENTER", @onMouseEnter, self
    @on "UI_WHELL_MOVE", @onWheelMove, self

  .onDraw = =>
    Graphics.push!
    box = self\getBoundingBox!
    color = @theme.backgroundColor
    trsp = @theme.transparency
    r, g, b, a = Graphics.getColor!
    Graphics.setColor color[1], color[2], color[3], trsp
    Graphics.rectangle "fill", box\getX!, box\getY!, box\getWidth!, box\getHeight!

    -- Border
    oldLW = Graphics.getLineWidth!
    Graphics.setLineWidth @theme.stroke
    Graphics.setLineStyle "rough"
    local color
    color = @theme.strokeColor
    Graphics.setColor color[1], color[2], color[3], color[4]
    Graphics.rectangle "line", box.x, box.y, box\getWidth!, box\getHeight!
    Graphics.setLineWidth oldLW

    Graphics.setColor r, g, b, a
    Graphics.pop!

  .onMouseEnter = =>
    print self






return Content
