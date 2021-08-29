assert require 'src/Globals'
PSmanager = assert require 'src/ParticlesManager'
str = assert require 'assets/ParticaleSystems/stars'
with love
  .load = ->
    PSmanager\init 'assets/ParticaleSystems'
    Dump PSmanager.systems
    Push\setupScreen VIRTUAL_WIDTH, VIRTUAL_HEIGHT,
      WINDOW_WIDTH, WINDOW_HEIGHT, WindowSettings
    G_StateMachine\change 'debug'

  .update = (dt) ->
    G_StateMachine\update dt

  .draw = ->
    Push\start!
    G_StateMachine\draw!
    Push\finish!

