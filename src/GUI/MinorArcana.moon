SelectOpt = assert require 'src/Controls/SelectOpt'
Content = assert require 'src/Controls/Content'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux
PSmanager = assert require 'src/ParticlesManager'
CardsSpread = assert require 'src/GUI/CardsSpread'


MinorArcana = {}

with MinorArcana
  .init = =>
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT

    Utils.initArcanaControlsMinor!

    @Cups = SelectOpt\new Fonts.Basteleur,
      "Cups", Colors.steelblue, 30
    @Pentacles = SelectOpt\new Fonts.Basteleur,
      "Pentacles", Colors.darkviolet, 30
    @Swords = SelectOpt\new Fonts.Basteleur,
      "Swords", Colors.dimgray, 30
    @Wands = SelectOpt\new Fonts.Basteleur,
      "Wands", Colors.firebrick, 30



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

    with MinorArcanaControls.cups['acecups']
      \setPos 10, 10
    @selectHover_anim MinorArcanaControls.cups['acecups'], @Cups, @ContentCups

    @ContentCups\addChild MinorArcanaControls.cups['acecups']

    @root\addChildCore @ContentPentacles
    with MinorArcanaControls.pentacles['acepentacles']
      \setPos 10, 10
    @selectHover_anim MinorArcanaControls.pentacles['acepentacles'], @Pentacles, @ContentPentacles
    @ContentPentacles\addChild MinorArcanaControls.pentacles['acepentacles']

    @root\addChildCore @ContentSwords
    with MinorArcanaControls.swords['aceswords']
      \setPos 10, 10
    @selectHover_anim MinorArcanaControls.swords['aceswords'], @Swords, @ContentSwords
    @ContentSwords\addChild MinorArcanaControls.swords['aceswords']

    @root\addChildCore @ContentWands
    with MinorArcanaControls.wands['acewands']
      \setPos 10, 10
      \onClick () ->
        @root\dropChildrenCore!
        CardsSpread\init MinorArcanaControls.wands

    @selectHover_anim MinorArcanaControls.wands['acewands'], @Wands, @ContentWands
    @ContentWands\addChild MinorArcanaControls.wands['acewands']

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
  
  .selectHover_anim = (node, Select, ctnt) =>
    with node
      \onHover () ->
        Select\setBgColor Colors.black
        ctnt\setStrokeColor Colors.black
        @slideSelectY Select, Select\getY! - 10
      \onLeave () ->
        Select\setBgColor Colors.white
        ctnt\setStrokeColor Colors.grey
        @slideSelectY Select, Select\getY!


