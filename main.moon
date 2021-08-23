assert require 'src/Globals'

with love
  .load = ->
    G_StateMachine\change 'debug'

  .update = (dt) ->
    G_StateMachine\update dt
    
  .draw = ->
    G_StateMachine\draw!
