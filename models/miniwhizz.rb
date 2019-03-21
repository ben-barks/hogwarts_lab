require_relative('../db/sql_runner')

class MiniWhizz

  attr_reader :first_name, :second_name, :house, :age, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save()
    sql = 'INSERT INTO hogwarts (first_name, second_name, house, age)
          VALUES ($1, $2, $3, $4)
          RETURNING *'
    values = [@first_name, @second_name, @house, @age]
    whizz_data = SqlRunner.run(sql, values)
    @id = whizz_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM hogwarts'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM hogwarts'
    hogwarts = SqlRunner.run(sql)
    result = hogwarts.map { |hogwarts| MiniWhizz.new(hogwarts) }
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM hogwarts WHERE id = $1'
    values = [id]
    hogwarts = SqlRunner.run(sql, values)[0]
    result = MiniWhizz.new(hogwarts)
    return result
  end

  def full_name()
    return "#{@first_name} #{@second_name}"
  end

end
