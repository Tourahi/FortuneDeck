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

    -- content nodes
    @initContent @ContentCups, {250, 200}, {180, 303}, true
    @initContent @ContentPentacles, {461, 200}, {180, 303}, true
    @initContent @ContentSwords, {672, 200}, {180, 303}, true
    @initContent @ContentWands, {883, 200}, {180, 303}, true


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
        @slideSelectY @Cups, @Cups\getY! - 10
      \onLeave () ->
        @Cups\setBgColor Colors.white
        @ContentCups\setStrokeColor Colors.grey
        @slideSelectY @Cups, @Cups\getY!

    @ContentCups\addChild @minorArcana['acecups']

    @root\addChildCore @ContentPentacles
    with @minorArcana['acepentacles']
      \setPos 10, 10
      \onHover () ->
        @Pentacles\setBgColor Colors.black
        @ContentPentacles\setStrokeColor Colors.black
        @slideSelectY @Pentacles, @Pentacles\getY! - 10
      \onLeave () ->
        @Pentacles\setBgColor Colors.white
        @ContentPentacles\setStrokeColor Colors.grey
        @slideSelectY @Pentacles, @Pentacles\getY!
    @ContentPentacles\addChild @minorArcana['acepentacles']

    @root\addChildCore @ContentSwords
    with @minorArcana['aceswords']
      \setPos 10, 10
      \onHover () ->
        @Swords\setBgColor Colors.black
        @ContentSwords\setStrokeColor Colors.black
        @slideSelectY @Swords, @Swords\getY! - 10
      \onLeave () ->
        @Swords\setBgColor Colors.white
        @ContentSwords\setStrokeColor Colors.grey
        @slideSelectY @Swords, @Swords\getY!
    @ContentSwords\addChild @minorArcana['aceswords']

    @root\addChildCore @ContentWands
    with @minorArcana['acewands']
      \setPos 10, 10
      \onHover () ->
        @Wands\setBgColor Colors.black
        @ContentWands\setStrokeColor Colors.black
        @slideSelectY @Wands, @Wands\getY! - 10
      \onLeave () ->
        @Wands\setBgColor Colors.white
        @ContentWands\setStrokeColor Colors.grey
        @slideSelectY @Wands, @Wands\getY!
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

  .initContent = (node, pos, size, clipped) =>
    with node
      \setPos pos[1], pos[2]
      \setSize size[1], size[2]
      \setClip false
      \setStroke 5

  .slideSelectY = (node, y) =>
    Flux.to(node.boundingBox, 0.5, 
      {y: y})


