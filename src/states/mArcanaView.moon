Base = assert require 'src/states/baseState'
MinorArcanaGUI = assert require 'src/GUI/MinorArcana'

class MinorAV extends Base

  new: (minorA) =>
    Log.debug "In MinorAV state"
    MinorArcanaGUI\init minorA

  enter: (params) =>

  update: (dt) =>

  draw: =>

  exit: =>


MinorAV

