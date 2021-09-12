assert require 'src/Globals'
PSmanager = assert require 'src/ParticlesManager'
str = assert require 'assets/ParticaleSystems/stars'

MManager = MeowC.core.Manager

with love
  .load = ->
    PSmanager\init 'assets/ParticaleSystems'
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,
      WINDOW_WIDTH, WINDOW_HEIGHT, WindowSettings
    G_StateMachine\change 'main'

  .update = (dt) ->
    PSmanager\update dt
    MManager\update dt
    G_StateMachine\update dt

  .draw = ->
    PSmanager\draw!
    Push\start!
    G_StateMachine\draw!
    MManager\draw!
    Push\finish!

  .mousepressed = (x, y, button) ->
    MManager\mousepressed x, y, button

  .keypressed = (key, is_r) ->
    MManager\keypressed key, is_r

  .mousemoved = (x, y, button) ->
    MManager\mousemoved x, y, button

  .mousereleased = (x, y, button) ->
    MManager\mousereleased x, y, button

  .wheelmoved = (x, y) ->
    MManager\wheelmoved x, y

  .keyreleased = (key) ->
    MManager\keyreleased key

  .textinput = (text) ->
    MManager\textinput text

  .resize = (w, h) ->
    Push\resize w, h

