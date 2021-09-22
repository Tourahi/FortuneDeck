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

    @Cups = SelectOpt\new Fonts.Basteleur,
      "Cups", Colors.steelblue, 30
    @Pentacles = SelectOpt\new Fonts.Basteleur,
      "Pentacles", Colors.darkviolet, 30
    @Swords = SelectOpt\new Fonts.Basteleur,
      "Swords", Colors.dimgray, 30
    @Wands = SelectOpt\new Fonts.Basteleur,
      "Wands", Colors.firebrick, 30

    _, @minorArcana = Utils.initArcanaControls!

    @root = Manager\getInstanceRoot!
    @ContentCups = Content\new!
    @ContentPentacles = Content\new!
    @ContentSwords = Content\new!
    @ContentWands = Content\new!

    with @ContentCups
      \setPos 250, 200
      \setSize 180, 303
      \setClip true
    with @ContentPentacles
      \setPos 461, 200
      \setSize 180, 303
    with @ContentSwords
      \setPos 672, 200
      \setSize 180, 303
    with @ContentWands
      \setPos 883, 200
      \setSize 180, 303


    -- selects
    @initSelect @Cups, {300, 150}, false, false, {2, 2}
    @initSelect @Pentacles, {470, 150}, false, false, {2, 2}
    @initSelect @Swords, {700, 150}, false, false, {2, 2}
    @initSelect @Wands, {915, 150}, false, false, {2, 2}

    @root\addChildCore @ContentCups
    with @minorArcana['acecups']
      \setPos 10, 10
      \onHover () ->
        @Cups\setBgColor Colors.black
        @ContentCups\setStrokeColor Colors.black
      \onLeave () ->
        @Cups\setBgColor Colors.white
        @ContentCups\setStrokeColor Colors.grey

    @ContentCups\addChild @minorArcana['acecups']

    @root\addChildCore @ContentPentacles
    with @minorArcana['acepentacles']
      \setPos 10, 10
      \onHover () ->
        @Pentacles\setBgColor Colors.black
        @ContentPentacles\setStrokeColor Colors.black
      \onLeave () ->
        @Pentacles\setBgColor Colors.white
        @ContentPentacles\setStrokeColor Colors.grey
    @ContentPentacles\addChild @minorArcana['acepentacles']

    @root\addChildCore @ContentSwords
    with @minorArcana['aceswords']
      \setPos 10, 10
      \onHover () ->
        @Swords\setBgColor Colors.black
        @ContentSwords\setStrokeColor Colors.black
      \onLeave () ->
        @Swords\setBgColor Colors.white
        @ContentSwords\setStrokeColor Colors.grey
    @ContentSwords\addChild @minorArcana['aceswords']

    @root\addChildCore @ContentWands
    with @minorArcana['acewands']
      \setPos 10, 10
      \onHover () ->
        @Wands\setBgColor Colors.black
        @ContentWands\setStrokeColor Colors.black
      \onLeave () ->
        @Wands\setBgColor Colors.white
        @ContentWands\setStrokeColor Colors.grey
    @ContentWands\addChild @minorArcana['acewands']

    @root\addChildCore @Cups
    @root\addChildCore @Pentacles
    @root\addChildCore @Swords
    @root\addChildCore @Wands

  .initSelect = (node, pos, enabled, cliped, bgOffset) =>
    with node
      \setPos pos[1], pos[2]
      \setEnabled enabled
      \setClip cliped
      \setBgOffset bgOffset[1], bgOffset[2]


