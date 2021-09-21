SelectOpt = assert require 'src/Controls/SelectOpt'
CButton = assert require 'src/Controls/CircleButton'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux
PSmanager = assert require 'src/ParticlesManager'


MajorArcana = {}

with MajorArcana
  .init = (p) =>
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT
