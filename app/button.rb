require 'date'

# class Button
class Button < Window
  attr_accessor :status,
                :time,
                :warning

  def initialize
    @x = 700
    @y = 80
    @width = 150
    @height = 65
    @z = 1
    @status = 'locked'
    @time = 0
    @text = Text.new('')
    @rect = Rectangle.new
    @warning = Text.new('')
    @music = Music.new('../sound/level-up.mp3')
    @music.volume = 60
   end

  def show
    @rect.remove
    @rect = Rectangle.new(x: @x, y: @y,
                          width: @width, height: @height,
                          color: @color, z: 1)
    @text.remove
    @text = Text.new('Evolve!',
                     x: 740, y: 100, size: 20,
                     color: @text_color,
                     z: 2)
  end

  def draw_lock
    @color = '#B0C4DE'
    @status = 'locked'
    @text_color = '#2F4F4F'
    show
  end

  def draw_unlock
    @color = '#FF6347'
    @status = 'unlocked'
    @text_color = '#FFFFE0'
    show
  end

  def show_warning
    @warning.remove
    @time = Time.now.to_i
    @warning = Text.new(
      'Not enough DNA!',
      x: 710, y: 50,
      size: 17,
      color: '#FFA07A',
      z: 2
    )
  end

  def check
    @warning.remove if Time.now.to_i - @time >= 2
  end

  def click(x, y, game)
    if x > @x && x < @x + @width && y > @y && y < @y + @height
      if @status == 'locked'
        show_warning
      else
        game.player.levels_up
        game.creature.evolve(game.player.evolution_level)
        @music.play
        game.sprite_invalidate
      end
    end
  end
end
