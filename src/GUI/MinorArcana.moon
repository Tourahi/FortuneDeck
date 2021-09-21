SelectOpt = assert require 'src/Controls/SelectOpt'
Content = assert require 'src/Controls/Content'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux
PSmanager = assert require 'src/ParticlesManager'


MinorArcana = {}

with MinorArcana
  .init = (mA) =>
    @minorA = mA
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT

    @minorArcana = {}

    _, @minorArcana = Utils.initArcanaControls!

    @root = Manager\getInstanceRoot!
    @ContentCups = Content\new!
    @ContentPentacles = Content\new!
    @ContentSwords = Content\new!
    @ContentWands = Content\new!

    with @ContentCups
      \setPos 250, 200
      \setSize 161, 283
    with @ContentPentacles
      \setPos 461, 200
      \setSize 161, 283
    with @ContentSwords
      \setPos 672, 200
      \setSize 161, 283
    with @ContentWands
      \setPos 883, 200
      \setSize 161, 283

    @root\addChildCore @ContentCups
    @root\addChildCore @ContentPentacles
    @root\addChildCore @ContentSwords
    @root\addChildCore @ContentWands


