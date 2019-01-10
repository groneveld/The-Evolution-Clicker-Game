# class Bonus
class Bonus
  attr_accessor :x,
                :y,
                :is_on_screen,
                :status

  def initialize
    @sprite = Square.new(z: -1)
    @clip_width = 150
    @x = 0
    @y = 0
    @status = 'good'
    @music = Music.new('../sound/' + @status + '-bonus.mp3')
    @is_on_screen = false
  end

  def draw
    @is_on_screen = true
    @x = rand(350)
    @y = rand(450)
    @sprite = Sprite.new(
      '../images/' + @status + '-bonus.png',
      x: @x, y: @y, z: 100,
      clip_width: @clip_width, time: 100, loop: true
    )
    @sprite.play
  end

  def check
    if Time.now.to_i >= @start_time + @bonus_time && @is_on_screen == false
      draw
      @finish_time = @start_time + @bonus_time + 5
      @start_time = Time.now.to_i
      @bonus_time = @rnd.rand(5..15)
    end
    if Time.now.to_i >= @finish_time && @is_on_screen == true
      remove
      init_bonus
    end
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

  def click(x, y, player, value)
    if x > @x && x < @x + 150 && y > @y && y < @y + 150
      return unless is_on_screen

      if @status == 'good'
        player.summary_dna += value * 10
      else
        player.summary_dna = 0
      end
      @music.play
      remove
    end
  end

  def remove
    @is_on_screen = false
    @sprite.remove
  end
end
