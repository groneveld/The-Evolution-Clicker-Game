# class Bonus
class Bonus
  def initialize
    @sprite = Square.new(z: -1)
    @clip_width = 150
    @x = 0
    @y = 0
    @status = 'good'
  end

  def draw
    @x = rand(350)
    @y = rand(450)
    @sprite = Sprite.new(
      '../images/' + @status + '-bonus.png',
      x: @x, y: @y, z: 100,
      clip_width: @clip_width, time: 100, loop: true
    )
    @sprite.play
  end
end
