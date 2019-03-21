require_relative('../db/sql_runner')
require_relative('./miniwhizz')

class House

  attr_reader :house_name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @house_name = options['house_name']
  end

  def miniwhizz
    sql = 'SELECT * FROM whizzies WHERE house_id = $1'
    values = [@id]
    hashes = SqlRunner.run(sql, values)
    objects = hashes.map { |hash| MiniWhizz.new(hash) }
    return objects
  end



  def save()
    sql = 'INSERT INTO houses (house_name)
          VALUES ($1)
          RETURNING *'
    values = [@house_name]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM houses'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM houses'
    hogwarts = SqlRunner.run(sql)
    result = hogwarts.map { |hogwarts| House.new(hogwarts) }
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM houses WHERE id = $1'
    values = [id]
    hogwarts = SqlRunner.run(sql, values)[0]
    result = House.new(hogwarts)
    return result
  end





end
