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
end