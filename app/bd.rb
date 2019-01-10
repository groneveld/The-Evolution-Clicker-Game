require 'pg'

# class DataBase
class DataBase
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
end
