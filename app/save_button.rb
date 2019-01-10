# class Save_button
class Save_button < Window
  def initialize
    @x = 700
    @y = 380
    @width = 150
    @height = 65
    @z = 1
    @color = '#FF6347'
    @text_color = '#FFFFE0'
    @time = 0
    @text = Text.new('')
    @rect = Rectangle.new(z: -1)
    @warning = Text.new('')
  end

  def show
    @rect.remove
    @rect = Rectangle.new(x: @x, y: @y,
                          width: @width, height: @height,
                          color: @color, z: @z)
    @text.remove
    @text = Text.new('Save game!',
                     x: 725, y: 400, size: 20,
                     color: @text_color,
                     z: 2)
  end

  def show_warning
    @warning.remove
    @time = Time.now.to_i
    @warning = Text.new(
      'Game saved!',
      x: 720, y: 455,
      size: 17,
      color: '#33CCCC',
      z: 10
    )
  end

  def check
    @warning.remove if Time.now.to_i - @time >= 2
  end

  def click(x, y, game)
    if x > @x && x < @x + @width && y > @y && y < @y + @height
      game.player.db_update
      show_warning
    end
  end
end