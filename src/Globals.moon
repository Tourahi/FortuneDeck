export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard
export Filesystem = love.filesystem

assert require 'src/Utils'

input = assert require 'libs/Input'
export Input = input!
