Base = assert require 'src/states/baseState'

class Debug extends Base
  new: (params) =>

  enter: (params) =>

  update: (dt) =>
    print "In debug state"


  draw: =>

  exit: =>


Debug
