require 'ruby2d'

require_relative './window'

window = MyWindow.new

on :key_down do |event|
  if window.is_enter
    window.username += event.key if event.key !~ /\w./
    window.username = window.username.chop if event.key == 'backspace'
  end
  if event.key == 'return'
    #game = Game.new(window.username)
    window.is_enter = false
    window.init_game
  end
end