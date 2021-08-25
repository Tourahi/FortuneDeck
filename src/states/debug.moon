Base = assert require 'src/states/baseState'
MainMenu = assert require 'src/GUI/MainMenu'

class Debug extends Base

  new: (params) =>
    MainMenu\init!

  enter: (params) =>

  update: (dt) =>
    MainMenu\update!

  draw: =>

  exit: =>


Debug
