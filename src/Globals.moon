export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard
export Filesystem = love.filesystem

assert require 'src/Utils'
StateMachine = assert require 'src/StateMachine'


input = assert require 'libs/Input'
export Input = input!

-- States
Debug = assert require 'src/states/debug'

export G_StateMachine = StateMachine {
  ['debug']: (params) -> Debug params
}
