SelectOpt = assert require 'src/Controls/SelectOpt'
Button = assert require 'src/Controls/Button'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux


MainMenu = {}

with MainMenu
  .init = =>
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT

    @root = Manager\getInstanceRoot!

    @startOpt = SelectOpt\new 'assets/fonts/basteleur/fonts/ttf/Basteleur-Bold.ttf',
      "Start", Colors.violet, 100

    with @startOpt
      \setPos WINDOW_W/2 - (@startOpt.textDrawable\getWidth! / 2) , WINDOW_H/2
      \onHover () ->
        @startOpt\setBgColor Colors.magenta
      \onLeave () ->
        @startOpt\setBgColor Colors.white
      \onClick () ->
        @startOpt\setEnabled false
        t = Flux.to @startOpt, 2, {alpha: 0}
        t\oncomplete () ->
          @root\removeChildCore @startOpt



    @root\addChildCore @startOpt

  .update = =>






MainMenu
