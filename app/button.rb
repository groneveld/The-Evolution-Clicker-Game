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

end