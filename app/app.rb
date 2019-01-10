require 'ruby2d'

require_relative './bd'
require_relative './player'
require_relative './button'
require_relative './save_button'
require_relative './bonus'
require_relative './sprite'
require_relative './window'
require_relative './game'

window = MyWindow.new

on :key_down do |event|
  if window.is_enter
    window.username += event.key if event.key !~ /\w./
    window.username = window.username.chop if event.key == 'backspace'
  end
  if event.key == 'return'
    game = Game.new(window.username)
    window.is_enter = false
    window.init_game
  end
end

update do
  if window.is_enter
    window.show_input_name
  else
  	window.save_button.check
  end
end

on :mouse_down do |event|
  window.save_button.click(event.x, event.y)
end

show