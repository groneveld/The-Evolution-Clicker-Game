# class Bonus
class Bonus
  def initialize
    @sprite = Square.new(z: -1)
    @clip_width = 150
    @x = 0
    @y = 0
    @status = 'good'
    @music = Music.new('../sound/' + @status + '-bonus.mp3')
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

  def init_bonus
    @status = if rand(11) <= 6
                'good'
              else
                'bad'
              end
    @rnd = Random.new
    @start_time = Time.now.to_i
    @bonus_time = @rnd.rand(60..120)
    @finish_time = Time.now.to_i
  end
end
