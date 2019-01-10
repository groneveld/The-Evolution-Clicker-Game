# class Sprite
class MySprite
  def initialize
    @x = 181
    @y = 225
    @clip_width = 150
    @time = 200
    @loop = true
    @sprite = Square.new
    @music = Music.new('../sound/click.mp3')
  end

  def invalidate(creature)
    @sprite.remove
    @sprite = Sprite.new(
      "../images/sprites/#{creature}.png",
      x: @x,
      y: @y, z: 10,
      clip_width: @clip_width,
      time: @time,
      loop: @loop
    )
    @sprite.play
  end

  def click(x, y)
    return unless x > @x && x < @x + 150 && y > @y && y < @y + 150

    @music.play
    true
  end
end
