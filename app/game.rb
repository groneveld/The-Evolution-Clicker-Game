# class Game
class Game
  attr_accessor :player,
                :sprite,
                :creature,
                :bonus

  def initialize(name)
    @player = Player.new(name)
    @sprite = MySprite.new
    sprite_invalidate
    @creature = Creature.new(10000)
    @bonus = Bonus.new
    @bonus.init_bonus
  end

  def sprite_invalidate
    @sprite.invalidate(@player.db.creatures[@player.evolution_level])
  end
end
