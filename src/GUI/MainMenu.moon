SelectOpt = assert require 'src/Controls/SelectOpt'
CButton = assert require 'src/Controls/CircleButton'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux


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

    with @Reading
      \setPos WINDOW_W/2 - (@Reading.textDrawable\getWidth! / 2) , WINDOW_H/2.4
      \setBgOffset 3, 3
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
      \onHover () ->
        @Deck\setBgColor Colors.magenta
      \onLeave () ->
        @Deck\setBgColor Colors.white
      \onClick () ->
        @Deck\setEnabled false
        t = Flux.to @Deck, 2, {alpha: 0}
        t\oncomplete () ->
          @root\removeChildCore @Deck

    with @logo
      \setRadius 30
      \setPos @logo\getRadius! + 10, WINDOW_H - @logo\getRadius! - 10
      \setIcon Assets.logo
      \onClick () ->
        Flux.to(@logo.boundingBox, 4, {x: WINDOW_W/2})\ease("cubicout")
        Flux.to(@logo.boundingBox, 4, {y: WINDOW_H/2 + 50})\ease("linear")

    with @moonNew
      \setRadius 64
      --\setPos @Reading\getX! + 350, @Reading\getY! + 100
      \setPos WINDOW_W/2 , WINDOW_H/4
      \setIcon Assets.moon[1]
      \setScale 0.5, 0.5
      \onClick () ->
        Flux.to(@moonNew.boundingBox, 2, {x: @Reading\getX! + 350})\ease("cubicout")
        t = Flux.to(@moonNew.boundingBox, 2, {y: @Reading\getY! + 100})\ease("linear")
        t\oncomplete () ->
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
                Flux.to(@logo.boundingBox, 2, {y: WINDOW_H/2 + 150})\ease("linear")

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



MainMenu
