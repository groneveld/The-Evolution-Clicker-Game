require 'pg'

# class DataBase
class DataBase
  attr_accessor :creatures,
                :level,
                :dna,
                :factor

  def initialize
    @creatures_conn = PG.connect(dbname: 'evolution')
    @creatures = {}
    creatures_get
    @players_conn = PG.connect(dbname: 'tecg_users')
  end

  def creatures_get
    @creatures_conn.exec('SELECT * FROM creatures') do |result|
      result.each do |row|
        @creatures[row['level'].to_i] = row['name'].strip
      end
    end
  end

  def player_get(name)
    @players_conn.exec("SELECT * FROM users WHERE name='#{name}'") do |result|
      unless result.values.empty?
        @level = result.values[0][1].to_i
        @dna = result.values[0][2].to_i
        @factor = result.values[0][3].to_i
      end
    end
  end

  def player_update(player)
    @players_conn.exec("SELECT * FROM users WHERE name='#{player.name}'") do |result|
      if !result.values.empty?
        @players_conn.exec("UPDATE users SET level = #{player.evolution_level}, dna = #{player.summary_dna}, factor = #{player.factor} WHERE name = '#{player.name}'")
      else
        @players_conn.exec("INSERT INTO users VALUES ('#{player.name}', #{player.evolution_level}, #{player.summary_dna}, #{player.factor})")
      end
    end
  end
end
