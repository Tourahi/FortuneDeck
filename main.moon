assert require 'src/Globals'

cardIndx = 1

with love
  .load = ->
    Dump Input
    Input\bind 'a', ->
      if cardIndx == #majorArcana
        cardIndx = 1
      else
        cardIndx+=1
    export majorArcana = {}
    Utils.recEnumerateFiles "/assets/majorA",majorArcana
    Dump {:majorArcana}

  .draw = ->
    Graphics.draw majorArcana[cardIndx], 50, 50
