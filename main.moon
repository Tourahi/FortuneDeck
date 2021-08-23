assert require 'src/Globals'

with love
  .load = ->
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,
      WINDOW_WIDTH, WINDOW_HEIGHT, WindowSettings
    G_StateMachine\change 'debug'

  .update = (dt) ->
    G_StateMachine\update dt

  .draw = ->
    Push\start!
    G_StateMachine\draw!
    Push\finish!
