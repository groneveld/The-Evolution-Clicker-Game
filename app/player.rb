# class Player
class Player
  attr_accessor :evolution_level,
                :summary_dna,
                :dna_required,
                :factor,
                :name_of_creature,
                :evolve_button,
                :db,
                :name

  def initialize(name)
    @name = name
    @summary_dna = 0
    @evolution_level = 1
    @factor = 1
    @db = DataBase.new
    if @db.player_get(@name)
      @evolution_level = @db.level
      @summary_dna = @db.dna
      @factor = @db.factor
    end
    @dna_required = @evolution_level * 10 * @factor
    @name_of_creature = @db.creatures[@evolution_level]
    @creature_introducing = Text.new('')
    @require_text = Text.new('')
    @evolve_button = Button.new
    @evolve_button.draw_lock
    invalidate
  end

  def invalidate
    @creature_introducing.remove
    @creature_introducing = Text.new(
      'I\'m ' + @name_of_creature + ' (level ' + @evolution_level.to_s + ')',
      x: 80, y: 80,
      size: 35,
      color: 'red',
      z: 10
    )
  end

  def change_name
    @name_of_creature = @db.creatures[@evolution_level]
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
    change_name
    invalidate
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
