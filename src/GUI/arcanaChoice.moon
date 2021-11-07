SelectOpt = assert require 'src/Controls/SelectOpt'
Manager = MeowC.core.Manager
Colors = MeowC.core.Colors
Flux = MeowC.core.Flux
ImageCanvas = assert require 'src/Controls/ImageCanvas'


arcanaC = {}

with arcanaC
  .init = =>
    WINDOW_W = WINDOW_WIDTH
    WINDOW_H = WINDOW_HEIGHT

    -- @initArcanaControls!

    @root = Manager\getInstanceRoot!

    @Major = SelectOpt\new Fonts.OuroborosR,
      "Major", Colors.green, 90

    @Minor = SelectOpt\new Fonts.OuroborosR,
      "Minor", Colors.magenta, 90

    with @Major
      \setAlpha 0
      \setEnabled false
      \setPos WINDOW_W/2 - (@Major.textDrawable\getWidth! / 2) , WINDOW_H/2 - 100
      \setBgOffset 3, 3
      \setClip false
      \onHover () ->
        @Major\setBgColor Colors.magenta
      \onLeave () ->
        @Major\setBgColor Colors.white


    with @Minor
      \setAlpha 0
      \setEnabled false
      \setPos WINDOW_W/2 - (@Major.textDrawable\getWidth! / 2) , WINDOW_H/2 + 20
      \setBgOffset 3, 3
      \setClip false
      \onHover () ->
        @Minor\setBgColor Colors.green
      \onLeave () ->
        @Minor\setBgColor Colors.white
      \onClick () ->
        @gotoMinorAV!

    @root\addChildCore @Major
    @root\addChildCore @Minor

    @optEmerging!


  .optEmerging = =>
    Flux.to @Major, 2, {alpha: 1}
    t = Flux.to @Minor, 2, {alpha: 1}
    t\oncomplete () ->
      @Major\setEnabled true
      @Minor\setEnabled true

  .gotoMinorAV = (p) =>
    @root.coreContainer\disableChildren!
    Flux.to @Major, 2, {alpha: 0}
    t = Flux.to @Minor, 2, {alpha: 0}
    t\oncomplete () ->
      @root\dropChildrenCore!
      G_StateMachine\change 'minorav', p




