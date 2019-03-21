require_relative('../models/miniwhizz')
require('pry')

MiniWhizz.delete_all()

miniwhizz1 = MiniWhizz.new({
  "first_name" => "Grant",
  "second_name" => "Rutherford",
  "house" => "Ravenclaw",
  "age" => 31
  })

miniwhizz2 = MiniWhizz.new({
  "first_name" => "Ben",
  "second_name" => "Barker",
  "house" => "Ravenclaw",
  "age" => 27
  })

  miniwhizz1.save()
  miniwhizz2.save()

  # MiniWhizz.all()
  # MiniWhizz.find(11)

  binding.pry
  nil
