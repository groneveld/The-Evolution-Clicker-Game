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