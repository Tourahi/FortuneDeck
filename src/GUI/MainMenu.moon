SelectOpt = assert require 'src/Controls/SelectOpt'
Button = assert require 'src/Controls/Button'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors

MainMenu = {}

with MainMenu
  .init = =>
    @root = Manager\getInstanceRoot!
    @startOpt = SelectOpt\new 'assets/fonts/basteleur/fonts/ttf/Basteleur-Bold.ttf',
      "Start", Colors.violet, 100
    with @startOpt
      \setPos WINDOW_WIDTH/2 - (@startOpt.textDrawable\getWidth! / 2) , WINDOW_HEIGHT/2
    @root\addChildCore @startOpt

  .update = =>





MainMenu
