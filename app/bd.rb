require 'pg'

# class DataBase
class DataBase
  def initialize
    @creatures_conn = PG.connect(dbname: 'evolution')
    @creatures = {}
    @players_conn = PG.connect(dbname: 'tecg_users')
  end
end
