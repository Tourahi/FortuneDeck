Base = assert require 'src/states/baseState'
SelectOpt = assert require 'src/Controls/SelectOpt'
Button = assert require 'src/Controls/Button'

class Debug extends Base

  new: (params) =>
    @UImanager = MeowC.core.Manager\getInstance!
    startOpt = SelectOpt\new 'assets/fonts/basteleur/fonts/ttf/Basteleur-Bold.ttf',
      "Start", MeowC.core.Colors.violet, 100
    with startOpt
      \setPos WINDOW_WIDTH/2 - 150 , WINDOW_HEIGHT/2
    @UImanager.rootCtrl.coreContainer\addChild startOpt
    print startOpt\getSize!

  enter: (params) =>

  update: (dt) =>

  draw: =>

  exit: =>


Debug
