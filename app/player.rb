# class Player
class Player
	attr_accessor :evolution_level,
                :summary_dna,
                :dna_required,
                :factor

  def initialize(name)
    @name = name
    @summary_dna = 0
    @evolution_level = 1
    @factor = 1
    @dna_required = @evolution_level * 10 * @factor
    @require_text = Text.new('')
    @evolve_button = Button.new
    @evolve_button.draw_lock
  end

  def draw_require
    @require_text.remove
    @require_text = Text.new(
      'Required: ' + @dna_required.to_s + ' DNA',
      x: 705, y: 155,
      size: 17,
      color: '#FFFFE0',
      z: 10
    )
  end

  def button_invalidate
    if @summary_dna >= @dna_required
      @evolve_button.draw_unlock
    else
      @evolve_button.draw_lock
    end
 end

  def levels_up
    @evolution_level += 1
    @factor += @evolution_level
    @summary_dna -= @dna_required
    @dna_required = @evolution_level * 10 * @factor
    if @summary_dna >= @dna_required
      @evolve_button.draw_unlock
    else
      @evolve_button.draw_lock
    end
  end

end

# class Creature
class Creature < Player
  attr_accessor :dna_per_sec,
                :factor

  def initialize(dna)
    @dna_per_sec = dna
    @factor = 1.0
  end

  def evolve(level)
    @factor += level / 10
    @dna_per_sec += @factor
  end

  def impact_on_player(player)
    player.summary_dna = player.summary_dna + @dna_per_sec
  end
end