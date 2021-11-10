File = assert require 'src/File'
Json = assert require 'libs/json'

class Cards
  new: (src = nil) =>
    assert src != nil, "The source file should be provided. [Cards]"
    @src = src
    @cards = {
      major: {}
      wands: {}
      cups: {}
      swords: {}
      coins: {}
    }
    @raw = Json.decode File.readFile(src)
    @init!
    @raw = nil

  init: =>
    for k, v in ipairs @raw.tarot_interpretations
      switch v.suit
        when "wands"
          @cards.wands[v.name] = v
        when "cups"
          @cards.cups[v.name] = v
        when "swords"
          @cards.swords[v.name] = v
        when "coins"
          @cards.coins[v.name] = v
        when "major"
          @cards.major[v.name] = v

  getCards: =>
    @cards

  getMajor: =>
    @cards.major

  getWands: =>
    @cards.wands

  getCups: =>
    @cards.cups

  getSwords: =>
    @cards.swords

  getCoins: =>
    @cards.coins


