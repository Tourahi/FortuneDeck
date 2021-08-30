Base = assert require 'src/states/baseState'
arcanaC = assert require 'src/GUI/arcanaChoice'

class Deck extends Base

  new: (params) =>
    Log.debug "In deck state"
    arcanaC\init!

  enter: (params) =>

  update: (dt) =>

  draw: =>

  exit: =>


Deck

