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
game = 0

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

tick = 0

update do
  if window.is_enter
    window.show_input_name
  else
    game.player.draw_require
    game.bonus.check
    game.player.evolve_button.check
    window.save_button.check
    game.creature.impact_on_player(game.player) if (tick % 120).zero?
    tick += 1
    game.player.button_invalidate
    window.dna_invalidate(game.player.summary_dna)
  end
end

on :mouse_down do |event|
  unless window.is_enter
    game.bonus.click(event.x, event.y, game.player, game.creature.dna_per_sec)
    game.player.evolve_button.click(event.x, event.y, game)
    window.save_button.click(event.x, event.y, game)
    if game.sprite.click(event.x, event.y)
      game.creature.impact_on_player(game.player)
    end
  end
end

show
