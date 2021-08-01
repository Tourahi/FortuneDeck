assert require 'src/Globals'
with love
  .load = ->
    majorArcana = {}
    Utils.recEnumerateFiles "/assets/majorA",majorArcana
    Dump {:majorArcana}

