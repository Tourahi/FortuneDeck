-- assert require 'src/Globals'

export Oracle = {
  avatar: Graphics.newImage "assets/oracle/wizard-color.jpg"
  font: Graphics.newFont Fonts.TricksterM, 21
}

Talkies.font = Oracle.font

Oracle.sayHello = ->
  Talkies.say "Orcale", "Welcome Child. \n
    Choose your card.",{
    image: Oracle.avatar
  }