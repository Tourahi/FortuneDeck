assert require 'src/Globals'
PSmanager = assert require 'src/ParticlesManager'
str = assert require 'assets/ParticaleSystems/stars'

with love
  .load = ->
    PSmanager\init 'assets/ParticaleSystems'
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,
      WINDOW_WIDTH, WINDOW_HEIGHT, WindowSettings
    G_StateMachine\change 'main'

  .update = (dt) ->
    G_StateMachine\update dt

  .draw = ->
    G_StateMachine\draw!

