assert require 'src/Globals'

with love
  .load = ->
    G_StateMachine\change 'debug'
    -- Utils.recEnumerateFiles "/assets/majorA",majorArcana

  .update = (dt) ->
    G_StateMachine\update dt
    
  .draw = ->
    G_StateMachine\draw!
