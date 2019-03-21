require_relative('../db/sql_runner')
require_relative('./house')

class MiniWhizz

  attr_reader :first_name, :second_name, :house, :age, :id, :house_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def house()
    # sql = 'SELECT * FROM houses WHERE id = $1'
    # values = [@house_id]
    # hashes = SqlRunner.run(sql, values)
    # objects = House.new(hashes)
    # return objects
    house = House.find(@house_id)
    return house
  end

  def save()
    sql = 'INSERT INTO whizzies (first_name, second_name, house, age)
          VALUES ($1, $2, $3, $4)
          RETURNING *'
    values = [@first_name, @second_name, @house, @age]
    whizz_data = SqlRunner.run(sql, values)
    @id = whizz_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM whizzies'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM whizzies'
    whizzies = SqlRunner.run(sql)
    result = whizzies.map { |whizzies| MiniWhizz.new(whizzies) }
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM whizzies WHERE id = $1'
    values = [id]
    whizzies = SqlRunner.run(sql, values)[0]
    result = MiniWhizz.new(whizzies)
    return result
  end

  def full_name()
    return "#{@first_name} #{@second_name}"
  end

end
