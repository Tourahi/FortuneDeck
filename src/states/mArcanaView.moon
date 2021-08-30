Base = assert require 'src/states/baseState'

class MinorAV extends Base

  new: (minorA) =>
    @minorA = minorA
    Log.debug "In MinorAV state"

  enter: (params) =>

  update: (dt) =>

  draw: =>

  exit: =>


MinorAV

