# class Player
class Player
	attr_accessor :evolution_level,
                :summary_dna,
                :dna_required,
                :factor

  def initialize
    @summary_dna = 0
    @evolution_level = 1
    @factor = 1
    @dna_required = @evolution_level * 10 * @factor
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