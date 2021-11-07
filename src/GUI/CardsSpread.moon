SelectOpt = assert require 'src/Controls/SelectOpt'
CButton = assert require 'src/Controls/CircleButton'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux
PSmanager = assert require 'src/ParticlesManager'


CardsSpread = {}

with CardsSpread
  .init = (cards) =>
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT
    @root = Manager\getInstanceRoot!
    @cards = cards
    @initCards!


    
  .initCards = =>
    X = 50
    Off = 85
    for k, v in pairs @cards
      with v
        \setPos X, 70
        \setScale 0.5, 0.5
      @root\addChildCore v
      X += Off


