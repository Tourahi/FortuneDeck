Base = assert require 'src/states/baseState'
MainMenu = assert require 'src/GUI/MainMenu'
Manager = MeowC.core.Manager

class Debug extends Base

  new: (params) =>
    MainMenu\init!

  enter: (params) =>

  update: (dt) =>

  draw: =>

  exit: =>


Debug
