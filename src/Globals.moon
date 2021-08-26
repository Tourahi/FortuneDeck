export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard
export Filesystem = love.filesystem
export Push  = assert require 'libs/push'

assert require 'src/Utils'
assert require 'libs/MeowCore'
StateMachine = assert require 'src/StateMachine'


input = assert require 'libs/Input'
export Input = input!

-- States
Debug = assert require 'src/states/debug'

export G_StateMachine = StateMachine {
  ['debug']: (params) -> Debug params
}

-- Assets
export MajorArcana = {}
export MinorArcana = {}

-- Utils.recEnumerateFiles "/assets/majorA",MajorArcana
-- Utils.recEnumerateFiles "/assets/minorA",MinorArcana

-- Window
export WindowSettings = {
  vsync: true,
  fullscreen: false,
  resizable: true
}

export Fonts = {
  Basteleur: 'assets/fonts/basteleur/fonts/ttf/Basteleur-Bold.ttf'
}

export Assets = {
  logo: 'assets/Logo.png'
  moon: {
    'assets/WhiteM/moon_new.png'
    'assets/WhiteM/moon_waxing_crescent.png'
    'assets/WhiteM/moon_first_qaurter.png'
    'assets/WhiteM/moon_waxing_gibbous.png'
    'assets/WhiteM/moon_full.png'
  }
}

-- size of the actual window
export WINDOW_WIDTH = 1280
export WINDOW_HEIGHT = 720

-- virtual size
export VIRTUAL_WIDTH = 432
export VIRTUAL_HEIGHT = 243
