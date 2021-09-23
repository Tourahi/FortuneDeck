export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard
export Audio = love.audio
export Filesystem = love.filesystem
export Mouse = love.mouse
export Push  = assert require 'libs/push'
export Log = assert require 'libs/log/log'


assert require 'libs/MeowCore'
assert require 'src/Utils'
StateMachine = assert require 'src/StateMachine'


input = assert require 'libs/Input'
export Input = input!

-- States
Main = assert require 'src/states/main'
Deck = assert require 'src/states/deck'
MinorAV = assert require 'src/states/mArcanaView'

export G_StateMachine = StateMachine {
  ['main']: (params) -> Main params
  ['deck']: (params) -> Deck params
  ['minorav']: (params) -> MinorAV params
}

-- Assets
export MajorArcana = {}
export MinorArcana = {
  cups: {
    name: "cups"
  }
  pentacles: {
    name: "pentacles"
  }
  swords: {
    name: "swords"
  }
  wands: {
    name: "wands"
  }
}

export MajorArcanaControls = {}
export MinorArcanaControls = {
  cups: {}
  pentacles: {}
  swords: {}
  wands: {}
}


Utils.recEnumerateFiles "/assets/majorA",MajorArcana
Utils.recEnumerateFiles "/assets/minorA/cups",MinorArcana.cups
Utils.recEnumerateFiles "/assets/minorA/pentacles",MinorArcana.pentacles
Utils.recEnumerateFiles "/assets/minorA/swords",MinorArcana.swords
Utils.recEnumerateFiles "/assets/minorA/wands",MinorArcana.wands

Utils.initArcanaControls!




-- Window
export WindowSettings = {
  vsync: false,
  fullscreen: false,
  resizable: true
}

export Fonts = {
  Basteleur: 'assets/fonts/basteleur/fonts/ttf/Basteleur-Bold.ttf'
  OuroborosR: 'assets/fonts/ouroboros-master/fonts/Ouroboros-Regular.otf'
  TricksterM: 'assets/fonts/Trickster-master/fonts/Trickster-Reg.ttf'
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
  sounds: {
    "bowl": Audio.newSource "assets/sounds/bowl.wav", "stream"
    "welcome": Audio.newSource "assets/sounds/welcome.wav", "stream"
  }
}



-- size of the actual window
export WINDOW_WIDTH = 1280
export WINDOW_HEIGHT = 720

-- virtual size
export VIRTUAL_WIDTH = 1280
export VIRTUAL_HEIGHT = 720
