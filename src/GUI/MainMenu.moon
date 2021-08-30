SelectOpt = assert require 'src/Controls/SelectOpt'
CButton = assert require 'src/Controls/CircleButton'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux
PSmanager = assert require 'src/ParticlesManager'


MainMenu = {}

with MainMenu
  .init = =>
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT

    @root = Manager\getInstanceRoot!

    @Reading = SelectOpt\new Fonts.Basteleur,
      "Reading", Colors.violet, 45

    @Deck = SelectOpt\new Fonts.Basteleur,
      "Deck", Colors.violet, 45

    @logo = CButton\new!

    @moonNew = CButton\new!
    @moonWaxingC = CButton\new!
    @moonFirstQ = CButton\new!
    @moonWaxingG = CButton\new!
    @moonFull = CButton\new!

    PSmanager\setActive 'stars', true
    PSmanager\addParticleSpawnPos 'stars', {x:0,y:0}
    PSmanager\start 'stars'


    with @Reading
      \setPos WINDOW_W/2 - (@Reading.textDrawable\getWidth! / 2) , WINDOW_H/2.4
      \setEnabled false
      \setBgOffset 3, 3
      \setAlpha 0
      \onHover () ->
        @Reading\setBgColor Colors.magenta
      \onLeave () ->
        @Reading\setBgColor Colors.white
      \onClick () ->
        @Reading\setEnabled false
        t = Flux.to @Reading, 2, {alpha: 0}
        t\oncomplete () ->
          @root\removeChildCore @Reading

    with @Deck
      \setPos WINDOW_W/2 - (@Deck.textDrawable\getWidth! / 2) , WINDOW_H/2
      \setBgOffset 3, 3
      \setAlpha 0
      \setEnabled false
      \onHover () ->
        @Deck\setBgColor Colors.magenta
      \onLeave () ->
        @Deck\setBgColor Colors.white
      \onClick () ->
        -- @Deck\setEnabled false
        @gotoDeck!
        --t\oncomplete () ->
          --@root\removeChildCore @Deck

    with @logo
      \setRadius 30
      \setPos @logo\getRadius! + 10, WINDOW_H - @logo\getRadius! - 10
      \setIcon Assets.logo
      \setEnabled false
      \onClick () ->
        PSmanager\stop 'stars'

    with @moonNew
      \setRadius 64
      --\setPos @Reading\getX! + 350, @Reading\getY! + 100
      \setPos WINDOW_W/2 , WINDOW_H/4
      \setIcon Assets.moon[1]
      \setScale 0.5, 0.5
      \onClick () ->
        Flux.to(@Reading, 10, {alpha: 1})
        Flux.to(@Deck, 10, {alpha: 1})
        Assets.sounds["bowl"]\play!
        @anim_disableAll!
        Flux.to(@moonNew.boundingBox, 2, {x: @Reading\getX! + 350})\ease("cubicout")
        t = Flux.to(@moonNew.boundingBox, 2, {y: @Reading\getY! + 100})\ease("linear")
        t\oncomplete () ->
          @anim_moon!


    with @moonWaxingC
      \setRadius 64
      --\setPos @Reading\getX! + 350, @Reading\getY! + 100
      \setPos WINDOW_W/2 , WINDOW_H/4
      \setIcon Assets.moon[2]
      \setScale 0.5, 0.5

    with @moonFirstQ
      \setRadius 64
      --\setPos @Reading\getX! + 350, @Reading\getY! + 100
      \setPos WINDOW_W/2 , WINDOW_H/4
      \setIcon Assets.moon[3]
      \setScale 0.5, 0.5

    with @moonWaxingG
      \setRadius 64
      --\setPos @Reading\getX! + 350, @Reading\getY! + 100
      \setPos WINDOW_W/2 , WINDOW_H/4
      \setIcon Assets.moon[4]
      \setScale 0.5, 0.5

    with @moonFull
      \setRadius 64
      --\setPos @Reading\getX! + 350, @Reading\getY! + 100
      \setPos WINDOW_W/2 , WINDOW_H/4
      \setIcon Assets.moon[5]
      \setScale 0.5, 0.5

    @root\addChildCore @Reading
    @root\addChildCore @Deck
    @root\addChildCore @logo
    @root\addChildCore @moonNew



  .anim_disableAll = =>
    @moonNew\setEnabled false
    @moonWaxingC\setEnabled false
    @moonFirstQ\setEnabled false
    @moonWaxingG\setEnabled false
    @moonFull\setEnabled false
    @logo\setEnabled false
    @Deck\setEnabled false
    @Reading\setEnabled false

  .anim_enableAll = =>
    @moonNew\setEnabled true
    @moonWaxingC\setEnabled true
    @moonFirstQ\setEnabled true
    @moonWaxingG\setEnabled true
    @moonFull\setEnabled true
    @logo\setEnabled true
    @Deck\setEnabled true
    @Reading\setEnabled true

  .anim_moon = =>
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT
    @root\addChildCore @moonWaxingC
    Flux.to(@moonWaxingC.boundingBox, 2, {x: @Reading\getX! + 300})\ease("cubicout")
    t = Flux.to(@moonWaxingC.boundingBox, 2, {y: @Reading\getY! - 50})\ease("linear")
    t\oncomplete () ->
      @root\addChildCore @moonFirstQ
      @root\addChildCore @moonWaxingG
      Flux.to(@moonWaxingG.boundingBox, 2, {x: @Reading\getX! - 80})\ease("cubicout")
      t = Flux.to(@moonWaxingG.boundingBox, 2, {y: @Reading\getY! - 50})\ease("linear")
      t\oncomplete () ->
        @root\addChildCore @moonFull
        Flux.to(@moonFull.boundingBox, 2, {x: @Reading\getX! - 125})\ease("cubicout")
        t = Flux.to(@moonFull.boundingBox, 2, {y: @Reading\getY! + 90})\ease("linear")
        t\oncomplete () ->
          Flux.to(@logo.boundingBox, 2, {x: WINDOW_W/2})\ease("cubicout")
          t = Flux.to(@logo.boundingBox, 2, {y: WINDOW_H/2 + 150})\ease("linear")
          t\oncomplete () ->
            Assets.sounds["bowl"]\stop!
            Assets.sounds["welcome"]\play!
            @anim_enableAll!
            with @moonNew
              \onClick () -> nil

  .gotoDeck = =>
    @root.coreContainer\disableChildren!
    Flux.to @Deck, 2, {alpha: 0}
    Flux.to @moonNew, 2, {alpha: 0}
    Flux.to @moonWaxingC, 2, {alpha: 0}
    Flux.to @moonFirstQ, 2, {alpha: 0}
    Flux.to @moonWaxingG, 2, {alpha: 0}
    Flux.to @moonFull, 2, {alpha: 0}
    Flux.to @logo, 2, {alpha: 0}
    t = Flux.to @Reading, 2, {alpha: 0}
    t\oncomplete () ->
      @root\dropChildrenCore!
      G_StateMachine\change 'deck'






MainMenu
