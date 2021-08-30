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

    @majorArcana = {}
    @minorArcana = {}

    @root = Manager\getInstanceRoot!

    @Major = SelectOpt\new Fonts.ArabicM,
      "Major", Colors.green, 90

    @Minor = SelectOpt\new Fonts.ArabicM,
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

    @root\addChildCore @Major
    @root\addChildCore @Minor

    @optEmerging!

    @initArcanaControls!

  .optEmerging = =>
    Flux.to @Major, 2, {alpha: 1}
    t = Flux.to @Minor, 2, {alpha: 1}
    t\oncomplete () ->
      @Major\setEnabled true
      @Minor\setEnabled true

  .initArcanaControls = =>
    n = 0
    for k, v in pairs MajorArcana
      @majorArcana[k] = ImageCanvas\new v
    for k, suit in pairs MinorArcana
      for k, v in pairs suit
        n+=1
        @minorArcana[k] = ImageCanvas\new v

    Log.info "All 56 cards loaded : ", n == 56





